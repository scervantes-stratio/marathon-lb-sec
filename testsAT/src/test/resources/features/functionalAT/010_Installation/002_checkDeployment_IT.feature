@dcos
@mandatory(BOOTSTRAP_IP,REMOTE_USER,PEM_FILE_PATH,DCOS_PASSWORD)
Feature: [QATM-1870] Check Marathon-LB deployment

  Scenario:[01] Check correct deployment
    # Check status in API
    Then in less than '1200' seconds, checking each '20' seconds, I check in CCT that the service 'marathonlb' is in 'running' status
    Then in less than '1200' seconds, checking each '20' seconds, I check in CCT that the service 'marathonlb' is in 'healthy' status

  Scenario:[02] Make sure service is ready
    Given I send requests to '!{PUBLIC_NODE}:9090'
    When I send a 'GET' request to '/_haproxy_health_check'
    Then the service response status must be '200'
    When I send a 'GET' request to '/_haproxy_getconfig'
    Then the service response status must be '200'