locals {
  resource_types = {
    api_management = {
      name     = "api_management"
      alphanum = true
      global   = true
      abbr     = "apim"
    }
    app_configuration = {
      name     = "app_configuration"
      alphanum = false
      global   = false
      abbr     = "appc"
    }
    application_insights = {
      name     = "application_insights"
      alphanum = false
      global   = false
      abbr     = "appi"
    }
    app_service_certificates = {
      name     = "app_service_certificates"
      alphanum = false
      global   = false
      abbr     = "appsc"
    }
    app_service = {
      name     = "app_service"
      alphanum = false
      global   = false
      abbr     = "app"
    }
    app_service_domain = {
      name     = "app_service_domain"
      alphanum = false
      global   = false
      abbr     = "appd"
    }
    app_service_plan = {
      name     = "app_service_plan"
      alphanum = false
      global   = false
      abbr     = "asp"
    }
    application_gateway = {
      name     = "application_gateway"
      alphanum = false
      global   = false
      abbr     = "agw"
    }
    application_security_group = {
      name     = "application_security_group"
      alphanum = false
      global   = false
      abbr     = "asg"
    }
    automation_account = {
      name     = "automation_account"
      alphanum = false
      global   = false
      abbr     = "aa"
    }
    availability_set = {
      name     = "availability_set"
      alphanum = false
      global   = false
      abbr     = "avs"
    }
    app_service_environment = {
      name     = "app_service_environment"
      alphanum = false
      global   = false
      abbr     = "ase"
    }
    active_directory_domain_services = {
      name     = "active_directory_domain_services"
      alphanum = false
      global   = false
      abbr     = "adds"
    }
    azure_monitor_private_link_scope = {
      name     = "azure_monitor_private_link_scope"
      alphanum = false
      global   = false
      abbr     = "ampls"
    }
    databricks_workspace = {
      name     = "databricks_workspace"
      alphanum = false
      global   = false
      abbr     = "adb"
    }
    azure_file_sync = {
      name     = "azure_file_sync"
      alphanum = false
      global   = false
      abbr     = "afs"
    }
    firewall = {
      name     = "firewall"
      alphanum = false
      global   = false
      abbr     = "afw"
    }
    firewall_policy = {
      name     = "firewall_policy"
      alphanum = false
      global   = false
      abbr     = "afwp"
    }
    kubernetes_cluster = {
      name     = "kubernetes_cluster"
      alphanum = false
      global   = false
      abbr     = "aks"
    }
    redis_cache = {
      name     = "redis_cache"
      alphanum = true
      global   = true
      abbr     = "redis"
    }
    batch_account = {
      name     = "batch_account"
      alphanum = false
      global   = false
      abbr     = "ba"
    }
    bastion_host = {
      name     = "bastion_host"
      alphanum = false
      global   = false
      abbr     = "bas"
    }
    cdn_profile = {
      name     = "cdn_profile"
      alphanum = false
      global   = false
      abbr     = "cdn"
    }
    cdn_endpoint = {
      name     = "cdn_endpoint"
      alphanum = true
      global   = true
      abbr     = "cdne"
    }
    connection = {
      name     = "connection"
      alphanum = false
      global   = false
      abbr     = "con"
    }
    container_instance = {
      name     = "container_instance"
      alphanum = false
      global   = false
      abbr     = "ci"
    }
    container_registry = {
      name     = "container_registry"
      alphanum = true
      global   = true
      abbr     = "cr"
    }
    cosmosdb_account = {
      name     = "cosmosdb_account"
      alphanum = false
      global   = false
      abbr     = "cdb"
    }
    cosmosdb_sql_database = {
      name     = "cosmosdb_sql_database"
      alphanum = false
      global   = false
      abbr     = "cosmos"
    }
    data_factory = {
      name     = "data_factory"
      alphanum = true
      global   = true
      abbr     = "adf"
    }
    data_lake_analytics_account = {
      name     = "data_lake_analytics_account"
      alphanum = true
      global   = true
      abbr     = "adla"
    }
    data_lake_store = {
      name     = "data_lake_store"
      alphanum = true
      global   = true
      abbr     = "adl"
    }
    disk_encryption_set = {
      name     = "disk_encryption_set"
      alphanum = false
      global   = false
      abbr     = "des"
    }
    ddos_protection_plan = {
      name     = "ddos_protection_plan"
      alphanum = false
      global   = false
      abbr     = "ddp"
    }
    eventgrid = {
      name     = "eventgrid"
      alphanum = false
      global   = false
      abbr     = "evg"
    }
    eventhub = {
      name     = "eventhub"
      alphanum = false
      global   = false
      abbr     = "evh"
    }
    eventhub_namespace = {
      name     = "eventhub_namespace"
      alphanum = true
      global   = true
      abbr     = "evhns"
    }
    express_route_circuit = {
      name     = "express_route_circuit"
      alphanum = false
      global   = false
      abbr     = "erc"
    }
    express_route_gateway = {
      name     = "express_route_gateway"
      alphanum = false
      global   = false
      abbr     = "egw"
    }
    frontdoor = {
      name     = "frontdoor"
      alphanum = true
      global   = true
      abbr     = "fd"
    }
    function_app = {
      name     = "function_app"
      alphanum = false
      global   = false
      abbr     = "afa"
    }
    key_vault = {
      name     = "key_vault"
      alphanum = true
      global   = true
      abbr     = "kv"
    }
    key_vault_access_policy = {
      name     = "key_vault_access_policy"
      alphanum = true
      global   = true
      abbr     = "kvap"
    }
    key_vault_certificate = {
      name     = "key_vault_certificate"
      alphanum = true
      global   = true
      abbr     = "kvcert"
    }
    key_vault_key = {
      name     = "key_vault_key"
      alphanum = true
      global   = true
      abbr     = "kvk"
    }
    key_vault_secret = {
      name     = "key_vault_secret"
      alphanum = true
      global   = true
      abbr     = "kvs"
    }
    kusto_cluster = {
      name     = "kusto_cluster"
      alphanum = true
      global   = true
      abbr     = "kusto"
    }
    load_balancer_internal = {
      name     = "load_balancer_internal"
      alphanum = false
      global   = false
      abbr     = "lbi"
    }
    load_balancer_external = {
      name     = "load_balancer_external"
      alphanum = false
      global   = false
      abbr     = "lbe"
    }
    lb_backend_address_pool = {
      name     = "lb_backend_address_pool"
      alphanum = false
      global   = false
      abbr     = "lbp"
    }
    load_balancer_virtual_ip = {
      name     = "load_balancer_virtual_ip"
      alphanum = false
      global   = false
      abbr     = "lbv"
    }
    log_analytics_workspace = {
      name     = "log_analytics_workspace"
      alphanum = false
      global   = false
      abbr     = "log"
    }
    logic_app = {
      name     = "logic_app"
      alphanum = false
      global   = false
      abbr     = "logic"
    }
    managed_disk_os = {
      name     = "managed_disk_os"
      alphanum = false
      global   = false
      abbr     = "osdisk"
    }
    managed_disk_data = {
      name     = "managed_disk_disk"
      alphanum = false
      global   = false
      abbr     = "disk"
    }
    managed_identity = {
      name     = "managed_identity"
      alphanum = false
      global   = false
      abbr     = "mid"
    }
    user_assigned_identity = {
      name     = "user_assigned_identity"
      alphanum = false
      global   = false
      abbr     = "id"
    }
    management_group = {
      name     = "management_group"
      alphanum = false
      global   = false
      abbr     = "mg"
    }
    mysql_database = {
      name     = "mysql_database"
      alphanum = false
      global   = false
      abbr     = "mysql"
    }
    mysql_server = {
      name     = "mysql_server"
      alphanum = true
      global   = true
      abbr     = "mysqls"
    }
    nat_gateway = {
      name     = "nat_gateway"
      alphanum = false
      global   = false
      abbr     = "natgw"
    }
    netapp_account = {
      name     = "netapp_account"
      alphanum = false
      global   = false
      abbr     = "neta"
    }
    network_interface = {
      name     = "network_interface"
      alphanum = false
      global   = false
      abbr     = "nic"
    }
    network_security_group = {
      name     = "network_security_group"
      alphanum = false
      global   = false
      abbr     = "nsg"
    }
    network_security_rule = {
      name     = "network_security_rule"
      alphanum = false
      global   = false
      abbr     = "nsgr"
    }
    network_watcher = {
      name     = "network_watcher"
      alphanum = false
      global   = false
      abbr     = "nw"
    }
    network_watcher_flow_log = {
      name     = "network_watcher_flow_log"
      alphanum = false
      global   = false
      abbr     = "flow"
    }
    private_dns_a_record = {
      name     = "private_dns_a_record"
      alphanum = false
      global   = false
      abbr     = "pdnsar"
    }
    private_dns_zone = {
      name     = "private_dns_zone"
      alphanum = false
      global   = false
      abbr     = "pdnsz"
    }
    private_dns_resolver = {
      name     = "private_dns_resolver"
      alphanum = false
      global   = false
      abbr     = "pdnsr"
    }
    private_endpoint = {
      name     = "private_endpoint"
      alphanum = false
      global   = false
      abbr     = "pe"
    }
    private_link_services = {
      name     = "private_link_services"
      alphanum = false
      global   = false
      abbr     = "pl"
    }
    policy_definition = {
      name     = "policy_definition"
      alphanum = false
      global   = false
      abbr     = "pd"
    }
    public_ip = {
      name     = "public_ip"
      alphanum = false
      global   = false
      abbr     = "pip"
    }
    public_ip_prefix = {
      name     = "public_ip_prefix"
      alphanum = false
      global   = false
      abbr     = "ippre"
    }
    purview_account = {
      name     = "purview_account"
      alphanum = false
      global   = false
      abbr     = "pur"
    }
    recovery_services_vault = {
      name     = "recovery_services_vault"
      alphanum = false
      global   = false
      abbr     = "rsv"
    }
    proximity_placement_group = {
      name     = "proximity_placement_group"
      alphanum = false
      global   = false
      abbr     = "ppg"
    }
    resource_group = {
      name     = "resource_group"
      alphanum = false
      global   = false
      abbr     = "rg"
    }
    automation_runbook = {
      name     = "automation_runbook"
      alphanum = false
      global   = false
      abbr     = "rb"
    }
    azure_compute_gallery = {
      name     = "azure_compute_gallery"
      alphanum = true
      global   = false
      abbr     = "acg"
    }
    sql_data_warehouse = {
      name     = "sql_data_warehouse"
      alphanum = false
      global   = false
      abbr     = "sqdw"
    }
    sql_database = {
      name     = "sql_database"
      alphanum = false
      global   = false
      abbr     = "sqldb"
    }
    sql_managed_database = {
      name     = "SQL Managed Database"
      alphanum = false
      global   = false
      abbr     = "sqlmdb"
    }
    sql_managed_instance = {
      name     = "sql_managed_instance"
      alphanum = false
      global   = false
      abbr     = "sqlmi"
    }
    sql_server = {
      name     = "sql_server"
      alphanum = true
      global   = true
      abbr     = "sql"
    }
    storage_account = {
      name     = "storage_account"
      alphanum = true
      global   = true
      abbr     = "sa"
    }
    storage_blob = {
      name     = "storage_blob"
      alphanum = true
      global   = true
      abbr     = "sb"
    }
    storage_container = {
      name     = "storage_container"
      alphanum = true
      global   = true
      abbr     = "sc"
    }
    storage_management_policy = {
      name     = "storage_management_policy"
      alphanum = true
      global   = true
      abbr     = "samp"
    }
    subnet = {
      name     = "subnet"
      alphanum = false
      global   = false
      abbr     = "snet"
    }
    subscription = {
      name     = "subscription"
      alphanum = false
      global   = false
      abbr     = "sub"
    }
    route_table = {
      name     = "route_table"
      alphanum = false
      global   = false
      abbr     = "rt"
    }
    user_defined_route = {
      name     = "User_defined_route"
      alphanum = false
      global   = false
      abbr     = "udr"
    }
    virtual_machine = {
      name     = "virtual_machine"
      alphanum = false
      global   = false
      abbr     = "avm"
    }
    virtual_machine_scale_set = {
      name     = "virtual_machine_scale_set"
      alphanum = false
      global   = false
      abbr     = "vmss"
    }
    virtual_network = {
      name     = "virtual_network"
      alphanum = false
      global   = false
      abbr     = "vnet"
    }
    vpn_gateway = {
      name     = "vpn_gateway"
      alphanum = false
      global   = false
      abbr     = "vpng"
    }
    virtual_hub = {
      name     = "virtual_hub"
      alphanum = false
      global   = false
      abbr     = "vhub"
    }
    virtual_wan = {
      name     = "virtual_wan"
      alphanum = false
      global   = false
      abbr     = "vwan"
    }
    vpn_connection = {
      name     = "vpn_connection"
      alphanum = false
      global   = false
      abbr     = "vcn"
    }
    vpn_site = {
      name     = "vpn_site"
      alphanum = false
      global   = false
      abbr     = "vst"
    }
    web_application_firewall_policy = {
      name     = "web_application_firewall_policy"
      alphanum = false
      global   = false
      abbr     = "waf"
    }
    random = {
      name     = "random"
      alphanum = false
      global   = false
      abbr     = random_string.random.result
    }
  }

  # Pseudo-resource types which names we need to derive from resource types
  pseudo_resource_types = {
    virtual_machine = {
      computer_name = {
        name            = "computer_name"
        alphanum        = true
        global          = true
        abbr            = "" # Empty abbreviation
        max_name_length = 13
        index_format    = "%02d"
      }
    }
  }

  # Resource configuration: Include resource types and "pseudo resource types"
  all_resource_types = merge(
    local.resource_types,
    local.pseudo_resource_types.virtual_machine # a.k.a. { computer_name = { name = ..., } }
  )

  location_abbr = lookup(var.location_map, var.location)
  env_abbr      = lookup(var.environment_map, var.environment)
  prefix_parts  = [var.product_area, "${local.env_abbr}${local.location_abbr}"]
  prefix        = join("-", local.prefix_parts)
  domain        = var.domain

  # Create equivalent "generator" map for "pseudo resource types"
  # If a resource does not have a related "pseudo resource", just use the resource itself (makes merging maps easier)
  pseudo_resources_generator = { for
    domain, resources in var.generator : domain => { for
      type, count in resources : try(keys(local.pseudo_resource_types[type])[0], type) => count
    }
  }

  # Generator configuration for resources and pseudo resources
  generator_config = { for
    domain, resources in var.generator : domain => { for
      type, count in merge(resources, local.pseudo_resources_generator[domain]) : type => {
        count     = count
        type      = type
        separator = tobool(local.all_resource_types[type].alphanum) ? "" : "-"
        name_parts = compact(flatten([
          local.prefix_parts,
          local.domain,
          local.all_resource_types[type].abbr
        ]))
        max_name_length = try(local.all_resource_types[type].max_name_length, -1)
        index_format    = try(local.all_resource_types[type].index_format, "%03d")
      }
    }
  }

  generated_names = { for
    domain, resources in local.generator_config : domain => { for # for each key (a.k.a. domain) in the "generator" map
      type, config in resources : type => [for                    # for each "resource_type" in the domain
        index in range(1, config.count + 1) :
        "${substr(join(config.separator, config.name_parts), 0, config.max_name_length)}${format(config.index_format, index)}"
    ] }
  }
}

resource "random_string" "random" {
  keepers = {
    salt = "pepper"
  }
  length    = 4
  lower     = true
  min_lower = 4
  numeric   = false
  special   = false
}
