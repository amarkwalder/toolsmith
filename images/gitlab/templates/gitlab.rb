external_url 'https://${GITLAB_HOSTNAME}'
registry_external_url 'https://${DOCKER_REGISTRY_HOSTNAME}'
mattermost_external_url 'https://${MATTERMOST_HOSTNAME}'

gitlab_rails['ldap_enabled'] = true
gitlab_rails['ldap_servers'] = YAML.load <<-EOF
  main:
    label: 'LDAP'
    host: 'ldap'
    port: 389
    uid: 'uid'
    method: 'plain'
    bind_dn: 'cn=readonly,${LDAP_BASE_DN}'
    password: ''
    timeout: 10
    active_directory: false
    allow_username_or_email_login: false
    block_auto_created_users: false
    base: 'ou=People,${LDAP_BASE_DN}'
    user_filter: ''
    attributes:
      username: ['uid']
      email:    ['mail']
      name:       'cn'
      first_name: 'givenName'
      last_name:  'sn'
    group_base: 'ou=Groups,${LDAP_BASE_DN}'
    admin_group: 'cn=Administrators'
    sync_ssh_keys: false
EOF
gitlab_rails['ldap_servers']['main']['password'] = ENV['LDAP_READONLY_USER_PASSWORD']

nginx['enable'] = false
gitlab_rails['trusted_proxies'] = [ 'reverse-proxy' ]
gitlab_workhorse['listen_network'] = "tcp"
gitlab_workhorse['listen_addr'] = "0.0.0.0:8181"

mattermost_nginx['enable'] = false
mattermost['service_address'] = "0.0.0.0"
mattermost['service_port'] = "8065"

mattermost['gitlab_enable'] = true
mattermost['gitlab_id'] = ENV['GITLAB_OAUTH_APP_MATTERMOST_ID']
mattermost['gitlab_secret'] = ENV['GITLAB_OAUTH_APP_MATTERMOST_SECRET']
mattermost['gitlab_scope'] = ""
mattermost['gitlab_auth_endpoint'] = "https://${GITLAB_HOSTNAME}/oauth/authorize"
mattermost['gitlab_token_endpoint'] = "https://${GITLAB_HOSTNAME}/oauth/token"
mattermost['gitlab_user_api_endpoint'] = "https://${GITLAB_HOSTNAME}/api/v3/user"
mattermost['service_enable_insecure_outgoing_connections'] = true

registry_nginx['enable'] = false
registry['registry_http_addr'] = "0.0.0.0:5000"

gitlab_rails['gitlab_default_projects_features_container_registry'] = false
gitlab_rails['initial_root_password'] = ENV['GITLAB_ROOT_PASSWORD']
gitlab_rails['gitlab_signup_enabled'] = false

gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.gmail.com"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "${GITLAB_SMTP_USER_NAME}"
gitlab_rails['smtp_password'] = ENV['GITLAB_SMTP_PASSWORD']
gitlab_rails['smtp_domain'] = "smtp.gmail.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false
gitlab_rails['smtp_openssl_verify_mode'] = "peer"
gitlab_rails['gitlab_email_from'] = "${GITLAB_EMAIL_FROM}"
gitlab_rails['gitlab_email_reply_to'] = "${GITLAB_EMAIL_REPLY_TO}"

mattermost['email_enable_sign_in_with_email'] = false
mattermost['email_enable_sign_up_with_email'] = false
mattermost['email_send_email_notifications'] = true
mattermost['email_smtp_username'] = "${MATTERMOST_SMTP_USER_NAME}"
mattermost['email_smtp_password'] = ENV['MATTERMOST_SMTP_PASSWORD']
mattermost['email_smtp_server'] = "smtp.gmail.com"
mattermost['email_smtp_port'] = 587
mattermost['email_connection_security'] = "STARTTLS"
mattermost['email_feedback_name'] = "GitLab Mattermost"
mattermost['email_feedback_email'] = "${MATTERMOST_FEEDBACK_EMAIL}"
