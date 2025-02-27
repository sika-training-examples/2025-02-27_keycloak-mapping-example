variable "realm2_name" {}

resource "keycloak_realm" "realm2" {
  realm                          = var.realm2_name
  enabled                        = true
  display_name                   = "Realm2 SSO"
  display_name_html              = "<h1>Realm2 SSO</h1>"
  reset_password_allowed         = true
  registration_allowed           = true
  registration_email_as_username = false

  smtp_server {
    host = "maildev2.sikademo.com"
    port = "1025"
    from = "keycloak@kc0.com"
  }
}

resource "keycloak_oidc_identity_provider" "realm2" {
  realm             = keycloak_realm.realm2.id
  alias             = keycloak_realm.realm1.realm
  authorization_url = "${var.keycloak_url}/realms/${keycloak_realm.realm1.realm}/protocol/openid-connect/auth"
  client_id         = keycloak_openid_client.realm1_idp.client_id
  client_secret     = keycloak_openid_client.realm1_idp.client_secret
  token_url         = "${var.keycloak_url}/realms/${keycloak_realm.realm1.realm}/protocol/openid-connect/token"

  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}
