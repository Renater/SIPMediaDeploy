variable "key_pair" {
  type        = string
  description = "The key pair that should have access on the whole infrastructure."
  nullable    = true
  default     = null
}
