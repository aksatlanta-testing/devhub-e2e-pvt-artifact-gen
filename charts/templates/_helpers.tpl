
{{- define "go-echodafa4f54-2f6f-488e-9591-268217f0740e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodafa4f54-2f6f-488e-9591-268217f0740e.fullname" -}}
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


{{- define "go-echodafa4f54-2f6f-488e-9591-268217f0740e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodafa4f54-2f6f-488e-9591-268217f0740e.labels" -}}
helm.sh/chart: {{ include "go-echodafa4f54-2f6f-488e-9591-268217f0740e.chart" . }}
{{ include "go-echodafa4f54-2f6f-488e-9591-268217f0740e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodafa4f54-2f6f-488e-9591-268217f0740e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodafa4f54-2f6f-488e-9591-268217f0740e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}