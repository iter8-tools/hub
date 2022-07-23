{{- define "k.secret" -}}
apiVersion: v1
kind: Secret
metadata:
  name: iter8-{{ required "app.name is required" .app.name }}
  namespace: {{ required "app.namespace is required" .app.namespace }}
stringData:
  experiment.yaml: |
{{ include "experiment" . | indent 4 }}
{{- end }}