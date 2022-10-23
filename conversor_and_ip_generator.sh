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
    echo -e "\t${purple}-d${end}${gray} Generar un número decimal del 0-255 aleatorio${end}"
    echo -e "\t${purple}-b${end}${gray} Generar un número binario de 8 bits aleatorio${end}"
    echo -e "\t${purple}-x${end}${gray} Generar un número hexadecimal aleatorio${end}"
    echo -e "\t${purple}-i${end}${gray} Generar una dirección IP con la mascara de red de manera aleatoria${end}"
    echo -e "\t${purple}-n${end}${gray} Generar una rista de números aleatorios dependiendo del número que hayas introducido${end}"
    echo -e "\t${purple}-a${end}${gray} Generar números decimales, binarios y hexadecimales aleatoriamente (se utiliza junto con el -n)${end}"
}

function generate_number(){

    random_number=$(($RANDOM % 256))
    echo -e "\n${yellow}Número decimal: ${end}${purple}$random_number${end}"
    while [ 0 -eq 0 ]; do

        echo -e "\n${yellow}[+]${end}${gray} Elige una opción${end}"
        echo -e "\n\t${yellow}[+]${end}${gray} Solución en binario      ${end}${yellow}[1]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Solución en hexadecimal  ${end}${yellow}[2]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Generar otro número      ${end}${yellow}[3]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Quiero hacer otra cosa   ${end}${yellow}[4]${end}"
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
            clear
            generate_number
        fi

        if [ "$option" -eq 4 ]; then

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
        echo -e "\t${yellow}[+]${end}${gray} Generar otro número      ${end}${yellow}[3]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Quiero hacer otra cosa   ${end}${yellow}[4]${end}"
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
            clear
            generate_binary
        fi
        
        if [ "$option" -eq 4 ]; then

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
        echo -e "\t${yellow}[+]${end}${gray} Generar otro número      ${end}${yellow}[3]${end}"
        echo -e "\t${yellow}[+]${end}${gray} Quiero hacer otra cosa   ${end}${yellow}[4]${end}"
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
            clear
            generate_hex
        fi

        if [ "$option" -eq 4 ]; then

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

function number_numbers(){

    number=$1

    if [ -z $number ]; then
        echo hola
    fi

    echo -e "\n${yellow}[+]${end}${gray} Imprimiendo ${end}${yellow}$number${end}${gray} números decimales:${end}\n"
    for quantity in $(seq -w 1 $number); do
        random_number=$((RANDOM % 256))
        echo -e "\t${purple}[$quantity]${end}${gray} Número decimal:${end} ${yellow}$random_number${end}"
        let counter+=1
    done
    echo
}

function number_binaries(){
    
    number=$1
    
    echo -e "\n${yellow}[+]${end}${gray} Imprimiendo ${end}${yellow}$number${end}${gray} números binarios:${end}\n"
    for quantity in $(seq -w 1 $number); do
        random_number=$((RANDOM % 256))
        binary=$(echo "obase=2;$random_number" | bc)
        echo -e "\t${purple}[$quantity]${end}${gray} Número binario:${end} ${yellow}$binary${end}"
        let counter+=1
    done
    echo
}

function number_hex(){

    number=$1

    echo -e "\n${yellow}[+]${end}${gray} Imprimiendo ${end}${yellow}$number${end}${gray} números hexadecimales:${end}\n"
    for quantity in $(seq -w 1 $number); do
        random_number=$((RANDOM % 256))
        hex=$(echo "obase=16;$random_number" | bc)
        echo -e "\t${purple}[$quantity]${end}${gray} Número decimal:${end} ${yellow}$hex${end}"
        let counter+=1
    done
    echo
}

function generate_aleatory(){
    
    all=$1

    while [ "$all" != "$quantity" ]; do
        for quantity in $(seq -w 1 $1); do

            random_number=$((RANDOM % 256))
            random_number_binary=$((RANDOM % 256))
            random_number_hex=$((RANDOM % 256))

            decimal=$(echo "obase=10;$random_number" | bc)
            solution_decimal_to_binary=$(echo "obase=2;$decimal" | bc)
            solution_decimal_to_hex=$(echo "obase=16;$decimal" | bc)

            binary=$(echo "obase=2;ibase=10;$random_number_binary" | bc)
            solution_binary_to_decimal=$(echo "ibase=2;$binary;obase=10" | bc)
            solution_binary_to_hex=$(echo "obase=16;ibase=2;$binary" | bc)

            hex=$(echo "obase=16;ibase=10;$random_number_hex" | bc)
            solution_hex_to_decimal=$(echo "obase=10;ibase=16;$hex" | bc)
            solution_hex_to_binary=$(echo "obase=2;ibase=16;$hex" | bc)
            
            declare -i counter=1

            echo -e "\n${yellow}[$quantity/$all]${end}${gray} Imprimiendo números aleatorios de cada:${end}\n"

            echo -e "\t${purple}[$counter]${end}${gray} Número decimal:${end} ${yellow}$decimal${end}"
            let counter+=1

            echo -e "\t${purple}[$counter]${end}${gray} Número binario:${end} ${yellow}$binary${end}"
            let counter+=1

            echo -e "\t${purple}[$counter]${end}${gray} Número hexadecimal:${end} ${yellow}$hex${end}\n"
            
            echo -ne "${yellow}[+]${end}${gray} ¿Deseas mostrar las soluciones? ${end}${blue}[Y/N] (default: Y) ${end}${gray}-> ${end}" && read solutions

            while [ $solutions != "N" ] && [ $solutions != "n" ] && [ $solutions != "Y" ] && [ $solutions != "y" ]; do

                echo -e "\n${red}[!] Introduce una opción valida${end}"
                echo -ne "${yellow}[+]${end}${gray} ¿Deseas mostrar las soluciones? ${end}${blue}[Y/N] (default Y) ${end}${gray}-> ${end}" && read solutions
            done

            if [ "$solutions" == "N" ] || [ "$solutions" == "n" ]; then

                clear
                continue
            else

                echo -e "\n${yellow}[+]${end}${gray} Imprimiendo las soluciones:\n"
                
                echo -e "\t${purple}[1]${end}${gray} Número decimal ${yellow}$decimal${end}${gray}:${end}"
                echo -e "\t\t${purple}[+]${end}${gray} Solución en binario: ${end}${green}$solution_decimal_to_binary${end}"
                echo -e "\t\t${purple}[+]${end}${gray} Solución en hexadecimal: ${end}${green}$solution_decimal_to_hex${end}"

                echo -e "\n\t${purple}[2]${end}${gray} Número binario ${yellow}$binary${end}${gray}:${end}"
                echo -e "\t\t${purple}[+]${end}${gray} Solución en decimal: ${end}${green}$solution_binary_to_decimal${end}"
                echo -e "\t\t${purple}[+]${end}${gray} Solución en hexadecimal: ${end}${green}$solution_binary_to_hex${end}"

                echo -e "\n\t${purple}[3]${end}${gray} Número hexadecimal ${yellow}$hex${end}${gray}:${end}"
                echo -e "\t\t${purple}[+]${end}${gray} Solución en binario: ${end}${green}$solution_hex_to_binary${end}"
                echo -e "\t\t${purple}[+]${end}${gray} Solución en decimal: ${end}${green}$solution_hex_to_decimal${end}"
                
                if [ "$all" != "$quantity" ]; then
                    tput civis
                    echo -ne "\n${green}[!] Presiona enter para continuar " && read continuing
                    tput cnorm
                fi

                if [ != $continuing ] && [ "$all" != "$quantity" ]; then
                    
                    clear
                    continue
                fi
            fi
        done
    done

    echo -e "\n${green}[+] ¡Terminaste todas tus operaciones!${end}"
    echo -e "${green}[+] Espero que te haya servido de ayuda :)${end}"
    echo -e "\n${green}[+] Saliendo ...${end}"
    exit 0
}

declare -i parameter_counter=0

while getopts "hdbxirn:a:" arg; do
    
    case $arg in
        h) ;;
        d) $OPTARG; let parameter_counter+=1;;
        b) $OPTARG; let parameter_counter+=2;;
        x) $OPTARG; let parameter_counter+=3;;
        i) $OPTARG; let parameter_counter+=4;;
        n) number="$OPTARG"; let parameter_counter+=5;;
        a) all="$OPTARG"; let parameter_counter+=9
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
elif [ $parameter_counter -eq 6 ]; then

    number_numbers "$number"
elif [ $parameter_counter -eq 7 ]; then

    number_binaries "$number"
elif [ $parameter_counter -eq 8 ]; then

    number_hex "$number"
elif [ $parameter_counter -eq 9 ]; then

    generate_aleatory "$all"
else

    helpPanel
fi
