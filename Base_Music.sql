create table if not exists Song (
Song_ID serial primary key,
name VARCHAR(60) not null,
duration int not null,
album_id int references Album(Album_ID)
);

create table if not exists Album (
Album_ID serial primary key,
title VARCHAR(60) not null,
year int not null
);

create table if not exists Collection (
Collection_ID serial primary key,
name VARCHAR(60) not null,
year_of_release int not null
);

create table if not exists Songs_collection (
collection_id INTEGER references Collection(Collection_ID),
songs_id INTEGER references Song(Song_ID),
constraint pk primary key (collection_id, songs_id)
);

create table if not exists Artist (
Artist_ID serial primary key,
name VARCHAR(60) not null
);

create table if not exists Album_Artist (
album_id INTEGER references Album(Album_ID),
artist_id INTEGER references Artist(Artist_ID),
constraint nk primary key (album_id, artist_id)
);

create table if not exists Genre (
Genre_ID serial primary key,
title VARCHAR(60) not null
);

create table if not exists Genres_Artist (
Genre_ID INTEGER references Genre(Genre_ID),
Artist_ID INTEGER references Artist(Artist_ID),
constraint sk primary key (Genre_ID, Artist_ID)
);