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

Backup first your termux-login.sh

```sh

echo '
[ -z "$BASH_VERSION" ] && exec bash "$0" "$@"
trap '' SIGINT #SIGTSTP

source ~/termcreed/*.sh ' > $PREFIX/etc/termux-login.sh
```
## forgot password?

![preview](./forgot_password.jpg)
# License
MIT
