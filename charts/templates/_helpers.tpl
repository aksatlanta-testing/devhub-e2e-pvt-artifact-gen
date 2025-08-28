
{{- define "go-echoa024d055-17cf-4b3f-ab4f-083b386a5522.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa024d055-17cf-4b3f-ab4f-083b386a5522.fullname" -}}
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


{{- define "go-echoa024d055-17cf-4b3f-ab4f-083b386a5522.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa024d055-17cf-4b3f-ab4f-083b386a5522.labels" -}}
helm.sh/chart: {{ include "go-echoa024d055-17cf-4b3f-ab4f-083b386a5522.chart" . }}
{{ include "go-echoa024d055-17cf-4b3f-ab4f-083b386a5522.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa024d055-17cf-4b3f-ab4f-083b386a5522.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa024d055-17cf-4b3f-ab4f-083b386a5522.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}