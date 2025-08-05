
{{- define "go-echo972516ed-901d-436d-9833-c9439c97baaf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo972516ed-901d-436d-9833-c9439c97baaf.fullname" -}}
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


{{- define "go-echo972516ed-901d-436d-9833-c9439c97baaf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo972516ed-901d-436d-9833-c9439c97baaf.labels" -}}
helm.sh/chart: {{ include "go-echo972516ed-901d-436d-9833-c9439c97baaf.chart" . }}
{{ include "go-echo972516ed-901d-436d-9833-c9439c97baaf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo972516ed-901d-436d-9833-c9439c97baaf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo972516ed-901d-436d-9833-c9439c97baaf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}