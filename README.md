# termcreed
A Script for termux-login.sh usage
<a href="https://asciinema.org/a/UZPoC6PqFApLTadT1aO8n7ek6" target="_blank"><img src="https://asciinema.org/a/UZPoC6PqFApLTadT1aO8n7ek6.svg" /></a>

# Prerequisites

A <a href="https://www.nerdfonts.com">Nerd Font</a> is installed and enabled in your terminal.

# Deps.

* age
* ncurses
* boxes
  
# Usage

```sh
-bash:~$ nano $PREFIX/etc/termux-login.sh
#!/bin/bash

[ -z "$BASH_VERSION" ] && exec bash "$0" "$@"
trap '' SIGINT #SIGTSTP

source ~/termcreed/*.sh

```

# License
MIT
