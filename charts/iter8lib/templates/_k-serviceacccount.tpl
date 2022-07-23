{{- define "k.serviceaccount" -}}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: iter8-{{ required "app.name is required" .app.name }}
  namespace: {{ required "app.namespace is required" .app.namespace }}
{{- end }}
