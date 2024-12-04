provider "aws" {
  region = "us-east-1"
}

module "collector" {
  source = "github.com/spacelift-io-examples/terraform-aws-spacelift-events-collector"

  delete_events_when_destroying_stack = true # Required for the automated tests to succeed
}

# Access the outputs from the module
output "courier_function_arn" {
  description = "The ARN for the Lambda function for the courier"
  value       = module.collector.courier_function_arn
}

output "courier_url" {
  description = "The HTTP URL endpoint for the courier"
  value       = module.collector.courier_url
}

output "storage_bucket_name" {
  description = "The name for the S3 bucket that stores the events"
  value       = module.collector.storage_bucket_name
}

output "stream_name" {
  description = "The name for the Kinesis Firehose Delivery Stream"
  value       = module.collector.stream_name
}
