::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: MySQL TRMBDEMO Optimization
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

@title MySQL Optimization
@color 0a
@cls


:: MySQl DB user
set dbuser=mzccadmin

:: MySQl DB users password
set dbpass=Mize4321

:: MySQl host
set host=trimbleuatnewone.c7tjyqjoeuyp.us-east-1.rds.amazonaws.com



:: Loop through the folders and use the file names for the sql files, collects all databases automatically this way
:: Pass each name to mysqldump.exe and output an individual .sql file for each


  "C:\Program Files\MySQL\MySQL Workbench 6.3 CE\mysqlcheck.exe"  -0 TRMBDEMO --user=%dbuser% --password=%dbpass%  --host=%host%  


  @echo done
pause
exit
