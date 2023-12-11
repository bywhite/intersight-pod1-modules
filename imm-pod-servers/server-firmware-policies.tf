# =============================================================================
# Firmware Server Policies
#  - Firmware Policy for X210c-M6 and X210c-M7
# -----------------------------------------------------------------------------

# =============================================================================
# Server Firmware Policy
# -----------------------------------------------------------------------------
resource "intersight_firmware_policy" "server_firmware_x210c" {
 #may need variables for power_priority  and use var in name "med"
  name        = "${var.server_policy_prefix}-server-firmware-x210c"
  description              = var.description
  model_bundle_combo {
    bundle_version = "5.2(0.230092)"
    model_family   = "UCSX-210C-M6"
  }
  model_bundle_combo {
    bundle_version = "5.2(0.230092)"
    model_family   = "UCSX-210C-M7"
  }
  
  organization {
    moid        = var.organization
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

}

