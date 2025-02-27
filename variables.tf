variable "app_name" {
  description = "Name of the application"
  default     = "nginx-app"
}

variable "app_image" {
  description = "Docker image for the application"
  default     = "nginx:latest"
}

variable "app_port" {
  description = "Port to expose the application"
  default     = 80
}

variable "replicas" {
  description = "Number of replicas for the deployment"
  default     = 2
}
