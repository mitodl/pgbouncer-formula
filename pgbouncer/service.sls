{% from "pgbouncer/map.jinja" import pgbouncer with context %}

pgbouncer_service_running:
  service.running:
    - name: {{ pgbouncer.service }}
    - enable: True
