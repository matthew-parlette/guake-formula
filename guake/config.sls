guake-keybindings:
  {% for user in pillar.get('guake-config',{}).get('keybindings',{}) %}
  file.managed:
    - name: /home/{{ user }}/.gconf/apps/guake/keybindings/local/%gconf.xml
    - user: {{ user }}
    - group: {{ user }}
    - mode: 774
    - template: jinja
    - source: salt://guake/templates/guake-keybindings.xml.jinja
  {% endfor %}
  
