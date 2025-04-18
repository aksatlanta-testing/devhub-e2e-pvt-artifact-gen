
{{- define "go-echo501320ed-672a-44a3-ac09-fdf5128e76ec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo501320ed-672a-44a3-ac09-fdf5128e76ec.fullname" -}}
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


{{- define "go-echo501320ed-672a-44a3-ac09-fdf5128e76ec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo501320ed-672a-44a3-ac09-fdf5128e76ec.labels" -}}
helm.sh/chart: {{ include "go-echo501320ed-672a-44a3-ac09-fdf5128e76ec.chart" . }}
{{ include "go-echo501320ed-672a-44a3-ac09-fdf5128e76ec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo501320ed-672a-44a3-ac09-fdf5128e76ec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo501320ed-672a-44a3-ac09-fdf5128e76ec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}