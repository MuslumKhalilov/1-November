create database Task

use Task

create table Users(
[Id] int primary key identity,
[Name] varchar (50),
[Surname] varchar (50),
[Username] varchar (50),
[Password] varchar (50),
[Gender] varchar (50)
)

create table Artists(
[Id] int primary key identity,
[Name] varchar (50),
[Surname] varchar (50),
[Birthday] date,
[Gender] varchar (50)
)

create table Categories(
[Id] int primary key identity,
[Name] varchar (50)
)

create table Musics(
[Id] int primary key identity,
[Name] varchar (50),
[Duration] int,
[ArtistId] int references Artists(Id),
[CategoryId] int references Categories(Id)
)
 create table Playlist(
 [Id] int primary key identity,
 [UserId] int references Users(Id),
 [MusicId] int references Musics(Id)
 )

 create view GetMusicInfo as 
 select m.Name as [Music Name], m.Duration as [Music Duration], c.Name as [Category Name],a.Name as [Artist Name] from Musics as m 
 join Categories as c
 on c.Id=m.CategoryId
 join Artists as a
 on a.Id=m.ArtistId