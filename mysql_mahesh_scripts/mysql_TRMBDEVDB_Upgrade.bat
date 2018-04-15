::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: MySQL TRMBDEVDB Upgrade
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

@title MySQL Collation Change
@color 0a
@cls


:: MySQl DB user
set dbuser=mzccadmin

:: MySQl DB users password
set dbpass=Mize4321

:: MySQl host
set host=mizetrimbledbserver.c7tjyqjoeuyp.us-east-1.rds.amazonaws.com



:: Loop through the folders and use the file names for the sql files, collects all databases automatically this way
:: Pass each name to mysqldump.exe and output an individual .sql file for each


  "C:\Program Files\MySQL\MySQL Workbench 6.3 CE\mysql.exe" --user=%dbuser% --password=%dbpass%  --host=%host%  TRMBDEVDB  < "D:\mysql_mahesh_scripts\4_3_0.sql" > "D:\mysql_mahesh_scripts\4_3_0.out"


  @echo done
pause
exit
