variable "realm1_name" {}

resource "keycloak_realm" "realm1" {
  realm                          = var.realm1_name
  enabled                        = true
  display_name                   = "Realm1 SSO"
  display_name_html              = "<h1>Realm1 SSO</h1>"
  reset_password_allowed         = true
  registration_allowed           = true
  registration_email_as_username = false

  smtp_server {
    host = "maildev2.sikademo.com"
    port = "1025"
    from = "keycloak@kc0.com"
  }
}
