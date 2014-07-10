{% from "guake/map.jinja" import guake with context %}

guake:
  pkg:
    - installed
    - name: {{ guake.pkg }}
