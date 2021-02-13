#! /bin/bash


case "$1" in

-i) read -p "Enter a name: " name
    read -p "Enter Number: " number
    echo "=>$name: $number" >> phonebook.sh
    ;;

-v) cat ./phonebook.sh | sed -n '/^=>.*:/p' ;;


-s) grep -iw "$2" ./phonebook.sh
	 ;;

-e) sed -i '/^=>.*:/d' ./phonebook.sh
    echo "All contacts deleted!"
      ;;

-d) sed -i -E "/^=>$2: /d" ./phonebook.sh
       
 ;;

*) echo "Option $1 not recognized" ;;
 
esac
exit 0

=>youssef george: 01229999466
