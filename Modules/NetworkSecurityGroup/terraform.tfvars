subscription_name      = "1bff8c1b-951f-4dce-9a24-8553ddcc442b"
rg_name                = "CYTSP5TSTRGCIN001"
location               = "Central India"
monitor_ag_name        = "emailalert"
snet_name              = "CYTSP5TSTSNETCIN001"
vnet_name              = "CYTSP5TSTVNETCIN001"
nsg_name               = "CYTSP5TSTNSGCIN001"
nsg_rule_name          = "Allow-RDP"
nsg_rule_priority      = "101"
nsg_rule_direction     = "Inbound"
nsg_rule_access        = "Allow"
nsg_rule_protocol      = "Tcp"
nsg_rule_source_port   = "*"
nsg_rule_destinaton_port = "3389"
nsg_rule_source_address = "VirtualNetwork"
nsg_rule_destinaton_address = "*"
monitor_activity_log_alert_name = "Activity Log Alert for Create or Update Security Group"
monitor_activity_log_alert_category = "Security"
monitor_activity_log_alert_operation = "Microsoft.Network/networkSecurityGroups/write"