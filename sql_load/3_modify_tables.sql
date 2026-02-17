/*
1. Import project_dim
*/
COPY public.project_dim (project_id, title, date_of_release, type_of_project)
FROM 'C:/fiifi/Shatta_Wale_Database_Project/Shatta_Database_Project_Files/csv_files/project_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8', NULL '')
WHERE project_id IS NOT NULL;

/*
2. Import songs_list_fact
*/
SET datestyle = 'ISO, DMY';

COPY public.songs_list_fact (
    song_id, project_id, title, audio, video, release_date,
    feature, featured_by, producers, genre, duration,
    youtube, verified_date, verified_by, confidence_level, notes
)
FROM 'C:/fiifi/Shatta_Wale_Database_Project/Shatta_Database_Project_Files/csv_files/songs_list_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'WIN1252', NULL '');

SET datestyle = 'ISO, MDY';

/*
3. Import platform_dim
*/
COPY public.platform_dim (
    song_id, spotify_url, spotify_views, applemusic_url, applemusic_views,
    youtube_url, youtube_views_audio, youtube_views_video, audiomack_url, audiomack_views,
    other_urls, deezer_url, deezer_views, soundcloud_url, soundcloud_views,
    amazon_music_url, amazon_music_views
)
FROM 'C:/fiifi/Shatta_Wale_Database_Project/Shatta_Database_Project_Files/csv_files/platform_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8', NULL '');


