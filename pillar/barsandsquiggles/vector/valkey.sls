vector:
  additional_groups:
    - valkey
  config:
    sources:
      source_valkey_log:
        type: "file"
        file_key: "file_path"
        include:
        - /var/log/valkey/*.log

    transforms:
      parsed_valkey_log:
        type: "remap"
        inputs:
          - source_valkey_log
        source: |-
          . = merge(., parse_regex!(.message, r'\A(?P<process_id>\d+):(?P<process_role>\w+)\s+(?P<timestamp>\d+\s+\w+\s+\d+\s+\d+:\d+:\d+\.\d+)\s+\*\s+(?P<message>.*)'))
