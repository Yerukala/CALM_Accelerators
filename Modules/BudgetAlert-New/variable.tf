variable "subscription_name" {
    description = "Name of the Subscription ID"
    type = string  
}
variable "rg_name" {
    description = "The name of the resource group in which the resources will be created"
    type = string  
}
variable "monitor_ag_name" {
    description = "Name of the Monitor Action Group"
    type = string
}
variable "monitor_ag_short_name" {
    description = "The short name of the action group. This will be used in SMS messages"
    type = string
}
variable "monitor_ag_email_name" {
    description = "Specifies the email name"
    type = string
}
variable "monitor_ag_email_address" {
    description = "List of email receivers"
    type = string
}
variable "consumption_budget_name" {
    dedescription = "Specifies budget consumption name"
    type = string  
}
variable "contact_emails" {
    description = "The name of the preferend email ID"
    type = list (string)  
}