#!/bin/sh
#
# Create documentation based on the SchemaSpy tool
# Ex: ./build_database_documentation.sh -h localhost -p 5432 -d adresse -u postgres -o ../docs
# LICENCE: GPL 2
# AUTHOR: 3LIZ

while getopts h:p:d:u:o: option
do
case "${option}"
in
h) DBHOST=${OPTARG};;
p) DBPORT=${OPTARG};;
d) DBNAME=${OPTARG};;
u) DBUSER=${OPTARG};;
o) OUTPUTDIR=${OPTARG};;
esac
done

# Remove existing directory
rm -rf $OUTPUTDIR

# Run SchemaSpy for current schema
java -jar schemaspy-6.1.0.jar -t pgsql-mat -dp postgresql-42.2.10.jar -host $DBHOST -port $DBPORT -db $DBNAME -u $DBUSER -pfp -s adresse -norows -o $OUTPUTDIR
