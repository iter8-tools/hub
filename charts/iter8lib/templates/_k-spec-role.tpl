{{- define "k.spec.role" -}}
{{- include "k.common" -}}
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: {{ $name }}-spec-role
rules:
- apiGroups: [""]
  resources: ["secrets"]
  resourceNames: ["{{ $name }}-spec"]
  verbs: ["get"]
{{- end -}}
