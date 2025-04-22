{{/* Generate the chart name */}}
{{- define "librechat.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/* Generate the full name for resources */}}
{{- define "librechat.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/* Generate standard labels */}}
{{- define "librechat.labels" -}}
helm.sh/chart: {{ include "librechat.chart" . }}
{{ include "librechat.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Generate selector labels */}}
{{- define "librechat.selectorLabels" -}}
app.kubernetes.io/name: {{ include "librechat.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/* Generate chart name and version */}}
{{- define "librechat.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}