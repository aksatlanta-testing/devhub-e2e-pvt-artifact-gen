
{{- define "go-echo2403cd7f-52ff-4c6f-a03a-770e41cd506c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2403cd7f-52ff-4c6f-a03a-770e41cd506c.fullname" -}}
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


{{- define "go-echo2403cd7f-52ff-4c6f-a03a-770e41cd506c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2403cd7f-52ff-4c6f-a03a-770e41cd506c.labels" -}}
helm.sh/chart: {{ include "go-echo2403cd7f-52ff-4c6f-a03a-770e41cd506c.chart" . }}
{{ include "go-echo2403cd7f-52ff-4c6f-a03a-770e41cd506c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2403cd7f-52ff-4c6f-a03a-770e41cd506c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2403cd7f-52ff-4c6f-a03a-770e41cd506c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}