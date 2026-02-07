-- Test query
SELECT
songs_masters_list.song_id,
songs_masters_list.title,
songs_masters_list.release_date,
songs_masters_list.duration,
songs_masters_list.genre,
platform_tracking.youtube_url

FROM songs_masters_list

LEFT JOIN platform_tracking ON songs_masters_list.song_id = platform_tracking.song_id
