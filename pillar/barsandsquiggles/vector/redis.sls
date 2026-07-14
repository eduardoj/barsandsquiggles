vector:
  additional_groups:
    - redis
  config:
    sources:
      source_redis_log:
        type: "file"
        file_key: "file_path"
        include:
        - /var/log/redis/*.log

    transforms:
      parsed_redis_log:
        type: "remap"
        inputs:
          - source_redis_log
        source: |-
          . = merge(., parse_regex!(.message, r'\A(?P<process_id>\d+):(?P<process_role>\w+)\s+(?P<timestamp>\d+\s+\w+\s+\d+\s+\d+:\d+:\d+\.\d+)\s+\*\s+(?P<message>.*)'))
