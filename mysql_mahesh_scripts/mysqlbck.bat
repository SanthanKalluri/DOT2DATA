::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: MySQL Backup
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

@title MySQL Backup
@color 0a
@cls


:: MySQl DB user
set dbuser=mizetestdbadmin

:: MySQl DB users password
set dbpass=Mize4321

:: MySQl host
set host=tapimizedatabase.c7tjyqjoeuyp.us-east-1.rds.amazonaws.com



:: Loop through the folders and use the file names for the sql files, collects all databases automatically this way
:: Pass each name to mysqldump.exe and output an individual .sql file for each


  "C:\Program Files\MySQL\MySQL Workbench 6.3 CE\mysqldump.exe" --user=%dbuser% --password=%dbpass%  --host=%host%  TestDBSCRIPTS   > "E:\MIZEPDB\TestDBSCRIPTS.sql"


  @echo done
pause
exit
