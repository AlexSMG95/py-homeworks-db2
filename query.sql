-- Таблица исполнителей
CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Таблица жанров
CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Промежуточная таблица для связи исполнителей и жанров
CREATE TABLE artist_genres (
    artist_id INT REFERENCES artists(artist_id),
    genre_id INT REFERENCES genres(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

-- Таблица альбомов
CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INT NOT NULL
);

-- Промежуточная таблица для связи альбомов и исполнителей
CREATE TABLE album_artists (
    album_id INT REFERENCES albums(album_id),
    artist_id INT REFERENCES artists(artist_id),
    PRIMARY KEY (album_id, artist_id)
);

-- Таблица треков
CREATE TABLE tracks (
    track_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    duration INTERVAL NOT NULL,
    album_id INT REFERENCES albums(album_id)
);

-- Таблица сборников
CREATE TABLE compilations (
    compilation_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INT NOT NULL
);

-- Промежуточная таблица для связи сборников и треков
CREATE TABLE compilation_tracks (
    compilation_id INT REFERENCES compilations(compilation_id),
    track_id INT REFERENCES tracks(track_id),
    PRIMARY KEY (compilation_id, track_id)
);