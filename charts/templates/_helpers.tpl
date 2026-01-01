
{{- define "go-echoe60dfb1b-86f6-4e8e-904e-5e3b74a2688b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe60dfb1b-86f6-4e8e-904e-5e3b74a2688b.fullname" -}}
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


{{- define "go-echoe60dfb1b-86f6-4e8e-904e-5e3b74a2688b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe60dfb1b-86f6-4e8e-904e-5e3b74a2688b.labels" -}}
helm.sh/chart: {{ include "go-echoe60dfb1b-86f6-4e8e-904e-5e3b74a2688b.chart" . }}
{{ include "go-echoe60dfb1b-86f6-4e8e-904e-5e3b74a2688b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe60dfb1b-86f6-4e8e-904e-5e3b74a2688b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe60dfb1b-86f6-4e8e-904e-5e3b74a2688b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}