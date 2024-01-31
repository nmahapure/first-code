{{/*
Expand the name of the chart.
*/}}
{{- define "yantra-oms.name" -}}
{{- default .Chart.Name .Values.properties.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "yantra-oms.fullname" -}}
{{- if .Values.properties.fullnameOverride }}
{{- .Values.properties.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.properties.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "yantra-oms.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "yantra-oms.labels" -}}
helm.sh/chart: {{ include "yantra-oms.chart" . }}
{{ include "yantra-oms.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "yantra-oms.selectorLabels" -}}
app.kubernetes.io/name: {{ include "yantra-oms.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "yantra-oms.serviceAccountName" -}}
{{- if .Values.properties.serviceAccount.create }}
{{- default (include "yantra-oms.fullname" .) .Values.properties.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.properties.serviceAccount.name }}
{{- end }}
{{- end }}
