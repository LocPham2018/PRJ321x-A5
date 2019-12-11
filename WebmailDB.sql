create database webmail;

create table webmail.accounts
(
	username varchar(20) not null primary key,
    password varchar(20) not null
);
