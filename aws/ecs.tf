# ECS Cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.prefix}-ecs-cluster"
  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.kms_key.id
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.cloudwatch_log_group.name
      }

    }
  }
}

# Task Definition
resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "${var.prefix}-ecs-task"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode(
    [
      {
        "name" : "${var.prefix}-container",
        "image" : "${aws_ecr_repository.ecr.repository_url}:latest",
        "cpu" : 0,
        "memory" : 512,
        "memoryReservation" : 256,
        "essential" : true,
        "portMappings" : [
          {
            "containerPort" : 8080,
            "hostPort" : 0,
            "protocol" : "tcp"
          }
        ],
        "mountPoints" : [],
        "volumesFrom" : [],
        "secrets" : [
          {
            "name" : "TOKEN_SECRETKEY",
            "valueFrom" : "${aws_ssm_parameter.token_secret_key.name}"
          },
          {
            "name" : "CORS_PATH_PATTERNS",
            "valueFrom" : "${aws_ssm_parameter.cors_path_patterns.name}"
          },
          {
            "name" : "CORS_ORIGIN_PATTERNS",
            "valueFrom" : "${aws_ssm_parameter.cors_origin_patterns.name}"
          },
          {
            "name" : "CORS_ALLOWED_METHODS",
            "valueFrom" : "${aws_ssm_parameter.cors_allowed_methods.name}"
          },
          {
            "name" : "CORS_ALLOWED_HEADERS",
            "valueFrom" : "${aws_ssm_parameter.cors_allowed_headers.name}"
          },
          {
            "name" : "CORS_EXPOSED_HEADERS",
            "valueFrom" : "${aws_ssm_parameter.cors_exposed_headers.name}"
          },
          {
            "name" : "CORS_ALLOW_CREDENTIALS",
            "valueFrom" : "${aws_ssm_parameter.cors_allow_credentials.name}"
          },
          {
            "name" : "CORS_MAX_AGE",
            "valueFrom" : "${aws_ssm_parameter.cors_max_age.name}"
          },
          {
            "name" : "COOKIE_DOMAIN",
            "valueFrom" : "${aws_ssm_parameter.cookie_domain.name}"
          },
          {
            "name" : "COOKIE_PATH",
            "valueFrom" : "${aws_ssm_parameter.cookie_path.name}"
          },
          {
            "name" : "COOKIE_MAX_AGE",
            "valueFrom" : "${aws_ssm_parameter.cookie_max_age.name}"
          },
          {
            "name" : "DB_HOSTNAME",
            "valueFrom" : "${aws_ssm_parameter.db_hostname.name}"
          },
          {
            "name" : "DB_USERNAME",
            "valueFrom" : "${aws_ssm_parameter.db_username.name}"
          },
          {
            "name" : "DB_PASSWORD",
            "valueFrom" : "${aws_ssm_parameter.db_password.name}"
          },
          {
            "name" : "S3_URL",
            "valueFrom" : "${aws_ssm_parameter.s3_url.name}"
          },
          {
            "name" : "S3_ACCESS_KEY",
            "valueFrom" : "${aws_ssm_parameter.s3_access_key.name}"
          },
          {
            "name" : "S3_SECRET_KEY",
            "valueFrom" : "${aws_ssm_parameter.s3_secret_key.name}"
          },
          {
            "name" : "S3_BUCKET_NAME",
            "valueFrom" : "${aws_ssm_parameter.s3_bucket_name.name}"
          },
          {
            "name" : "S3_REGION",
            "valueFrom" : "${aws_ssm_parameter.s3_region.name}"
          },
          {
            "name" : "MAX_ATTEMPTS",
            "valueFrom" : "${aws_ssm_parameter.max_attempts.name}"
          },
          {
            "name" : "BACK_OFF_PERIOD",
            "valueFrom" : "${aws_ssm_parameter.back_off_period.name}"
          },
          {
            "name" : "KAKO_HOST",
            "valueFrom" : "${aws_ssm_parameter.kako_host.name}"
          },
          {
            "name" : "KAKO_ADMIN_KEY",
            "valueFrom" : "${aws_ssm_parameter.kako_admin_key.name}"
          },
          {
            "name" : "KAKO_TOKEN_URI",
            "valueFrom" : "${aws_ssm_parameter.kako_token_uri.name}"
          },
          {
            "name" : "KAKO_TOKEN_INFO_URI",
            "valueFrom" : "${aws_ssm_parameter.kako_token_info_uri.name}"
          },
          {
            "name" : "KAKO_ME_INFO_URI",
            "valueFrom" : "${aws_ssm_parameter.kako_me_info_uri.name}"
          },
          {
            "name" : "KAKO_UNLINK_URI",
            "valueFrom" : "${aws_ssm_parameter.kako_unlink_uri.name}"
          },
          {
            "name" : "KAKO_APP_REDIRECT_URI",
            "valueFrom" : "${aws_ssm_parameter.kako_app_redirect_uri.name}"
          },
          {
            "name" : "KAKO_APP_CLIENT_ID",
            "valueFrom" : "${aws_ssm_parameter.kako_app_client_id.name}"
          },
        ],
        "logConfiguration" : {
          "logDriver" : "awslogs",
          "options" : {
            "awslogs-group" : "${aws_cloudwatch_log_group.cloudwatch_log_group.name}",
            "awslogs-region" : "${var.region}",
            "awslogs-stream-prefix" : "ecs"
          }
        }
      }
    ]
  )
}

# ALB
resource "aws_alb" "alb" {
  name                       = "${var.prefix}-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_sg.id]
  subnets                    = [aws_subnet.public_a.id, aws_subnet.public_c.id]
  enable_deletion_protection = false
}

# ALB Target Group
resource "aws_alb_target_group" "alb_target_group" {
  name        = "${var.prefix}-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "instance"
  health_check {
    path                = "/actuator/health"
    protocol            = "HTTP"
    port                = "traffic-port"
    interval            = 300
    timeout             = 120
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# ALB Listener
resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_target_group.arn
  }
}

# ECS Service
resource "aws_ecs_service" "ecs_service" {
  name            = "${var.prefix}-ecs-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  desired_count   = 1
  launch_type     = "EC2"
  load_balancer {
    target_group_arn = aws_alb_target_group.alb_target_group.arn
    container_name   = "${var.prefix}-container"
    container_port   = 8080
  }
}
