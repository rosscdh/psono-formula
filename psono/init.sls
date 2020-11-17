{%- from "psono/map.jinja" import config with context %}

psono_python-pip:
  pkg.installed:
  - name: python-pip


psono_install_compose:
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

{{ config.location }}/.env:
  file.managed:
    - contents: |
        DESCRIPTION="psono password manager"

{{ config.location }}/config.json:
  file.managed:
    - serializer: json
    - contents: |
        {{ config.config_json }}


{{ config.location }}/nginx.conf:
  file.managed:
  - source: salt://psono/files/nginx.conf.jinja2
  - template: jinja


{{ config.location }}/docker-compose.yml:
  file.managed:
  - source: salt://psono/files/docker-compose.yml.jinja2
  - template: jinja


# start_psono:
#   dockercompose.up:
#   - name: {{ config.location }}/docker-compose.yml


restart_psono:
  dockercompose.restart:
  - watch:
    - file: {{ config.location }}/.env
    - file: {{ config.location }}/docker-compose.yml
    - file: {{ config.location }}/nginx.conf
    - file: {{ config.location }}/config.json
