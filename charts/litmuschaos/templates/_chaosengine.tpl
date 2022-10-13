{{- define "chaosengine" -}}
apiVersion: litmuschaos.io/v1alpha1
kind: ChaosEngine
metadata:
  name: {{ .Chart.Name }}-{{ .Release.Name }}
spec:
  appinfo:
    appns: "{{ .Release.Namespace }}"
    applabel: "{{ required ".Values.applabel is required!" .Values.applabel }}"
    appkind: "{{ .Values.appkind }}"
  # It can be active/stop
  engineState: 'active'
  chaosServiceAccount: {{ .Chart.Name }}-{{ .Release.Name }}
  experiments:
    - name: {{ .Chart.Name }}-{{ .Release.Name }}
      spec:
        components:
          env:
          - name: TOTAL_CHAOS_DURATION -- expose as Helm chart value
            value: {{ required ".Values.totalChaosDuration is required!" .Values.totalChaosDuration | quote }}
          - name: CHAOS_INTERVAL -- expose as a Helm chart value
            value: {{ required ".Values.chaosInterval is required!" .Values.chaosInterval | quote }}
{{- end }}
