#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 -d template1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE USER sonar ENCRYPTED PASSWORD 'sonar';
  CREATE DATABASE sonar WITH OWNER sonar ENCODING 'UTF8';
EOSQL
