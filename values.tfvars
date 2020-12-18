//Resource Group Deployment Values
    rg1name="TESTlab"
    rg1location="eastus"
//End of Resource Group Deployment Values

//Availability Set Deployment Values
    avset1name="AvailabilitySet1"
    avset2name="AvailabilitySet2"
//End of Availability Set Deployment Values
 
//Virtual Network Deployment Values
    vnet1name="vnet1"
    vnet1addressspace = ["10.11.0.0/16"]
        subnet1name="subnet1"
            subnet1addressprefix = ["10.11.1.0/24"]
        subnet2name="subnet2"
            subnet2addressprefix = ["10.11.2.0/24"]
//End of Virtual Network Deployment Values

//Virtual Machine Deployment Values
    //VM1356 Values
        VM1356name="adVM1356"
        VM1356size="Standard_D2s_v3"
        VM1356adminusername="AdminDC"
        VM1356adminpassword="Networking2!"
        VM1356interface1name="VM1356interface1"
    //End of VM1356 Values

    //VM2356 Values
        VM2356name="exVM2356"
        VM2356size="Standard_D2s_v3"
        VM2356adminusername="AdminEX"
        VM2356adminpassword="Networking2!"
        VM2356interface1name="VM2356interface1"
    //End of VM2356 Values
//End of VM1356 Deployment Values

//Load Balancer Deployment Values
    //LB1 Values
        LB1name="LB1"
        LB1pubIPname="LB1pubIP"
        LB1backendPool1name="LB1backendPool1"
    //End of LB1 Deployment Values
    //LB2 Values
        LB2name="LB2"
        LB2pubIPname="LB2pubIP"
        LB2backendPool1name="LB2backendPool1"
    //End of LB2 Deployment Values
//End of Load Balancer Deployment Values