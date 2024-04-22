#!/data/data/com.termux/files/user/bin/bash

# Code by Dark-34 2024 © 
#Colours
g="\e[0;32m\033[1m"
en="\033[0m\e[0m"
re="\e[0;31m\033[1m"
b="\e[0;34m\033[1m"
y="\e[0;33m\033[1m"
p="\e[0;35m\033[1m"
c="\e[0;36m\033[1m"
gra="\e[0;37m\033[1m"

path="/data/data/com.termux/files/usr/share/ngrok"

function banner {
	clear
	echo -e "\t${b}=============================${en}"
	echo -e "\t${b}=     ${g} Code by Dark-34      ${b}=${en}"
	echo -e "\t${b}=       ${g} Version 1.0        ${b}=${en}"
	echo -e "\t${b}=============================${en}\n"
}


function install {
	banner 
	echo -e "${g} Deseas seguir con la instalacion de Ngrok:\n"
	echo -e "${b}\n"
	read -p "[Y/N]: " opt
	if [ "$opt" == "y" ];then
		banner
		echo -e "${c} Instalando Ngrok en su termux......${en}\n"
		rm $PREFIX/bin/ngrok
		rm -rf $PREFIX/share/ngrok
		mkdir -p $PREFIX/share/ngrok
		cp download.sh $PREFIX/share/ngrok
		cp ngrok $PREFIX/bin
		apt update -y > /dev/null 2>&1 
		apt upgrade -y > /dev/null 2>&1
		apt install -y proot > /dev/null 2>&1
		apt install -y wget > /dev/null 2>&1
		apt install -y resolv-conf > /dev/null 2>&1
		apt clean > /dev/null 2>&1
		apt autoremove > /dev/null 2>&1
		cd $PREFIX/share/ngrok
		bash download.sh > /dev/null 2>&1 
		sleep 1
		if [ -f $path/ngrok ] || [ -f $PREFIX/bin/ngrok ];then
			banner 
			echo -e "${b}[✓]${g} Se instalo correctamente\n${en}"
			echo -e "${c}Usa : ngrok http 8080, ngrok tcp 4546\n"
		else
			echo -e "${re} [x]${g} Algo salio mal, vuelve a ejecutar el script\n${en}"
		fi
	elif [ "$opc" == "n" ];then
		echo -e "${c} Es una lastima, vuelve pronto${en}"
	fi
}
install 
