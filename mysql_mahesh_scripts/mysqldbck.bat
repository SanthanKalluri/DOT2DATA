::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: MySQL Backup
:: Written by Mahesh Kalluri Dated 11/26/2015
:: Version1.0 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

@title MySQL Backup
@color 0a
@cls

@cls
@echo Date


:: MySQl DB user
set dbuser=mizetestdbadmin

:: MySQl DB users password
set dbpass=Mize4321

:: MySQl host
set host=tapimizedatabase.c7tjyqjoeuyp.us-east-1.rds.amazonaws.com

:: MySQl Dump File Location
set mysqldumpxe="C:\Program Files\MySQL\MySQL Workbench 6.3 CE\mysqldump.exe"

:: Error log path – Important to check for errors
set errorLogPath="E:\bckerrlog\dumperrors.txt"

:: Backup path 
 set backupfldr="E:\MIZEPDB"

:: Path to zip executable 
set zipper=”C:\Program Files\7-Zip\7z.exe” 

:: Number of days to retain
set retaindays=15

@echo " MySql Backup has been Starting......."

:: Loop through the folders and use the file names for the sql files, collects all databases automatically this way
:: Pass each name to mysqldump.exe and output an individual .sql file for each

%mysqldumpxe% --user=%dbuser% --password=%dbpass%  --host=%host% MIZEPDB -routines -log-error=%errorLogPath%  > “E:\MIZEPDB\MizePDB.sql” 

  @echo "Done With the Backup of MySql Database"
  
pause
exit
