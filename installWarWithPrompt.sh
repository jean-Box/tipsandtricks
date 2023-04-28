#!/bin/sh

help_function()
{
  echo "Usage: `basename $0` [option...] : Installs one of WARs located at /opt/application/xxx/current/war"
  echo "-h, --help                         displays help menu"
  echo ""
  echo "Example: ./installWarWithPrompt.sh"
  exit 0
}
### Variable
# home directory 
home_dla_path='/home/dla'

# Path of the destination directory on the remote machine
install_dir='/opt/application/xxx/current/war/'

old_name="file-1.war"
old_path_name=($(find $home_dla_path -name "$old_name" -type f | sort))

###
echo ""

if [ ${#old_path_name[@]} -gt 0 ]; then
  echo "***               Step 1/3: Rename War File                           ***"
  echo "*                                                                       *"

  # Spécifiez le fichier à renommer
  old_basename=$(basename -- "${old_path_name[0]}")
  filename="${old_basename%.*}"
  read -p "* Do you want to RENAME the file ${filename}? (y/n) " choiceVersion
  if [ "$choiceVersion" == "y" ]; then
    # Determine the current date in the format "dd-mm-yy-hh-mm"
    current_date=$(date +"%d-%m-%y-%H-%M")

    new_name="$filename-$current_date.war"
    echo "* New name of war file: $new_name"

    # Renommez le fichier en utilisant la commande mv
    mv "$home_dla_path/$old_name" "$home_dla_path/$new_name"

  fi
  echo "***               Step 1/3: End                                         ***"

fi

echo ""

# create an array of war files found in /home/dla
war_files_in_home=($(find $home_dla_path -name '*.war' -type f | sort))

# check if no war files were found
if [ ${#war_files_in_home[@]} -gt 0 ]; then
  echo "***               Step 2/3: Move War File                             ***"
  echo "*                                                                       *"

  # display a list of war files found
  echo "* The following .war files were found in the /home/dla directory:"
  for i in "${!war_files_in_home[@]}"
  do
    echo "* $((i+1)) - ${war_files_in_home[$i]}"
  done
  echo "*                                                                       *"
  # ask the user which file they want to move
  read -p "* Which file would you like to move to $install_dir? (Enter the number) " choice
  # check if the user's selection is valid
  if [ $choice -gt 0 ] && [ $choice -le ${#war_files_in_home[@]} ]; then
    echo "*                                                                       *"

    # dvo1plcptb00000 => Perco
    if [ "$HOSTNAME" != "dvo1plcptb00000" ]; then
        # Déplace le fichier sur la machine distante via SSH
        scp -i /home/dla/.ssh/id_rsa "${war_files_in_home[$((choice-1))]}" dla@localhost:$home_dla_path
        echo "* The file has been moved to  (localhost:$home_dla_path)"
        echo "*                                                                       *"
    fi

    # move the selected file to /opt/application/xxx/current/war/
    mv "${war_files_in_home[$((choice-1))]}" $install_dir
    echo "* The file has been moved to $install_dir"
    echo "*                                                                       *"
  else
    # if the selection is invalid display error message
    echo "* Invalid selection"
  fi
  echo "***               Step 2/3: End                                         ***"
fi

echo ""

# Array of war files found in install war repository
war_in_install_dir=($(find $install_dir -name '*.war' -type f | sort))

if [ ${#war_in_install_dir[@]} -gt 0 ]; then
  echo "***               Step 3/3: Install War File                            ***"
  echo "*                                                                       *"

  for i in "${!war_in_install_dir[@]}"
  do
    echo "* $((i+1)) - ${war_in_install_dir[$i]}"
  done

  read -p "* Select WAR file to install by entering corresponding file index: " choice

  if [ $choice -gt 0 ] && [ $choice -le ${#war_in_install_dir[@]} ]; then
    chown dla:dla "${war_in_install_dir[$((choice-1))]}"
    su - opentv -c "cd /opt/application/xxx/current/tomcat/00/webapps; unlink file-1.war; ln -s ${war_in_install_dir[$((choice-1))]} file.war"
    echo "* The installation is done."

    echo "* Restarting ..."
    service tomcat restart $(app)
    
  else
    # if the selection is invalid display error message
    echo "* Invalid selection"
  fi

  echo "***               Step 3/3: End                                         ***"

else
    echo "* ERROR: No WAR file at the following path: $war_in_install_dir"
fi

echo "***               Fin de l'installation                               ***"
