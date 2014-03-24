#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

cp "$DIR/companylist_amex.csv" /tmp
cp "$DIR/companylist_nasdaq.csv" /tmp
cp "$DIR/companylist_nyse.csv" /tmp

/usr/local/mysql/bin/mysql -uroot -p < "$DIR/insert_exchanges.sql"
