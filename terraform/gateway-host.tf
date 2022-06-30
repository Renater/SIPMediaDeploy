variable "gateway_webrtc_domain" {
  type        = string
  description = "The Web RTC domain that the gateways connect to."
}

variable "gateway_host_capacity" {
  type        = number
  description = "The number of gateways per gateway host."
}
