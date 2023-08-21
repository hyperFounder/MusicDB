create database "Music";
\c Music;

create table artist 
(
artistID int primary key,
name varchar(255) not null,
countryOfOrigin varchar(255)
);

create table genre 
(
name varchar (255) primary key,
description varchar (255)
);


create table album
(
albumID int primary key,
artistID int references artist(artistID) not null,
title varchar (255) not null,
label varchar (255),
year int,
genre varchar(255) references genre(name),
price decimal(6, 2) not null check(price > 0)
);

create table customer
(
custID int primary key,
fname varchar(255),
lName varchar(255) not null,
houseNum varchar(255) not null,
postCode varchar(255) not null,
creditcard int not null unique
);

create table sale
(
salesRef int primary key,
custID int references customer(custID) not null, 
albumID int references album (albumID) not null,
saleDate date not null
);

create table review
(
albumID int references album(albumID) not null,
custID int references customer(custID) not null,
rating int not null,
text varchar (1024),
primary key (albumID, custID)
);

create table label
(
name varchar(255),
region varchar(255),
country varchar(255) not null,
primary key (name, region)
);

create table composer 
(
composerID int primary key,
name varchar(255) not null
);


create table credit
(
composerID int references composer(composerID),
albumID int references album(albumID),
weighting int check (weighting >= 0 and weighting <= 100),
primary key(composerID, albumID)
);

create table favourite
(
custid int references customer(custid),
artistName varchar(255)
);

