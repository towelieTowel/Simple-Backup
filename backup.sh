#! /bin/bash

#path to configuration file
config="${HOME}/.backuprc"

   
cat << "EOF"
______            _                
| ___ \          | |               
| |_/ / __ _  ___| | ___   _ _ __  
| ___ \/ _` |/ __| |/ / | | | '_ \ 
| |_/ / (_| | (__|   <| |_| | |_) |
\____/ \__,_|\___|_|\_\\__,_| .__/ 
                            | |    
                            |_|    
EOF
                                             
                                
run_backup(){
    localPythonPackages="${backup_dir}/local_requirements.txt"
    globalPythonPackages="${backup_dir}/global_requirements.txt"    

    #Generate requirements.txt for locally installed python3 packages
    echo "Backing up locally installed python3 packages"
    pip3 freeze --user > $localPythonPackages
    
    #Generate requirements.txt for globally installed python3 packages
    pip3 freeze > $globalPythonPackages    

    #Copy files to backup folder
    echo "Backing up files"
    zip -r ${backup_dir}/backup_${current_date}.zip ${paths[@]} $localPythonPackages $globalPythonPackages
}

#check if config file exists and is not empty
if [[ -e $config ]];
then
    if [[ -s $config ]];
    then
        #source the config file
        echo "Loading configs"
        source $config
        
        
        paths=(${home_paths[@]} ${abs_paths[@]})
        current_date=$(date +$format)
        
        #If backup directory exists
        if [[ -e $backup_dir ]];
        then
            run_backup
            echo "Back up for $(date) was successful"
        else
            #Create backup folder
            echo "Making backup folder"
            mkdir $backup_dir

            run_backup
            echo "Back up for $(date) was successful"
        fi
    else
        echo "Config file is empty"
    fi
else
    echo "Config file does not exist"
fi







