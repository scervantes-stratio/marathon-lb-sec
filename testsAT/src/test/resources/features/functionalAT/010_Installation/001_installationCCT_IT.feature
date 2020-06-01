@rest @dcos
@mandatory(BOOTSTRAP_IP,REMOTE_USER,PEM_FILE_PATH,DCOS_PASSWORD,DCOS_CLI_HOST,DCOS_CLI_USER,DCOS_CLI_PASSWORD,UNIVERSE_VERSION)
Feature: [QATM-1870] Marathon-LB installation

  Scenario:[01] Get schema and install Marathon-LB
    Given I set sso token using host '!{EOS_ACCESS_POINT}' with user '!{DCOS_USER}' and password '${DCOS_PASSWORD}' and tenant '!{DCOS_TENANT}'
    And I securely send requests to '!{EOS_ACCESS_POINT}:443'
    And I get schema from service 'marathonlb' with model '${MLB_FLAVOUR:-basic}' and version '${UNIVERSE_VERSION}' and save it in file 'marathonlb-basic.json'
    When I create file 'marathonlb-config.json' based on 'marathonlb-basic.json' as 'json' with:
      | $.general.resources.INSTANCES       | REPLACE | ${MLB_INSTANCE:-1}          | number  |
      | $.general.resources.CPUS            | REPLACE | ${MLB_CPUS:-1}              | number  |
      | $.general.resources.MEM             | REPLACE | ${MLB_MEM:-1}               | number  |
      | $.general.resources.DISK            | REPLACE | ${MLB_DISK:-1}              | number  |
      | $.environment.haproxy.rsyslog       | REPLACE | ${MLB_FLAG_RSYSLOG:-true}   | boolean |
    Then I install service 'marathon-lb' with model '${MLB_FLAVOUR:-basic}' and version '${UNIVERSE_VERSION}' and instance name 'marathonlb' in tenant '!{DCOS_TENANT}' using json 'marathonlb-config.json'
