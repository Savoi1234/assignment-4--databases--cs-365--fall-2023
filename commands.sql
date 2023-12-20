SELECT CONCAT(artist.artist_name, ' recorded ', album.album_name) AS Recording
FROM artist
INNER JOIN album ON artist.artist_id = album.artist_id;
----
SELECT artist.artist_name, album.album_name
FROM artist
INNER JOIN album ON artist.artist_id = album.artist_id
WHERE artist.artist_id IN (
    SELECT artist_id
    FROM album
    WHERE album_name IN ('Dysnomia', 'Turn on the Bright Lights', 'Dead Cool', 'Houdini', 'Come on Die Young', 'Every Country’s Sun', 'Heads Up')
);
----
SELECT artist.artist_name, album.album_name
FROM artist
INNER JOIN album ON artist.artist_id = album.artist_id;
----
SELECT album.album_name, track.track_name
FROM album
INNER JOIN track ON album.album_id = track.album_id AND album.artist_id = track.artist_id
ORDER BY album.album_name, track.track_name;
----
SELECT track.track_name, track.time
FROM track
INNER JOIN played ON track.artist_id = played.artist_id 
AND track.album_id = played.album_id 
AND track.track_id = played.track_id;
