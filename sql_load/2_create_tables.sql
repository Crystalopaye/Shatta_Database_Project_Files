/* DATABASE: Shatta Wale Music Database
- PURPOSE: Track songs, projects, and platform metrics
- CREATED: 2026
*/

/*
- TABLE: project_dim
- PURPOSE: Stores information about projects/albums/EPs
- RELATIONSHIP: One project can have many songs
*/

CREATE TABLE public.project_dim (
    project_id INT PRIMARY KEY,           -- Unique project identifier
    title VARCHAR(255),                    -- Project name (Album/EP/Mixtape)
    date_of_release DATE,                   -- When project was released
    type_of_project VARCHAR(100)            -- Type: Album, EP, Mixtape, etc.
);

/*
-- TABLE: songs_list_fact
-- PURPOSE: Master list of all songs
-- RELATIONSHIP: Many songs belong to one project
-- NOTE: project_id can be NULL for singles
*/

CREATE TABLE public.songs_list_fact (
    song_id INT PRIMARY KEY,                -- Unique song identifier
    project_id INT,                         -- Links to project_dim (NULL for singles)
    title VARCHAR(255) NOT NULL,             -- Song title
    audio BOOLEAN DEFAULT FALSE,              -- Has audio version
    video BOOLEAN DEFAULT FALSE,              -- Has video version
    release_date DATE,                        -- When song was released
    feature VARCHAR(255),                     -- Featured artist(s)
    featured_by VARCHAR(255),                 -- Who featured on the song
    producers TEXT,                            -- Producer(s) of the song
    genre VARCHAR(100),                        -- Music genre
    duration TIME,                             -- Song length
    youtube BOOLEAN DEFAULT FALSE,             -- Available on YouTube
    verified_date DATE,                        -- When data was verified
    verified_by VARCHAR(100),                  -- Who verified the data
    confidence_level VARCHAR(50),              -- Data confidence level
    notes TEXT,                                -- Additional notes
    
    -- Foreign Key Relationship
    FOREIGN KEY (project_id) REFERENCES public.project_dim (project_id)
        ON DELETE SET NULL  -- If project deleted, songs remain but unlinked
);

/*
-- TABLE: platform_dim
-- PURPOSE: Tracks platform-specific metrics for each song
-- RELATIONSHIP: One song has one row in this table
*/

CREATE TABLE public.platform_dim (
    song_id INT PRIMARY KEY,                 -- Links to songs_list_fact
    spotify_url TEXT,                         -- Spotify link
    spotify_views INT DEFAULT 0,               -- Spotify plays
    applemusic_url TEXT,                       -- Apple Music link
    applemusic_views INT DEFAULT 0,             -- Apple Music plays
    youtube_url TEXT,                           -- YouTube link
    youtube_views_audio INT DEFAULT 0,          -- YouTube audio version views
    youtube_views_video INT DEFAULT 0,          -- YouTube video version views
    audiomack_url TEXT,                         -- Audiomack link
    audiomack_views INT DEFAULT 0,               -- Audiomack plays
    other_urls TEXT,                             -- Other platform links
    deezer_url TEXT,                             -- Deezer link
    deezer_views INT DEFAULT 0,                   -- Deezer plays
    soundcloud_url TEXT,                          -- SoundCloud link
    soundcloud_views INT DEFAULT 0,                -- SoundCloud plays
    amazon_music_url TEXT,                        -- Amazon Music link
    amazon_music_views INT DEFAULT 0,              -- Amazon Music plays
    
    -- Foreign Key Relationship
    FOREIGN KEY (song_id) REFERENCES public.songs_list_fact (song_id)
        ON DELETE CASCADE  -- If song deleted, its platform data is also deleted
);


-- Set table ownership
ALTER TABLE public.project_dim OWNER TO postgres;
ALTER TABLE public.songs_list_fact OWNER TO postgres;
ALTER TABLE public.platform_dim OWNER TO postgres;

-- Create indexes for better query performance
CREATE INDEX idx_songs_project_id ON public.songs_list_fact(project_id);
CREATE INDEX idx_songs_release_date ON public.songs_list_fact(release_date);
CREATE INDEX idx_songs_title ON public.songs_list_fact(title);
CREATE INDEX idx_platform_views ON public.platform_dim(youtube_views_video DESC);