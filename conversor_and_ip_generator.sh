#!/bin/bash

#Colours
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

function ctrl_c(){
    
    echo -e "\n${red}[!] Saliendo ...${end}"
    tput cnorm; exit 1
}

trap ctrl_c INT


function helpPanel(){

    echo -e "\n${yellow}[i]${end}${gray} Uso:${end}"

    echo -e "\t${purple}-h${end}${gray} Mostrar este panel de ayuda${end}"
    echo -e "\t${purple}-n${end}${gray} Generar un número del 0-255 aleatorio (en caso de introducir un número imprimirán los números hasta el introducido)${end}"
    echo -e "\t${purple}-b${end}${gray} Generar un número binario de 8 bits aleatorio${end}"
    echo -e "\t${purple}-x${end}${gray} Generar un número hexadecimal aleatorio${end}"
    echo -e "\t${purple}-i${end}${gray} Generar una dirección IP con la mascara de red de manera aleatoria${end}"
}

function generate_number(){

    random_number=$(($RANDOM % 256))
    echo -e "\n${yellow}Número decimal: ${end}${purple}$random_number${end}"
    while [ 0 -eq 0 ]; do

        echo -e "\n${yellow}[+]${end}${gray} Elige una opción${end}"
        echo -e "\n\t${yellow}[+]${end}${gray} Solución en binario      ${end}${yellow}[1]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Solución en hexadecimal  ${end}${yellow}[2]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Quiero hacer otra cosa   ${end}${yellow}[3]${end}"
        echo -ne "\n${yellow}[+]${end}${gray} ¿Que opción eliges? ->            ${yellow}" && read option
        echo -e "${end}"


        if [ "$option" -eq 1 ]; then

            binary=$(echo "obase=2;$random_number" | bc)

            echo -ne "${yellow}[+]${end} ${gray}Introduce la respuesta en binario -> ${end}" && read solution

            if [ $solution -eq $binary ]; then

                echo -e "${green}[✔] Correcto, sigue asi!${end}"
            else

                while [ $solution -ne $binary ]; do
                    echo -e "${red}[!] Incorrecto. ¡Pero no te preocupes, vuelvelo a intentar!${end}"
                    echo -ne "\n${yellow}[+]${end} ${gray}Vuelve a intentarlo -> ${end}" && read solution
                done

                if [ $solution -eq $binary ]; then

                    echo -e "${green}[✔] Correcto, sigue asi!${end}"
                fi
            fi
        fi

        if [ "$option" -eq 2 ]; then

            decimal_to_hex=$random_number

            hex=$(echo "obase=16;$random_number" | bc)

            echo -e "${yellow}[!]${end} ${gray}¡IMPORTANTE! Ten en cuenta que las letras deben estar en mayuscula${end}\n"
            echo -ne "${yellow}[+]${end} ${gray}Introduce la respuesta en hexadecimal -> ${end}" && read solution

            if [ $solution == $hex ]; then

                echo -e "${green}[✔] Correcto, sigue asi!${end}"
            else

                while [ $solution != $hex ]; do
                    echo -e "${red}[!] Incorrecto. ¡Pero no te preocupes, vuelvelo a intentar!${end}"
                    echo -ne "\n${yellow}[+]${end} ${gray}Vuelve a intentarlo -> ${end}" && read solution
                done

                if [ $solution == $hex ]; then

                    echo -e "${green}[✔] Correcto, sigue asi!${end}"
                fi
            fi
        fi

        if [ "$option" -eq 3 ]; then

            echo -e "\n${green}[!] ¡Saliendo!${end}"
            echo -e "${green}[+] Espero que te haya servido de ayuda :)${end}"
            exit 0
        fi
    done
}

function generate_binary(){

    random_number=$(($RANDOM % 256))
    binary=$(echo "obase=2;$random_number" | bc)
    
    echo -e "\n${yellow}Número binario: ${end}${purple}$binary${end}"

    while [ 0 -eq 0 ]; do

        echo -e "\n${yellow}[+]${end}${gray} Elige una opción${end}"
        echo -e "\n\t${yellow}[+]${end}${gray} Solución en decimal      ${end}${yellow}[1]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Solución en hexadecimal  ${end}${yellow}[2]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Quiero hacer otra cosa   ${end}${yellow}[3]${end}"
        echo -ne "\n${yellow}[+]${end}${gray} ¿Que opción eliges? ->            ${yellow}" && read option
        echo -e "${end}"


        if [ "$option" -eq 1 ]; then

            decimal=$(echo "obase=10;$random_number" | bc)

            echo -ne "${yellow}[+]${end} ${gray}Introduce la respuesta en decimal -> ${end}" && read solution

            if [ $solution -eq $decimal ]; then

                echo -e "${green}[✔] Correcto, sigue asi!${end}"
            else

                while [ $solution -ne $decimal ]; do
                    echo -e "${red}[!] Incorrecto. ¡Pero no te preocupes, vuelvelo a intentar!${end}"
                    echo -ne "\n${yellow}[+]${end} ${gray}Vuelve a intentarlo -> ${end}" && read solution
                done

                if [ $solution -eq $decimal ]; then

                    echo -e "${green}[✔] Correcto, sigue asi!${end}"
                fi
            fi
        fi

        if [ "$option" -eq 2 ]; then

            decimal_to_hex=$random_number

            hex=$(echo "obase=16;$random_number" | bc)

            echo -ne "${yellow}[+]${end} ${gray}Introduce la respuesta en hexadecimal -> ${end}" && read solution

            if [ $solution == $hex ]; then

                echo -e "${green}[✔] Correcto, sigue asi!${end}"
            else

                while [ $solution != $hex ]; do
                    echo -e "${red}[!] Incorrecto. ¡Pero no te preocupes, vuelvelo a intentar!${end}"
                    echo -ne "\n${yellow}[+]${end} ${gray}Vuelve a intentarlo -> ${end}" && read solution
                done

                if [ $solution == $hex ]; then

                    echo -e "${green}[✔] Correcto, sigue asi!${end}"
                fi
            fi
        fi

        if [ "$option" -eq 3 ]; then

            echo -e "\n${green}[!] ¡Saliendo!${end}"
            echo -e "${green}[+] Espero que te haya servido de ayuda :)${end}"
            exit 0
        fi
    done
}

function generate_hex(){

    random_number=$(($RANDOM % 256))
    hex=$(echo "obase=16;$random_number" | bc)
    
    echo -e "\n${yellow}Número hexadecimal: ${end}${purple}$hex${end}"

    while [ 0 -eq 0 ]; do

        echo -e "\n${yellow}[+]${end}${gray} Elige una opción${end}"
        echo -e "\n\t${yellow}[+]${end}${gray} Solución en decimal      ${end}${yellow}[1]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Solución en binario      ${end}${yellow}[2]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Quiero hacer otra cosa   ${end}${yellow}[3]${end}"
        echo -ne "\n${yellow}[+]${end}${gray} ¿Que opción eliges? ->            ${yellow}" && read option
        echo -e "${end}"


        if [ "$option" -eq 1 ]; then

            decimal_to_binary=$random_number

            decimal=$(echo "obase=10;$random_number" | bc)

            echo -ne "${yellow}[+]${end} ${gray}Introduce la respuesta en decimal -> ${end}" && read solution

            if [ $solution -eq $decimal ]; then

                echo -e "${green}[✔] Correcto, sigue asi!${end}"
            else

                while [ $solution -ne $decimal ]; do
                    echo -e "${red}[!] Incorrecto. ¡Pero no te preocupes, vuelvelo a intentar!${end}"
                    echo -ne "\n${yellow}[+]${end} ${gray}Vuelve a intentarlo -> ${end}" && read solution
                done

                if [ $solution -eq $decimal ]; then

                    echo -e "${green}[✔] Correcto, sigue asi!${end}"
                fi
            fi
        fi
        
        if [ "$option" -eq 2 ]; then

            hex_to_binary=$hex

            binary=$(echo "ibase=16;obase=2;$hex" | bc)

            echo -ne "${yellow}[+]${end} ${gray}Introduce la respuesta en binario -> ${end}" && read solution

            if [ $solution -eq $binary ]; then

                echo -e "${green}[✔] Correcto, sigue asi!${end}"
            else

                while [ $solution -ne $binary ]; do
                    echo -e "${red}[!] Incorrecto. ¡Pero no te preocupes, vuelvelo a intentar!${end}"
                    echo -ne "\n${yellow}[+]${end} ${gray}Vuelve a intentarlo -> ${end}" && read solution
                done

                if [ $solution -eq $binary ]; then

                    echo -e "${green}[✔] Correcto, sigue asi!${end}"
                fi
            fi
        fi

        if [ "$option" -eq 3 ]; then

            echo -e "\n${green}[!] ¡Saliendo!${end}"
            echo -e "${green}[+] Espero que te haya servido de ayuda :)${end}"
            exit 0
        fi
    done
}

function generate_ip_netmask(){

    random_subnet=$((RANDOM % 25))

    ip=$(printf "%d.%d.%d.%d\n" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))")
    echo -e "\n${purple}[+]${end}${gray} Dirección IP: ${end}${yellow}$ip/$random_subnet${end}"
}

declare -i parameter_counter=0

while getopts "hnbxir" arg; do
    
    case $arg in
        h) ;;
        n) $OPTARG; let parameter_counter+=1;;
        b) $OPTARG; let parameter_counter+=2;;
        x) $OPTARG; let parameter_counter+=3;;
        i) $OPTARG; let parameter_counter+=4;;
    esac
done

if [ $parameter_counter -eq 1 ]; then
  
  generate_number
elif [ $parameter_counter -eq 2 ]; then

    generate_binary
elif [ $parameter_counter -eq 3 ]; then

    generate_hex
elif [ $parameter_counter -eq 4 ]; then

    generate_ip_netmask
else

    helpPanel
fi