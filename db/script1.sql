-- crear usuario
CREATE USER ardilluda_admin with PASSWORD 'rootroot';
ALTER USER ardilluda_admin WITH SUPERUSER;

-- crear base de datos
DROP DATABASE IF EXISTS ardilludadb;
CREATE DATABASE ardilludadb;
GRANT ALL PRIVILEGES ON DATABASE ardilludadb TO ardilluda_admin;