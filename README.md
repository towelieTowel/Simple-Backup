# Simple-Backup

### About

Simple-Backup is what it sounds: a lightweight backup script, written in Bash, for the simple user. Simple-Backup creates two requirements.txt files, one for both global and local site python3 packages that are currently installed on the system. The script then zips up a list of directories and files, sourced from the .backuprc configuration file, as well as those generated requirements.txt files. The zipped archive is stored locally in $HOME/.backups. 

### Install
```git clone https://github.com/towelieTowel/simple-backup.git```

or

download the zip file and unzip 

### Configure
Simple-Backup expects the configuration file to be in $HOME. If the file is doesn't exist or cannot be accessed the Simple-Backup will not be able to run, as it sources this file. $HOME is the default path to search for .backuprc. This can be easily modified in the backup.sh script via ```config="${HOME}/.backuprc"```, located at the top of the script. 

##### Adding paths
To add files to be backed up, simply add either the absolute path to the ```abs_paths``` list or add the relative path to the ```home_paths``` list. The prefix for the ```home_paths``` can be modified by setting the ```home_prefix``` variable to the desired path. 

##### Setting backup location
Simple-Backup will store the backup zip archive file to the location set in the ```backup_dir``` variable of the configuration file. The default backup location is ```backup_dir="$home_prefix/.backups"```.

##### Formatting backup archive file name
Simple-Backup uses the format string set in the ```format``` variable of the configuration file to format the date used to build the file name of the generated zip archive file. The default value is currently ```format='%m_%d_%Y'```. This will build a filename like: backup_02_01_2023.zip.

### Run

```chmod +x backup.sh``` 
```./backup.sh```

### Issues
Simple-Backup will not run if either 1. The configuration file is empty or 2. The configuration file is not in the expected path. To triage these issues, first verify that the .backuprc file is located in the path set in the ```config``` variable at the top of the backup.sh file: ```config="${HOME}/.backuprc"```. If the file does exist, make sure that it is not empty. If you have done both and are still having issues, please open an issue ticket in this repository. 

