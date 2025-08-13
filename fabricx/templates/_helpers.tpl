{{- define "fabricx.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "fabricx.fullname" -}}
{{- printf "%s" (include "fabricx.name" .) -}}
{{- end }}

{{- define "fabricx.labels" -}}
app.kubernetes.io/name: {{ .name }}
app.kubernetes.io/instance: {{ include "fabricx.fullname" .root }}
{{- range $k, $v := .root.Values.global.labels }}
{{ $k }}: {{ $v | quote }}
{{- end }}
{{- end }}
