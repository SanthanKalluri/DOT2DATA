#!/bin/bash

#Setup the Paremeters that are not going to change

export DBHOST=tapimize57.c7tjyqjoeuyp.us-east-1.rds.amazonaws.com
export PORT=3306
export DBNAME=$DBNAME
export DBUSER=IMPL_USER
export DBPSWD=N0rMandY@5400

# Write to Output File to provide Details to Requestor

echo "Host :" $DBHOST >> DB_INPUT.txt
echo "Port :" $PORT >> DB_INPUT.txt

#Input from the User to create new company & DB

read -s -p "Please specify the db name: Sample Naming Format AUTODDB : " DBNAME
echo "DB Name Provided :" $DBNAME >> DB_INPUT.txt

if test "$DBNAME" = ""; then
        echo "$0: sorry, Database Name cannot be blank" >&2
        exit 1;
fi

if test $? -eq 0; then
        echo 'DB Name Entered' >&2
else
        echo 'DB Name Not Provided' >&2
        exit 1
fi


read -s -p "Please specify the Version: Sample Version format 7.0.0 : " VER
echo "The Version  installed is :" $VER >> DB_INPUT.txt

if test "$VER" = ""; then
        echo "$0: sorry, Version cannot be blank" >&2
        exit 1;
fi

if test $? -eq 0; then
        echo 'Version Entered' >&2
else
        echo 'Version Not Provided' >&2
        exit 1
fi


read -s -p "Please specify the Company: Sample Company format AUT : " COMP
echo "The Company Name is :" $COMP >> DB_INPUT.txt

if test "$COMP" = ""; then
        echo "$0: sorry, Company cannot be blank" >&2
        exit 1;
fi

if test $? -eq 0; then
        echo 'Company Entered' >&2
else
        echo 'Company Not Provided' >&2
        exit 1
fi

export PRSWD=/root/automate_scripts/dbutil
mkdir -p $PRSWD/db_releases/$VER
chmod 0775 $PRSWD/db_releases/$VER
export LCL_PTH=$PRSWD/db_releases/$VER
export GIT_CRDN=https://MaheshKalluriMize:Mah_5576@github.com/m-ize/DBAssets
cd $LCL_PTH
git clone -b $VER.RELEASE $GIT_CRDN $LCL_PTH/
chmod 0775 $LCL_PATH/

#Making Changes to db.properties file

cd $PRSWD
rm -rf db.properties

cp db_base.properties db.properties

sed -i "s/database_name/$DBNAME/" db.properties

export MDL=$LCL_PTH/DBScript/mysql/MasterDDLScript.txt
export ILC=$LCL_PTH/InitLoad/initload.conf
export ILL=$LCL_PTH/InitLoad/Mize/
export CLC=$LCL_PTH/InitLoad/companyload.conf
export CLL=$LCL_PTH/InitLoad/Company/

sed -i -e"s/^dbname=.*/dbname=$DBNAME/" db.properties
sed -i -e"s/^companies=.*/companies=$COMP/" db.properties

echo "masterddl="$MDL >> db.properties

echo "initloadconf="$ILC >> db.properties

echo "initloadlocation="$ILL >> db.properties

echo "companyloadconf="$CLC >> db.properties

echo "companyloadlocation="$CLL >> db.properties

sleep 1m
java -Ddboperation=LoadCompanyData -jar dbutil-0.0.1.jar

mysql -u$DBUSER -p$DBPSWD -h$DBHOST -Bse " use $DBNAME;
insert into companies_lst_ver (name_company,code, vers_instld) values ('$COMP','$COMP','$VER');"

rm -rf db_releases
cp db.properties db_$DBNAME.properties
echo "done" >&2

