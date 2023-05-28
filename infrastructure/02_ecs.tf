resource "aws_ecs_cluster" "alert" {
  name = "alert-cluster"
}
resource "aws_ecs_task_definition" "alert" {
  family                   = "email-alert-family-01"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048

  task_role_arn      = aws_iam_role.managed_ECS_role.arn
  execution_role_arn = aws_iam_role.managed_ECS_role.arn



  container_definitions = jsonencode([
    {
      name  = "email-alert-container-definition-final"
      image = "public.ecr.aws/g8f7r1w1/different-arch-email-test:latest"

      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

