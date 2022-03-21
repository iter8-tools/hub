{{- define "k.spec.secret" -}}
{{- include "k.common" -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ $name }}-spec
stringData:
  experiment.yaml: |
{{ include "experiment" . | indent 4 }}
{{- end -}}
