{% from "guake/map.jinja" import indicator with context %}

indicator:
  pkg:
    - installed
    - name: {{ indicator.pkg }}
    {% if indicator.ppa is defined %}
    - pkgrepo.managed:
      - ppa: {{ indicator.ppa }}
    {% endif %}
  {% for user in pillar.get('guake-indicator',{}) %}
  {% if user != "common" %}
  file.managed:
    - name: /home/{{ user }}/.guake-indicator/guake-indicator.json
    - user: {{ user }}
    - group: {{ user }}
    - mode: 774
    - template: jinja
    - source: salt://guake/templates/guake-indicator.json.jinja
    - require:
      - pkg: indicator
  {% endif %}
  {% endfor %}
  
