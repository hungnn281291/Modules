locals {
  appsettings = {
    clientCertEnabled : true #AAS_IAM_004
  }
}
resource "azurerm_service_plan" "this" {
  name                         = var.app_service_plan_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  os_type                      = var.os_type
  sku_name                     = var.sku_name
  app_service_environment_id   = var.app_service_environment_id
  maximum_elastic_worker_count = var.maximum_elastic_worker_count
  worker_count                 = var.worker_count
  per_site_scaling_enabled     = var.per_site_scaling_enabled
  zone_balancing_enabled       = var.zone_balancing_enabled
  tags                         = merge(local.tags, var.tags)
}

resource "azurerm_windows_web_app" "this" {
  name                       = var.app_service_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = azurerm_service_plan.this.id
  https_only                 = true #AAS_ENC_003
  client_affinity_enabled    = var.client_affinity_enabled
  client_certificate_enabled = true #AAS_ENC_005
  client_certificate_mode    = var.client_certificate_mode
  tags                       = merge(local.tags, var.tags)
  app_settings               = merge(local.appsettings, var.app_settings)
  virtual_network_subnet_id  = var.virtual_network_subnet_id # AAS_NET_001
  identity {
    # AAS_IAM_003
    type = "SystemAssigned"
  }

  site_config {
    always_on                = var.always_on
    api_management_api_id    = var.api_management_api_id
    app_command_line         = var.app_command_line
    ftps_state               = var.ftps_state
    http2_enabled            = var.http2_enabled
    websockets_enabled       = var.websockets_enabled #AAS_TDS_009
    health_check_path        = var.health_check_path
    use_32_bit_worker        = var.use_32_bit_worker
    minimum_tls_version      = 1.2   #AAS_ENC_004
    scm_minimum_tls_version  = 1.2   #AAS_ENC_004
    vnet_route_all_enabled   = true  #AAS_NET_002
    remote_debugging_enabled = false #AAS_TDS_008
    # AAS_TDS_010
    dynamic "cors" {
      for_each = var.cors_rule_enabled == true ? [1] : []
      content {
        allowed_origins     = var.allowed_origins
        support_credentials = var.support_credentials
      }
    }

    # AAS_NET_004
    ip_restriction {
      action                    = "Allow"
      name                      = "ip_restriction"
      ip_address                = var.app_ip_restriction_ip_address == "" ? null : var.app_ip_restriction_ip_address
      service_tag               = var.app_ip_restriction_service_tag == "" ? null : var.app_ip_restriction_service_tag
      virtual_network_subnet_id = var.app_ip_restriction_virtual_network_subnet_id == "" ? null : var.app_ip_restriction_virtual_network_subnet_id
    }

    # AAS_NET_004
    scm_ip_restriction {
      action                    = "Allow"
      virtual_network_subnet_id = var.scm_ip_restriction_virtual_network_subnet_id
    }
  }

  auth_settings {
    enabled                        = var.enabled
    additional_login_parameters    = var.additional_login_parameters
    allowed_external_redirect_urls = var.allowed_external_redirect_urls
    runtime_version                = var.runtime_version
    token_refresh_extension_hours  = var.token_refresh_extension_hours
    token_store_enabled            = var.token_store_enabled
    default_provider               = "AzureActiveDirectory" #AAS_IAM_001
    unauthenticated_client_action  = "RedirectToLoginPage"  #AAS_IAM_002
  }

  logs {
    detailed_error_messages = true
    failed_request_tracing  = true
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  depends_on = [
    azurerm_service_plan.this
  ]
}
