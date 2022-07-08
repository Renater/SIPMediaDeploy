variable "gateway_host_name" {
  type        = string
  description = "The name of the Gateway Host instance."
  default     = "gateway"
}

variable "gateway_host_image" {
  type        = string
  description = "The name of the image of the Gateway Host instance."
}

variable "gateway_host_flavor" {
  type        = string
  description = "The name of the flavor of the Gateway Host instance."
}

variable "gateway_host_replicas" {
  type        = number
  description = "The minimum number of available gateways at any time."
}

variable "gateway_webrtc_domain" {
  type        = string
  description = "The Web RTC domain that the gateways connect to."
}

variable "gateway_host_capacity" {
  type        = number
  description = "The number of gateways per gateway host."
}
