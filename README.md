# termcreed
A library for termux-login.sh
<a href="https://asciinema.org/a/UZPoC6PqFApLTadT1aO8n7ek6" target="_blank"><img src="https://asciinema.org/a/UZPoC6PqFApLTadT1aO8n7ek6.svg" /></a>
# Requirement
- ldd $(which tput)
- which boxes
- which age

## Usage

```sh
-bash:~$cat $PREFIX/usr/etc/termux-login.sh
#!/bin/bash

[ -z "$BASH_VERSION" ] && exec bash "$0" "$@"
trap '' SIGINT
#SIGTSTP

source ~/termcreed/*.sh
termcreed
```
