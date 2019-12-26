{% from "pgbouncer/map.jinja" import pgbouncer with context %}

include:
  - .install
  - .service

pgbouncer-config:
  file.managed:
    - name: {{ pgbouncer.conf_file|tojson }}
    - source: salt://pgbouncer/templates/conf.jinja
    - template: jinja
    - context:
        config: {{ pgbouncer.config }}
    - onchanges_in:
      - service: pgbouncer_service_running
    - require:
      - pkg: pgbouncer

enable_pgbouncer:
  file.managed:
    - name: /etc/default/pgbouncer
    - contents: START=1
    - onchanges_in:
        - service: pgbouncer_service_running
