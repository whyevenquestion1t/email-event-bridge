# An event bridge should reside here
resource "aws_cloudwatch_event_rule" "rule" {
  name                = "5-minute-timer-email-alert"
  description         = "just_testing"
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "alert" {
  rule      = aws_cloudwatch_event_rule.rule.name
  target_id = "run_every_5_minutes"
  arn       = aws_ecs_cluster.alert.arn
  role_arn  = aws_iam_role.ecs_events.arn

  ecs_target {
    task_count          = 1
    task_definition_arn = aws_ecs_task_definition.alert.arn

    network_configuration {
      subnets         = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
      security_groups = [aws_security_group.ecs.id]
      assign_public_ip = true
    }
    launch_type = "FARGATE"
  }



}