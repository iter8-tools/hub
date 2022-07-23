{{- define "task.ready.tn" }}
    namespace: {{ required "app.namespace is required" .app.namespace }}
{{- if .timeout }}
    timeout: {{ .timeout }}
{{- end }}
{{- end }}

{{- define "task.ready" }}
{{- if .service }}
# task: determine if Kubernetes Service exists
- task: ready
  with:
    name: {{ .service | quote }}
    version: v1
    resource: services
{{- include "task.ready.tn" . }}
{{- end }}
{{- if .deploy }}
# task: determine if Kubernetes Deployment exists and is Available
- task: ready
  with:
    name: {{ .deploy | quote }}
    group: apps
    version: v1
    resource: deployments
    condition: Available
{{- include "task.ready.tn" . }}
{{- end }}
{{- if .ksvc }}
# task: determine if Knative Service exists and is ready
- task: ready
  with:
    name: {{ .ksvc | quote }}
    group: serving.knative.dev
    version: v1
    resource: services
    condition: Ready
{{- include "task.ready.tn" . }}
{{- end }}
{{- end }}
