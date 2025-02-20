
{{- define "go-echo6717f565-0e08-427f-a625-20565901336b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6717f565-0e08-427f-a625-20565901336b.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo6717f565-0e08-427f-a625-20565901336b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6717f565-0e08-427f-a625-20565901336b.labels" -}}
helm.sh/chart: {{ include "go-echo6717f565-0e08-427f-a625-20565901336b.chart" . }}
{{ include "go-echo6717f565-0e08-427f-a625-20565901336b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6717f565-0e08-427f-a625-20565901336b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6717f565-0e08-427f-a625-20565901336b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}