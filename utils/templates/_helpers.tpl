{{- define "joinKey" -}}
{{range $item, $_ := . -}}{{$item | replace "." "_" -}},{{- end}}
{{- end -}}

{{- define "loggerIni" -}}
{{range $top_level_key, $value := .}}
[{{$top_level_key}}]
keys={{include "joinKey" $value | trimAll ","}}
{{range $item, $values := $value}}

[{{$top_level_key | trimSuffix "s"}}_{{$item | replace "." "_"}}]
{{- if and (eq $top_level_key "loggers") (ne $item "root")}}
qualname={{$item}}
{{- end}}
{{- range $key, $value := $values}}
{{$key}}={{$value}}
{{- end}}
{{- end}}
{{end}}
{{- end -}}
