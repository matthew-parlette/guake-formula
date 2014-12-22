{% from "guake/map.jinja" import indicator with context %}

guake-indicator:
  pkg:
    - installed
    - name: {{ indicator.pkg }}
    {% if indicator.ppa is defined %}
    - pkgrepo.managed:
      - ppa: {{ indicator.ppa }}
    {% endif %}

{% for user in pillar.get('guake-indicator',{}).get('users',[]) %}
guake-indicator-{{ user }}:
  file.managed:
    - name: /home/{{ user }}/.guake-indicator/guake-indicator.json
    - user: {{ user }}
    - group: {{ user }}
    - mode: 774
    - template: jinja
    - source: salt://guake/templates/guake-indicator.json.jinja
    - defaults:
        user: {{ user }}
    - require:
      - pkg: guake-indicator
{% endfor %}
  
