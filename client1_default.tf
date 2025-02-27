resource "keycloak_openid_client" "realm1_default" {
  realm_id                        = keycloak_realm.realm1.id
  client_id                       = "default"
  client_secret                   = "default_secret"
  enabled                         = true
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  access_type                     = "CONFIDENTIAL"
  valid_redirect_uris             = ["*"]
  valid_post_logout_redirect_uris = ["*"]
  web_origins                     = ["*"]
}

resource "keycloak_openid_client_default_scopes" "realm1_default" {
  realm_id  = keycloak_realm.realm1.id
  client_id = keycloak_openid_client.realm1_default.id

  default_scopes = []
}

resource "keycloak_openid_client_optional_scopes" "realm1_default" {
  realm_id  = keycloak_realm.realm1.id
  client_id = keycloak_openid_client.realm1_default.id

  optional_scopes = [
    "email",
    "profile",
    keycloak_openid_client_scope.realm1_groups.name,
    keycloak_openid_client_scope.realm1_department.name,
  ]
}
