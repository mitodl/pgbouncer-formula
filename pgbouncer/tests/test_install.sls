{% from "pgbouncer/map.jinja" import pgbouncer with context %}

{% for pkg in pgbouncer.pkgs %}
test_{{pkg}}_is_installed:
  testinfra.package:
    - name: {{ pkg }}
    - is_installed: True
{% endfor %}
