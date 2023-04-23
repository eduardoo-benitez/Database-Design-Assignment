DROP DATABASE IF EXISTS db_design;

CREATE DATABASE IF NOT EXISTS db_design;

USE db_design;

CREATE TABLE IF NOT EXISTS artists (
	artist_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    DOB VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS songs (
    song_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	title VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    explicit BOOL NOT NULL,
    link VARCHAR(255) NOT NULL,
    
    artist_id INT NOT NULL, FOREIGN KEY(artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE IF NOT EXISTS genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	genreName VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,

	email VARCHAR(255) NOT NULL UNIQUE,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    pass VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS songgenres (
	song_id INT NOT NULL, 
    genre_id INT NOT NULL, 
    
    PRIMARY KEY (song_id, genre_id),
	FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)   
);

CREATE TABLE IF NOT EXISTS favoritesongs (
	song_id INT NOT NULL,
    user_id INT NOT NULL, 
    
    PRIMARY KEY(song_id, user_id),
	FOREIGN KEY (song_id) REFERENCES songs(song_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS playlists (
	playlist_id INT AUTO_INCREMENT NOT NULL, PRIMARY KEY(playlist_id),
    user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS playlistsongs (
	playlist_id INT NOT NULL, 
    song_id INT NOT NULL, 
    songrank INT NOT NULL,
    
    PRIMARY KEY(playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);