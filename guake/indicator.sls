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
    - template: jinja
    - user: {{ user }}
    - group: {{ user }}
    - mode: 774
    - source: salt.output.json_out.output({"data":[]})
    - require:
      - pkg: indicator
  {% endif %}
  {% endfor %}
