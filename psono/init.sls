{%- from "psono/map.jinja" import config with context %}

python-pip:
  pkg.installed


install_compose:
  pip.installed:
  - name: docker-compose
  - require:
    - pkg: python-pip


{{ config.location }}:
  file.directory:
    - mode: 755
    - makedirs: True


{{ config.location }}/settings.yaml:
  file.serialize:
    - serializer: yaml
    - dataset: {{ config.settings }}
    - serializer_opts:
      - explicit_start: True
      - default_flow_style: True
      - indent: 4


{{ config.location }}/config.json:
  file.serialize:
    - serializer: json
    - dataset: {{ config.config_json }}


{{ config.location }}/docker-compose.yml:
  file.managed:
  - source: salt://psono/files/docker-compose.yml.jinja2
  - template: jinja


# start_psono:
#   dockercompose.up:
#   - name: {{ config.location }}/docker-compose.yml


# restart_psono:
#   dockercompose.restart:
#   - watch:
#     - file: {{ config.location }}/.env
#     - file: {{ config.location }}/docker-compose.yml
