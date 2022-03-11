resource "genesyscloud_integration" "integration" {
    integration_type = "purecloud-data-actions"
    intended_state   = "ENABLED"

    config {
        name  = "${var.integration_name}"
        credentials = {
            pureCloudOAuthClient = genesyscloud_integration_credential.credential.id
        }
    }
}

resource "genesyscloud_integration_credential" "credential" {
    name                 = "Genesys Cloud OAuth Client Credential"
    credential_type_name = "pureCloudOAuthClient"

    fields = {
        clientId     = var.integration_creds_client_id
        clientSecret = var.integration_creds_client_secret
    }
}