{{- define "task.grpc" }}
{{- /* Validate values */ -}}
{{- if not . }}
{{- fail "grpc values object is nil" }}
{{- end }}
{{- if not (or .host .endpoints) }}
{{- fail "please the host parameter or the endpoints parameter" }}
{{- end }}
{{- if not (or .call .endpoints) }}
{{- fail "please the call parameter or the endpoints parameter" }}
{{- end }}
{{- /**************************/ -}}
{{- /* Warmup task if requested */ -}}
{{- if or .warmupNumRequests .warmupDuration }}
{{- $vals := mustDeepCopy . }}
{{- if .warmupNumRequests }}
{{- $_ := set $vals "total" .warmupNumRequests }}
{{- else }}
{{- $_ := set $vals "duration" .warmupDuration}}
{{- end }}
{{- /* replace warmup options a boolean */ -}}
{{- $_ := unset $vals "warmupDuration" }}
{{- $_ := unset $vals "warmupNumRequests" }}
{{- $_ := set $vals "warmup" true }}
{{- if $vals.protoURL }}
# task: download proto file from URL
- run: |
    curl -o ghz.proto {{ $vals.protoURL }}
{{- $pf := dict "proto" "ghz.proto" }}
{{- $vals = mustMerge $pf $vals }}
{{- end }}
{{- if $vals.dataURL }}
# task: download JSON data file from URL
- run: |
    curl -o data.json {{ $vals.dataURL }}
{{- $pf := dict "data-file" "data.json" }}
{{- $vals = mustMerge $pf $vals }}
{{- end }}
{{- if $vals.binaryDataURL }}
# task: download binary data file from URL
- run: |
    curl -o data.bin {{ $vals.binaryDataURL }}
{{- $pf := dict "binary-file" "data.bin" }}
{{- $vals = mustMerge $pf $vals }}
{{- end }}
{{- if $vals.metadataURL }}
# task: download metadata JSON file from URL
- run: |
    curl -o metadata.json {{ $vals.metadataURL }}
{{- $pf := dict "metadata-file" "metadata.json" }}
{{- $vals = mustMerge $pf $vals }}
{{- end }}
{{/* Write the main task */}}
# task: generate gRPC requests for app
# collect Iter8's built-in gRPC latency and error-related metrics
- task: grpc
  with:
{{ toYaml $vals | indent 4 }}
{{- end }}
{{- /* warmup done */ -}}
{{- /**************************/ -}}
{{- /* Perform the various setup steps before the main task */ -}}
{{- /* remove warmup options if present */ -}}
{{- $_ := unset . "warmupDuration" }}
{{- $_ := unset . "warmupNumRequests" }}
{{- $vals := mustDeepCopy . }}
{{- if $vals.protoURL }}
# task: download proto file from URL
- run: |
    curl -o ghz.proto {{ $vals.protoURL }}
{{- $pf := dict "proto" "ghz.proto" }}
{{- $vals = mustMerge $pf $vals }}
{{- end }}
{{- if $vals.dataURL }}
# task: download JSON data file from URL
- run: |
    curl -o data.json {{ $vals.dataURL }}
{{- $pf := dict "data-file" "data.json" }}
{{- $vals = mustMerge $pf $vals }}
{{- end }}
{{- if $vals.binaryDataURL }}
# task: download binary data file from URL
- run: |
    curl -o data.bin {{ $vals.binaryDataURL }}
{{- $pf := dict "binary-file" "data.bin" }}
{{- $vals = mustMerge $pf $vals }}
{{- end }}
{{- if $vals.metadataURL }}
# task: download metadata JSON file from URL
- run: |
    curl -o metadata.json {{ $vals.metadataURL }}
{{- $pf := dict "metadata-file" "metadata.json" }}
{{- $vals = mustMerge $pf $vals }}
{{- end }}
# handle endpoints
{{- range $endpointID, $endpoint := $vals.endpoints }}
{{- if $endpoint.protoURL }}
{{- $protoFile := print $endpointID "_ghz.proto" }}
# task: download proto file from URL for endpoint
- run: |
    curl -o $protoFile {{ $endpoint.protoURL }}
{{- $_ := set $endpoint "proto" $protoFile }}
{{- end }}
{{- if $endpoint.dataURL }}
{{- $dataFile := print $endpointID "_data.json" }}
# task: download JSON data file from URL for endpoint
- run: |
    curl -o $dataFile {{ $endpoint.dataURL }}
{{- $_ := set $endpoint "data-file" $dataFile }}
{{- end }}
{{- if $endpoint.binaryDataURL }}
{{- $binDataFile := print $endpointID "_data.bin" }}
# task: download binary data file from URL for endpoint
- run: |
    curl -o $binDataFile {{ $endpoint.binaryDataURL }}
{{- $_ := set $endpoint "binary-file" $binDataFile }}
{{- end }}
{{- if $endpoint.metadataURL }}
{{- $metadataFile := print $endpointID "_metadata.json" }}
# task: download metadata JSON file from URL for endpoint
- run: |
    curl -o $metadataFile {{ $endpoint.metadataURL }}
{{- $_ := set $endpoint "metadata-file" $metadataFile }}
{{- end }}
{{- end }}
{{/* Write the main task */}}
# task: generate gRPC requests for app
# collect Iter8's built-in gRPC latency and error-related metrics
- task: grpc
  with:
{{ toYaml $vals | indent 4 }}
{{- end }}