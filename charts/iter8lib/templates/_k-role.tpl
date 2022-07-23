{{- define "k.role" -}}
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: iter8-{{ required "app.name is required" .app.name }}
  namespace: {{ required "app.namespace is required" .app.namespace }}
rules:
- apiGroups: [""]
  resourceNames: [{{ .app.name | quote }}]
  resources: ["secrets"]
  verbs: ["get", "update"]
- apiGroups: [""]
  resources: ["services"]
  verbs: ["get"]
- apiGroups: ["apps"]
  resources: ["deployments"]
  verbs: ["get"]
- apiGroups: ["serving.knative.dev"]
  resources: ["services"]
  verbs: ["get"]
{{- end }}
