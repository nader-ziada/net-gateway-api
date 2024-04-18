#!/usr/bin/env bash

export KO_DOCKER_REPO=us-docker.pkg.dev/daisy-284300/testing/netgwapi
ko apply -f test/config -f config
(
  cd ~/workspace/avi-integration
  /Users/suan/workspace/avi-integration/scripts/deploy-for-conformance-test.sh
  kubectl apply -f /Users/suan/workspace/avi-integration/resources/knative-config-gateway.yaml
)