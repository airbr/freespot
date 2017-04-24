#!/bin/bash
echo "This is the park4 build script. It will:
           1. Create a database called park4_development with Postgres
           2. Run rake db:migrate";
psql postgres -c "CREATE DATABASE park4_development";
rake db:migrate;
echo "All done...";

