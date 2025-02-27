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

resource "keycloak_realm_user_profile" "realm1" {
  realm_id = keycloak_realm.realm1.id

  attribute {
    name = "username"

    permissions {
      edit = ["admin"]
      view = ["user"]
    }
  }

  attribute {
    name = "email"

    permissions {
      edit = ["admin"]
      view = ["user"]
    }

    validator {
      name = "email"
    }
  }

  attribute {
    name = "firstName"

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }
  }

  attribute {
    name = "lastName"

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }
  }

  attribute {
    name         = "department"
    display_name = "Department"

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }
  }
}
