{% from "pgbouncer/map.jinja" import pgbouncer with context %}

include:
  - .service

pgbouncer:
  pkg.installed:
    - pkgs: {{ pgbouncer.pkgs }}
    - require_in:
        - service: pgbouncer_service_running
