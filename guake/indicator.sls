{% from "guake/map.jinja" import guake-indicator with context %}

indicator:
  pkg:
    - installed
    - name: {{ guake-indicator.pkg }}
    {% if guake-indicator.ppa %}
    - pkgrepo.managed:
      - ppa: {{ guake-indicator.ppa }}
    {% endif %}
