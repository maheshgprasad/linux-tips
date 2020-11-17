## Variable Definition
# GLOBAL_PATH=


## Function Definition
#Encrypt Vault
one (){
	local enc_path
	echo "Ansible-Vault Encryption"
	echo "Enter the path of the file that you wish to encrypt"
	read enc_path
	ansible-vault encrypt $enc_path
	echo "*********************************"
	echo ""
	echo "_________________________________"
}
#Decrypt Vault
two (){
	local dec_path
	echo "Ansible-Vault Decryption"
	echo "Enter the path of the file that you wish to decrypt"
	read dec_path
	ansible-vault decrypt $dec_path
	echo "********************************"
	echo ""
	echo "________________________________"

}
#Edit Vault
three(){
	local edi_path
	echo "Editing Ansible-Vault Contents"
	echo "Enter the path of the file that you wish to edit"
	read edi_path
	ansible-vault edit $edi_path
	echo ""
	echo ""
	echo "________________________________"
}
#Re-Key Vault
four(){
	local r_key
	echo "Re-Keying Ansible-Vault"
	echo "Enter the path of the file that you wish to re-key"
	read r_key
	ansible-vault rekey $r_key
	echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
	echo ""
	echo "________________________________"

}
#View Vault Content
five(){
	local view_c
	echo "View Ansible-Vault Contents"
	echo "Enter the path of the file that you wish to view"
	read view_c
	ansible-vault view $view_c
        echo ""
	echo ""
	echo "________________________________"	
}

#Program Definition
menu(){
	#clear
	echo "#################################"
	echo "     Ansible-Vault Main Menu     "
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
		*) echo -e "Not a valid selection!" && sleep 2
	esac
}

while true
do
	menu
	read_selection
done

