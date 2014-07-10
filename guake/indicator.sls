{% from "guake/map.jinja" import indicator with context %}

indicator:
  pkg:
    - installed
    - name: {{ indicator.pkg }}
    {% if indicator.ppa is defined %}
    - pkgrepo.managed:
      - ppa: {{ indicator.ppa }}
    {% endif %}
