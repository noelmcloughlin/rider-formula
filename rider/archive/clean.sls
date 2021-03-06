# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import rider with context %}

rider-package-archive-clean-file-absent:
  file.absent:
    - names:
      - {{ rider.dir.tmp }}
                  {%- if grains.os == 'MacOS' %}
      - {{ rider.dir.path }}/{{ rider.pkg.name }}*{{ rider.edition }}*.app
                  {%- else %}
      - {{ rider.dir.path }}
                  {%- endif %}
