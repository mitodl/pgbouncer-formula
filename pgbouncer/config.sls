{% from "pgbouncer/map.jinja" import pgbouncer with context %}

include:
  - .install
  - .service

pgbouncer-config:
  file.managed:
    - name: {{ pgbouncer.conf_file }}
    - source: salt://pgbouncer/templates/conf.jinja
    - template: jinja
    - context:
        config: {{ pgbouncer.config }}
    - watch_in:
      - service: pgbouncer_service_running
    - require:
      - pkg: pgbouncer
