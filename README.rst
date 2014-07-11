=============
guake-formula
=============

A formula to setup guake and, optionally, guake-indicator.

Since the configuration files are per-user, there needs to be some direction in the pillar file to define which users should get the configurations.

The pillar data for this can get quite large, but it should be easier to manage it as opposed to directly modifying the json file (for guake-indicator).

Note that a login name is required for guake-indicator. Future work may be able to generalize this so it isn't hard-coded in the pillar file.

.. note::

    This has only been tested on Ubuntu 14.04.

Available states
================

.. contents::
    :local:

``guake``
---------

Installs the guake package.

``guake.indicator``
-------------------

Installs the guake-indicator package and configures the menu according to pillar.

See pillar.example for usage.

``guake.autostart``
-------------------

Copies a .desktop file to autostart guake or guake-indicator in Ubuntu.

``guake.config``
----------------

Configures guake key bindings from pillar.

See pillar.example for usage. The key bindings must be XML-compliant.
