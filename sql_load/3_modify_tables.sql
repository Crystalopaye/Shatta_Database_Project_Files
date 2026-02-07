-- First: Load project table
COPY public.project (project_id, title, date_of_release, type_of_project)
FROM 'C:\fiifi\Shatta_Wale_Database_Project\csv_files\project.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Second: Load songs_masters_list (note: project_id is nullable)
COPY public.songs_masters_list (
    song_id, project_id, title, audio, video, release_date,
    feature, featured_by, producers, genre, duration,
    platform, youtube, verified_date, verified_by, confidence_level, notes
)
FROM 'C:\fiifi\Shatta_Wale_Database_Project\csv_files\songs_masters_list.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8', NULL '');

-- Third: Load platform_tracking (specify columns to skip tracking_id)
COPY public.platform_tracking (
    song_id, 
    spotify_url, 
    applemusic_url, 
    youtube_url, 
    audiomack_url, 
    other_urls, 
    deezer, 
    sound_cloud, 
    amazon_music
)
FROM 'C:\fiifi\Shatta_Wale_Database_Project\csv_files\platform_tracking.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8', NULL '');