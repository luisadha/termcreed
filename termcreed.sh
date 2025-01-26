
# termcreed.sh
# version: v0.01
# Copyright (c) 2025 - Luis Adha


# Your credential
username_valid="$(cat ~/.ssh/userid)";
export password_valid="$(age -d -i ~/.ssh/keyid.txt ~/.ssh/passid)"

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

    # Jika padding negatif, set ke 0
    (( padding < 0 )) && padding=0

    # Cetak teks dengan spasi di depan, lalu pipe ke `boxes`
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
drawTextFill "${sym} ${1:-}" | sed "s/$/${sym}/g"
align_bottom
}
pasw_form() { sign_form "$@"; }

# return
while :; do clear;


tput sc; sign_form "SIGN IN:"; tput cup 1 11;  read username; tput cup 2 11; echo
tput sc; pasw_form "PASSWORD:"; tput cup 4 11; read -s password; tput cup 5; echo

 if [[ "$username" == "$username_valid" && "$password" == "$password_valid" ]]; then
	 center_text "Login successful!" -d stone
    break
else
    center_text "Login failed!" -d f90-box
    sleep 1
    continue
fi
done
