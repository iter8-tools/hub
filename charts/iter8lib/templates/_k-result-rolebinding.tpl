{{- define "k.result.rolebinding" -}}
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: {{ $name }}-result-rolebinding
subjects:
- kind: ServiceAccount
  name: default
roleRef:
  kind: Role
  name: {{ $name }}-result-role
  apiGroup: rbac.authorization.k8s.io
{{- end -}}