output "lambda_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.lambda.arn
}
