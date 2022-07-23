{{- define "k.rolebinding" -}}
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: iter8-{{ required "app.name is required" .app.name }}
  namespace: {{ required "app.namespace is required" .app.namespace }}
subjects:
- kind: ServiceAccount
  name: iter8-{{ .app.name }}
  namespace: {{ .app.namespace }}
roleRef:
  kind: Role
  name: iter8-{{ .app.name }}
  apiGroup: rbac.authorization.k8s.io
{{- end }}
