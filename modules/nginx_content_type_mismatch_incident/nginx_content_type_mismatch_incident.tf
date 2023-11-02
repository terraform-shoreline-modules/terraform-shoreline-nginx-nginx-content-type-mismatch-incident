resource "shoreline_notebook" "nginx_content_type_mismatch_incident" {
  name       = "nginx_content_type_mismatch_incident"
  data       = file("${path.module}/data/nginx_content_type_mismatch_incident.json")
  depends_on = [shoreline_action.invoke_set_content_type]
}

resource "shoreline_file" "set_content_type" {
  name             = "set_content_type"
  input_file       = "${path.module}/data/set_content_type.sh"
  md5              = filemd5("${path.module}/data/set_content_type.sh")
  description      = "Update the server configuration: If the Content-Type header is not set correctly, update the server configuration to ensure that the header is set correctly for all web resources."
  destination_path = "/tmp/set_content_type.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_set_content_type" {
  name        = "invoke_set_content_type"
  description = "Update the server configuration: If the Content-Type header is not set correctly, update the server configuration to ensure that the header is set correctly for all web resources."
  command     = "`chmod +x /tmp/set_content_type.sh && /tmp/set_content_type.sh`"
  params      = ["PATH_TO_SERVER_CONFIGURATION_FILE","CORRECT_CONTENT_TYPE"]
  file_deps   = ["set_content_type"]
  enabled     = true
  depends_on  = [shoreline_file.set_content_type]
}

