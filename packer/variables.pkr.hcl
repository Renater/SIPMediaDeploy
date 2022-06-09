variable "SOURCE_ID"{
    type = string
    description = "The ID of the image to be used for the build"
}

variable "FLAVOR_ID"{
    type = string
    description = " The ID of the flavor to be used for the image "
}

variable "NETWORK_ID"{
    type = string
    description = "The ID of the network to be used for the initial server created when building the image"
}