#! /bin/bash
clear
echo "
██████████ ██████   ██████ ██████████ █████   ████   █████████  
░░███░░░░░█░░██████ ██████ ░░███░░░░░█░░███   ███░   ███░░░░░███ 
 ░███  █ ░  ░███░█████░███  ░███  █ ░  ░███  ███    ░███    ░███ 
 ░██████    ░███░░███ ░███  ░██████    ░███████     ░███████████ 
 ░███░░█    ░███ ░░░  ░███  ░███░░█    ░███░░███    ░███░░░░░███ 
 ░███ ░   █ ░███      ░███  ░███ ░   █ ░███ ░░███   ░███    ░███ 
 ██████████ █████     █████ ██████████ █████ ░░████ █████   █████
░░░░░░░░░░ ░░░░░     ░░░░░ ░░░░░░░░░░ ░░░░░   ░░░░ ░░░░░   ░░░░░ 



________________________________________________"| lolcat


echo "I do whois query and google dork queries on urls"

# using select in the menu

submenu () {
local PS3='Please enter Google Dorking options: '
 select opt in "Pages Containing Login Portals" "Sensitive Directories" "Files Containing Passwords" "Files Containing Juicy Info" "Advisories and Vulnerabilities" "Back to Main Menu" 
      do
      case $opt in
          "Pages Containing Login Portals")
           while read line
           do
             search="$line"
             firefox --new-tab "https://www.google.com/search?q=$search" &
             done < Portal.txt            ;;
          "Sensitive Directories")
           while read line
           do
             search="$line"
             firefox --new-tab "https://www.google.com/search?q=$search" &
             done < Usernames.txt;;
           "Files Containing Passwords")

while read line
do
   search="$line"
   firefox --new-tab "https://www.google.com/search?q=$search" &
  done < Passwords.txt;;
          "Files Containing Juicy Info")
while read line
do
   search="$line"
   firefox --new-tab "https://www.google.com/search?q=$search" &
  done < Juicy.txt;;
          "Advisories and Vulnerabilities")

while read line
do
   search="$line"
   firefox --new-tab "https://www.google.com/search?q=$search" &
   done < Vuln.txt    ;;

          "Back to Main Menu")
              return
              ;;
          *) echo "invalid option";;
      esac
  done
clear
}
function Googledork {
echo "Please press enter for google dorks"
read line
while read line
do
   search="$line"
   firefox --new-tab "https://www.google.com/search?q=$search" &
   done < dork.txt

}
function Whois {

read -p "Enter the domain: " url
whois $url| grep -E '^[[:space:]]*(Registr(ar|ant|y)|Sponsoring|Address|Name|Tech|Admin|Domain).*: '

}
PS3="Enter option: "
select option in "Whois query" "Google dork" "Both" "Quit"
do
case $option in
"Quit")
break ;;
"Whois query")
clear
read -p "Enter the domain: " url
whois $url| grep -E '^[[:space:]]*(Registr(ar|ant|y)|Sponsoring|Address|Name|Tech|Admin|Domain).*: '
 ;;
"Google dork")
clear
submenu ;;
"Both")
clear
Whois

Googledork ;;
*)


echo "Sorry, wrong selection";;
esac
done

echo "See you again!" | lolcat

