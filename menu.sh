#!/bin/zsh

     # Using `case` statement

     echo "Choose an option below:\n";
     echo "A) Disk free space (only for physical file systems, not virtual file systems)";
     echo "B) HOME directory Size (This is the size of HOME directories)";
     echo "C) Number of .conf files in the /etc";
     echo "D) The largest file size in HOME (only the regular file type)";

     read

     case $REPLY in
          A | a ) echo "Disk free space is: "; df -h -T / ;;
          B | b ) echo -n "HOME directory size is: "; du -hs $HOME | cut -f1 ;;
          C | c ) echo -n "Number of .conf files in the /etc is: "; ls /etc/*.conf | wc -l ;;
          D | d ) echo -n "The largest file size in HOME is: "; find $HOME -type f -printf '%s %p\n' | sort -nr | head -1 ;;
          *) echo "Wrong input" ;;
     esac

     # Using `if` statement

     echo "Choose operation below:\n";
     echo "A) Disk free space (only for physical file systems, not virtual file sytems)";
     echo "B) HOME directory size (This is the size of HOME directories)";
     echo "C) Number of .conf files in /etc";
     echo "D) The largest file size in HOME (only the regular file type)\n";

     read choice

     if [[ $choice == A || $choice == a || $choice == B || $choice == b || $choice == C || $choice == c || $choice == D || $choice == d ]]
     then
          if [[ $choice == A || $choice == a ]]
          then
                    echo "Your disk free space is: ";
                    df -h
          fi
          if [[ $choice == B || $choice == b ]]
          then
                    echo -n "Home directory size is: ";
                    du -hs $HOME | cut -f 1
          fi
          if [[ $choice == C || $choice == c ]]
          then
                    echo -n "Number of .conf files in /etc is: ";
                    ls /etc/*.conf | wc -l
          fi
          if [[ $choice == D || $choice == d ]]
          then
                    echo -n "The largest file size in HOME is: ";
                    find $HOME -type f -printf '%s %p\n' | sort -nr | head -1
          fi
     else
          echo "Wrong input!\n";
     fi
