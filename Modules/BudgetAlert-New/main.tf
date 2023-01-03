data "azurerm_subscription" "subscription" {
  subscription_id = var.subscription_name
}

data "azurerm_resource_group" "rg"{
  name            = var.rg_name
}

# Creates Monitor Action Group
resource "azurerm_monitor_action_group" "actiongroup" {
  name                = var.monitor_ag_name
  resource_group_name = var.rg_name
  short_name          = var.monitor_ag_short_name

  email_receiver {
    name                    = var.monitor_ag_email_name
    email_address           = var.monitor_ag_email_address
    use_common_alert_schema = true
  }
}

# Creates Budget Consumption alert
resource "azurerm_consumption_budget_subscription" "budget" {
  name            = var.consumption_budget_name
  subscription_id = data.azurerm_subscription.subscription.id

  amount     = 30000
  time_grain = "Monthly"

  time_period {
    start_date = "2022-12-01T00:00:00Z"
    end_date   = "2023-12-01T00:00:00Z"
  }
    notification {
    enabled        = true
    threshold      = 70.0
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = var.contact_emails

    contact_groups = [
      azurerm_monitor_action_group.actiongroup.id,
    ]
  }
}