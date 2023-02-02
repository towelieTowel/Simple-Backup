# simple-backup

### About

Simple-Backup is what it sounds: a lightweight backup script, written in Bash, for the simple user. Simple-Backup creates two requirements.txt files, one for both global and local site python3 packages that are currently installed on the system. The script then zips up a list of directories and files, sourced from the .backuprc configuration file, as well as those generated requirements.txt files. The zipped archive is stored locally in $HOME/.backups. 

### Install
git clone https://github.com/towelieTowel/simple-backup.git

or

download zip and unzip 

### Configure
Simple-Backup expects the configuration file to be in $HOME. If the file is doesn't exist or cannot be accessed the Simple-Backup will not be able to run, as it sources this file. $HOME is the default path to search for .backuprc. This can be easily modified in the backup.sh script via [config="${HOME}/.backuprc"], located at the top of the script. 

### Run
./backup.sh
