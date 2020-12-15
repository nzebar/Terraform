//Resource Group Variables
    //Start of Resource Group 1
        variable "rg1name" {
            type = string 
        }
        variable "rg1location" {
            type = string
        }
    //End of Resource Group 1
//End of Resource Group Deployment


//Availability Set Variables
    //Start of Availability Set 1
        variable "availset1name" {
            type = string
        }
    //End of Availability Set 1
//End of Availability Set Variables


//Virtual Network Variables
    //Virtual Network 1
        variable "vnet1name" {
            type = string
        } 
        variable "vnet1addressspace" {
            type = list(string)
        }
            variable "subnet1name" {
                type = string
            }
                variable "subnet1addressprefix" {
                    type = list(string)
                }
            variable "subnet2name" {
                type = string
            }
                variable "subnet2addressprefix" {
                    type = list(string)
                }
            variable "subnet3name" {
                type = string
            }
                variable "subnet3addressprefix" {
                    type = list(string)
                }
    //End of Virtual Network 1
//End of Virtual network Variables     


//Virtual Machine Deployment Variables
    //VM1356
        variable "VM1356name" {
            type = string
        }
        variable "VM1356size" {
            type = string
        }
        variable "VM1356adminusername" {
            type = string
        }
        variable "VM1356adminpassword" {
            type = string
        }
        variable "VM1356interface1name" {
            type = string
        }
    //End of VM1356

    //VM2356
        variable "VM2356name" {
            type = string
        }
        variable "VM2356size" {
            type = string
        }
        variable "VM2356adminusername" {
            type = string
        }
        variable "VM2356adminpassword" {
            type = string
        }
        variable "VM2356interface1name" {
            type = string
        }
    //End of VM2356
//End of Virtual Machine Deployment Variables

//Start of Load Balancer Deployement Variables
    //Start of LB1 Variables
        variable "LB1name" {
            type = string
        }
        variable "LB1pubIPname" {
            type = string
        }
        variable "LB1backendPool1name" {
            type = string
        }
    //End of LB1 Variables
//End of Load Balancer Deployment Variables