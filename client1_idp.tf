resource "keycloak_openid_client" "realm1_idp" {
  realm_id                        = keycloak_realm.realm1.id
  client_id                       = "idp"
  client_secret                   = "idp_secret"
  enabled                         = true
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  access_type                     = "CONFIDENTIAL"
  valid_redirect_uris             = ["*"]
  valid_post_logout_redirect_uris = ["*"]
  web_origins                     = ["*"]
}
