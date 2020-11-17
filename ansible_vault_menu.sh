## Variable Definition



## Function Definition
#Encrypt Vault
one (){
#ASCII COLOURS
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NoCLR='\033[0m'
gen_sha(){
    local pl_txt
    local vault_sec_name
    echo "${GREEN}Ansible-Vault SHA256 PassPhrase Generator${NoCLR}"
    echo "${BLUE}NOTE${NoCLR}:User password is converted to SHA256 value"
    echo "${BLUE}NOTE${NoCLR}: This is a normal encryption technique"
    echo ""
    echo "Provide a name for your Vault-Key-File"
    read vault_sec_name
    echo "Provide a Pass-Phrase for your Vault-Key-File"
    read pl_txt
    RESULT=$(echo $pl_txt |sha256sum|cut -c 1-18)  
    echo $RESULT  > ansible-vault-$vault_sec_name.pass
    echo "Please find your Vault-Key_File named ${YELLOW} ansible-vault-$vault_sec_name.pass${NoCLR}"
}

gen_rsa(){
    local vault_sec_name
    echo "${GREEN}Ansible-Vault RSA 2048 PassPhrase Generator${NoCLR}"
    echo "${RED}WARNING!${NoCLR}:Generates random RSA 2048 Pass-Phrase-Key-File"
    echo "${RED}WARNING!${NoCLR}:Vault may be rendered INOPERABLE if the Key-File is lost"
    echo "${BLUE}NOTE${NoCLR}: This is a stronger encryption technique"
    echo ""
    echo "Provide a name for your Vault-Key-File"
    read vault_sec_name
    openssl rand -base64 2048 > ansible-vault-$vault_sec_name.pass
    echo "Please find your Vault-Key_File named ${YELLOW} ansible-vault-$vault_sec_name.pass${NoCLR}"
}

key_menu(){
	#clear
	echo "#################################"
	echo "    Ansible-Vault Key-Gen Menu   "
	echo "#################################"
	echo " 1. SHA 256  Key-Gen"
	echo " 2. RSA 2048 Key-Gen"
	echo " 3. Exit"
	echo " Please make a selection"
	echo "#################################"
}

read_key_selection(){
	local choice
	read choice
	case $choice in
		1) gen_sha ;;
		2) gen_rsa ;;
		3) exit 0;;
		*) echo "Not a valid selection!" && sleep 2
	esac
}

while true
do
	key_menu
	read_key_selection
done
	
}

# Vault Operations
two (){
#ASCII COLOURS
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NoCLR='\033[0m'
main_prgm(){
    local file_path
    local vk_path
    echo "Ansible-Vault Encryption Using Key-File"
	echo "Enter the path of the file that you wish to operate"
	read file_path
	FPTH=$file_path
    echo "Enter the path of the Vault-Key"
	read vk_path
	VKPTH=$vk_path
	wh
}

#Encrypt Vault
one (){
	local enc_path
	echo "Ansible-Vault Encryption"
	ansible-vault encrypt $FPTH --vault-password-file=$VKPTH
	echo "*********************************"
	echo ""
	echo "_________________________________"
}
#Decrypt Vault
two (){
	local dec_path
	echo "Ansible-Vault Decryption"
	ansible-vault decrypt $FPTH --vault-password-file=$VKPTH
	echo "********************************"
	echo ""
	echo "________________________________"

}
#Edit Vault
three(){
	local edi_path
	echo "Editing Ansible-Vault Contents"
	ansible-vault edit $FPTH --vault-password-file=$VKPTH
	echo ""
	echo ""
	echo "________________________________"
}
#Re-Key Vault
four(){
	local r_key
	echo "Re-Keying Ansible-Vault"
    echo "${RED} Re-Keying Changes the encryption mechanism from Key-File to a Password!${NoCLR}"
    echo "${YELLOW} Press Return / Enter without entering a Password to abort this action ${NoCLR}"
	ansible-vault rekey $FPTH --vault-password-file=$VKPTH
	echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
	echo ""
	echo "________________________________"

}
#View Vault Content
five(){
	local view_c
	echo "View Ansible-Vault Contents"
	ansible-vault view $FPTH --vault-password-file=$VKPTH
    echo ""
	echo ""
	echo "________________________________"	
}

#Program Definition
menu(){
	#clear
	echo "#################################"
	echo "     Ansible-Vault Main Menu     "
    echo "    Operations Using Key File    "
	echo "#################################"
	echo " 1. Encrypt Vault"
	echo " 2. Decrypt Vault"
	echo " 3. Edit Vault Content"
	echo " 4. Re-Key Vault"
	echo " 5. View Vault Content"
	echo " 6. Exit"
	echo " Please make a selection"
	echo "#################################"
}

read_selection(){
	local choice
	read choice
	case $choice in
		1) one ;;
		2) two ;;
		3) three ;;
		4) four ;;
		5) five ;;
		6) exit 0;;
		*) echo -e "Not a valid selection!" && sleep 5
	esac
}

wh(){
while true
do
	menu
	read_selection
done
}

main_prgm

}


#Program Definition
main_menu(){
	clear
	echo "#################################"
	echo "     Ansible-Vault Main Menu     "
	echo "#################################"
	echo " 1. Generate Keys"
	echo " 2. Vault Operations"
	echo " 3. Exit"
	echo " Please make a selection"
	echo "#################################"
}

main_menu_read_selection(){
	local choice
	read choice
	case $choice in
		1) one ;;
		2) two ;;
		3) exit 0;;
		*) echo "Not a valid selection!" && sleep 2
	esac
}

main_menu
main_menu_read_selection

