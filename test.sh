#!/usr/bin/env bash
export KO_DOCKER_REPO=us-docker.pkg.dev/daisy-284300/testing/netgwapi

gateway_ip="$(kubectl -n avi-system get gateway avi-gateway -o 'jsonpath={.status.addresses[0].value}')" 
echo "${gateway_ip}"

kubectl delete ns serving-tests
kubectl create ns serving-tests

# go test -v -timeout=20m -count=1 -tags e2e  ./test/conformance/ -run "TestIngressConformance/dispatch" -ingressClass=gateway-api.ingress.networking.knative.dev -enable-beta -service-domain="${gateway_ip}.nip.io" -ingressendpoint="${gateway_ip}" -request-delay=20
# go test -v -timeout=20m -count=1 -tags e2e  ./test/conformance/ -run "TestIngressConformance/basic" -ingressClass=gateway-api.ingress.networking.knative.dev -enable-beta -service-domain="${gateway_ip}.nip.io" -ingressendpoint="${gateway_ip}" -request-delay=20
# go test -v -timeout=20m -count=1 -tags e2e  ./test/conformance/ -run "TestIngressConformance/hosts/multiple" -ingressClass=gateway-api.ingress.networking.knative.dev -enable-beta -service-domain="${gateway_ip}.nip.io" -ingressendpoint="${gateway_ip}" -request-delay=20
# go test -v -timeout=20m -count=1 -tags e2e  ./test/conformance/ -run "TestIngressConformance/retry" -ingressClass=gateway-api.ingress.networking.knative.dev -enable-beta -service-domain="${gateway_ip}.nip.io" -ingressendpoint="${gateway_ip}" -request-delay=20
# go test -v -timeout=20m -count=1 -tags e2e  ./test/conformance/ -run "TestIngressConformance/visibility" -ingressClass=gateway-api.ingress.networking.knative.dev -enable-beta -service-domain="${gateway_ip}.nip.io" -ingressendpoint="${gateway_ip}"
go test -v -timeout=20m -count=1 -tags e2e  ./test/conformance/ -run "TestIngressConformance/timeout" -ingressClass=gateway-api.ingress.networking.knative.dev -enable-beta -service-domain="${gateway_ip}.nip.io" -ingressendpoint="${gateway_ip}"
# go test -v -timeout=20m -count=1 -tags e2e  ./test/conformance/ -run "TestIngressConformance/hosts" -ingressClass=gateway-api.ingress.networking.knative.dev -enable-beta -service-domain="${gateway_ip}.nip.io" -ingressendpoint="${gateway_ip}"