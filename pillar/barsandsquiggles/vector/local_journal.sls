vector:
  enable_journal: true
  additional_groups:
    - systemd-journal
  config:
    sources:
      local_journal:
        type: "journald"
