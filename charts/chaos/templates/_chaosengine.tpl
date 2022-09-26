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
  chaosServiceAccount: pod-delete
  experiments:
    - name: pod-delete
      spec:
        components:
          env:
          - name: TOTAL_CHAOS_DURATION
            value: '60'
          - name: CHAOS_INTERVAL
            value: '4'
{{- end }}
