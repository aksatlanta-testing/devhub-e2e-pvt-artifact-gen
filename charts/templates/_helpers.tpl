
{{- define "go-echo69c6e700-a089-40f4-b348-065d894e83cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69c6e700-a089-40f4-b348-065d894e83cc.fullname" -}}
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


{{- define "go-echo69c6e700-a089-40f4-b348-065d894e83cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69c6e700-a089-40f4-b348-065d894e83cc.labels" -}}
helm.sh/chart: {{ include "go-echo69c6e700-a089-40f4-b348-065d894e83cc.chart" . }}
{{ include "go-echo69c6e700-a089-40f4-b348-065d894e83cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo69c6e700-a089-40f4-b348-065d894e83cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo69c6e700-a089-40f4-b348-065d894e83cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}