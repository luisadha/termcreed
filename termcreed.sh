#!/usr/bin/env bash
# termcreed.sh
# version: v0.02
# Copyright (c) 2025 - Luis Adha (Don't rewrite these comments)


# Setting your credential informations
username_valid="$(cat ~/.ssh/userid)";
password_valid="$(age -d -i ~/.ssh/keyid.txt ~/.ssh/passid)"

# Settings your text Interactive
declare -u text_username="Nama Pengguna :"
declare -u text_password="Kata Sandi :"
declare if_sucstr="Login successful";
declare if_failstr="Login failed";

: "Main code"
# Varibale sets
readonly x=2
readonly y=7
readonly lineno_1=1
readonly lineno_2=4
ulenght=${#text_username}
plenght=${#text_password}
ucursor=$(( ulenght + 2 ))
pcursor=$(( plenght + 2 ))
sym="┃";
border_split=('┏' '┓' '━' '┗' '┛')
width=30
height=5
corner_tl="┌"
corner_tr="┐"
corner_bl="└"
corner_br="┘"
horizontal="─"
vertical="│"

center_text() {
    local text="$1"
    local cols=$(tput cols)
    local text_length=${#text}
    local padding=$(( (cols - text_length) / 2 ))
    (( padding < 0 )) && padding=0
    printf "%*s%s\n" "$padding" "" "$text" | boxes -d "$@"

}
drawTextFill() {
 local arg=$1;
 local cols=$(echo "$(tput cols) -1" | bc )
 local calc=$(echo "${cols} - ${#arg}" | bc)
 echo -en $arg && printf %"$calc"s | tr " " "-" | tr "-" " "
}
box() {
	#local args=$
	echo "${border_split[0]}${border_split[2]}${border_split[1]}"
	echo "${border_split[3]}${border_split[2]}${border_split[4]}"
}
align_top() {
	printf %"$(echo "$(tput cols) - 2" | bc)"s | sed "s/ /${border_split[2]}/g" | sed "s/^/${border_split[0]}/g" | sed "s/$/${border_split[1]}/g"
}
align_bottom() {
	printf %"$(echo "$(tput cols) - 2" | bc)"s | sed "s/ /${border_split[2]}/g" | sed "s/^/${border_split[3]}/g" | sed "s/$/${border_split[4]}/g"
}
sign_form() {
align_top
drawTextFill "${sym} ${@}" | sed "s/$/${sym}/g"
align_bottom
}
pasw_form() { sign_form "$@"; }

#exit || return # for debug
while :; do clear;

tput sc; sign_form "$text_username"; tput cup $lineno_1 $ucursor; read username; tput cup $x; echo
tput sc; pasw_form "$text_password"; tput cup $lineno_2 $pcursor; read -s password; tput cup $y;

 if [[ "$username" == "$username_valid" && "$password" == "$password_valid" ]]; then
	    center_text "${if_sucstr}!" -d stone
    break
 else
         center_text "${if_failstr}!" -d f90-box
      sleep 1
    continue
 fi
done

