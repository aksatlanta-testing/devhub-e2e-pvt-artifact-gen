
{{- define "go-echo3d1fd850-7a84-482b-907a-ea84d1120700.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d1fd850-7a84-482b-907a-ea84d1120700.fullname" -}}
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


{{- define "go-echo3d1fd850-7a84-482b-907a-ea84d1120700.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d1fd850-7a84-482b-907a-ea84d1120700.labels" -}}
helm.sh/chart: {{ include "go-echo3d1fd850-7a84-482b-907a-ea84d1120700.chart" . }}
{{ include "go-echo3d1fd850-7a84-482b-907a-ea84d1120700.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3d1fd850-7a84-482b-907a-ea84d1120700.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3d1fd850-7a84-482b-907a-ea84d1120700.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}