CREATE USER mailreader;
REVOKE CREATE ON SCHEMA public FROM PUBLIC;
REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT CREATE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO postgres;
CREATE DATABASE IF NOT EXISTS mail WITH OWNER mailreader;
\connect mail
CREATE TABLE IF NOT EXISTS aliases (
    alias text NOT NULL,
    email text NOT NULL
);
CREATE TABLE IF NOT EXISTS users (
    email text NOT NULL,
    password text NOT NULL,
    maildir text NOT NULL,
    created timestamp with time zone DEFAULT now()
);
ALTER TABLE aliases OWNER TO mailreader;
ALTER TABLE users OWNER TO mailreader;
