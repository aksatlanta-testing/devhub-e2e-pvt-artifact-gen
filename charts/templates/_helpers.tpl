
{{- define "go-echoacbc255e-abc7-49a1-a227-d486fbca7d6d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacbc255e-abc7-49a1-a227-d486fbca7d6d.fullname" -}}
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


{{- define "go-echoacbc255e-abc7-49a1-a227-d486fbca7d6d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacbc255e-abc7-49a1-a227-d486fbca7d6d.labels" -}}
helm.sh/chart: {{ include "go-echoacbc255e-abc7-49a1-a227-d486fbca7d6d.chart" . }}
{{ include "go-echoacbc255e-abc7-49a1-a227-d486fbca7d6d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoacbc255e-abc7-49a1-a227-d486fbca7d6d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoacbc255e-abc7-49a1-a227-d486fbca7d6d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}