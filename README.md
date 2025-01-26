# termcreed
A library for termux-login.sh


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
