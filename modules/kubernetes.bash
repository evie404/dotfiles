#!/usr/bin/env bash

# Use currently compiled version of kubectl
export PATH=${GOPATH}/src/k8s.io/kubernetes/_output/bin:$PATH

# Kubernetes
if $(which kubectl >/dev/null); then
  source <(kubectl completion bash)
fi

function nodes {
  if [ "$*" = "--watch" ]; then
    watch -- kubectl get nodes --label-columns='failure-domain.beta.kubernetes.io/zone' -o=wide
  else
    kubectl get nodes --label-columns='failure-domain.beta.kubernetes.io/zone' -o=wide
  fi
}

function pods {
  kubectl get pods --all-namespaces -o=wide
}

# function pod {
#   pod_name=$1
# }

# function kubectl_exec {
#   if [ -z "$pod_name" ]
#   then
#     kubectl exec -it $pod_name -- bash -l
#   else
#     kubectl exec -it $1 -- bash -l
#   fi
# }

# function kubectl_describe_pod {
#   if [ -z "$pod_name" ]
#   then
#     kubectl describe pod/$pod_name
#   else
#     kubectl describe pod/$1
#   fi
# }

# function kubectl_logs_previous {
#   kubectl logs $pod_name --previous
# }
