#!/bin/bash

SHP_DIR=/e/GIS/maps/china.shp
SRID=4269
DB=MyDB
TABLE=

echo ===========================
echo postgis SQL file generation
echo ===========================

PQSQL_PATH="/c/Program Files/PostgreSQL/9.2/bin"

#export PATH=${PQSQL_PATH}:${PATH}

EXE="/c/Program Files/PostgreSQL/9.2/bin/shp2pgsql"

cd "${SHP_DIR}"

SHP_FILES=$(find -name "*.shp")
cnt=0
for file in ${SHP_FILES}
do
bn=`basename ${file}`
pf="${bn%.*}"
sql="${DB}-${pf}.sql"
echo
echo === Convert \"${pf}\" to SQL file: \"${sql}\".
shp2pgsql -s ${SRID} ${file} ${pf} > ${sql}
echo === Done with \"${pf}\"
echo
let cnt=${cnt}+1
done

echo All done.
echo ${cnt} file\(s\) processed.




