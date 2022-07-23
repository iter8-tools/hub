{{- define "experiment" -}}
{{- if not .tasks }}
{{- fail "tasks cannot be empty" }}
{{- end }}
spec:
  {{- range $task := .tasks }}
  {{- if eq "assess" $task }}
  {{- include "task.assess" $.assess -}}
  {{- else if eq "custommetrics" $task }}
  {{- include "task.custommetrics" $.custommetrics -}}
  {{- else if eq "grpc" $task }}
  {{- include "task.grpc" $.grpc -}}
  {{- else if eq "http" $task }}
  {{- include "task.http" $.http -}}
  {{- else if eq "ready" $task }}
  {{- include "task.ready" $.ready -}}
  {{- else }}
  {{- fail "task name must be one of assess, custommetrics, grpc, http, or ready" -}}
  {{- end }}
  {{- end }}
result:
  startTime:         {{ now | toJson }}
  numCompletedTasks: 0
  failure:           false
  iter8Version:      {{ .iter8lib.majorMinor }}
{{- end }}