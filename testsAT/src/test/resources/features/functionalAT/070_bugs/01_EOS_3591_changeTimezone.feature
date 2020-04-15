@rest @dcos
@mandatory(DCOS_CLI_HOST,DCOS_CLI_USER,DCOS_CLI_PASSWORD,BOOTSTRAP_IP,REMOTE_USER,PEM_FILE_PATH,DCOS_PASSWORD,TIMEZONE)
Feature: Check deployment with change timezone

  @ignore @manual
  Scenario:[01] Change timezone in file descriptor.json
    Given I open a ssh connection to '${BOOTSTRAP_IP}' in port '${EOS_NEW_SSH_PORT:-22}' with user '${REMOTE_USER}' using pem file '${PEM_FILE_PATH}'
    And I run 'sudo jq '. += {"timezone":"GMT+2"}' /stratio_volume/descriptor.json > /tmp/descriptor.json && mv -f /tmp/descriptor.json /stratio_volume/descriptor.json' in the ssh connection

  @ignore @manual
  @include(feature:../010_Installation/001_installationCCT_IT.feature,scenario:[01] Get schema and install Marathon-LB)
  Scenario:[02] Deploy marathonlb
    Given I wait '5' seconds

  @ignore @manual
  @include(feature:../010_Installation/002_checkDeployment_IT.feature,scenario:[01] Check correct deployment)
  @include(feature:../010_Installation/002_checkDeployment_IT.feature,scenario:[02] Make sure service is ready)
  Scenario:[03] Check status of marathon-lb
    Given I wait '5' seconds