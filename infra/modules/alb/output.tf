output "aws_alb_target_group_arn" {
  value = aws_alb_target_group.main.arn
}

output "alb_dns" {
  value = aws_lb.main.dns_name
}