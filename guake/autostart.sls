{% from "guake/map.jinja" import autostart with context %}

guake-autostart:
  {% for user in pillar.get('guake-indicator',{}).get('users',[]) %}
  file.managed:
    - name: /home/{{ user }}/.config/autostart/guake-indicator.desktop
    - user: {{ user }}
    - group: {{ user }}
    - mode: 774
    - source: salt://guake/files/guake-indicator.desktop
  {% endfor %}
