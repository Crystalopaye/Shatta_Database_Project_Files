-- 1. Create the tables
CREATE TABLE public.project (
    project_id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    date_of_release DATE,
    type_of_project VARCHAR(100)
);

CREATE TABLE public.songs_masters_list (
    song_id SERIAL PRIMARY KEY,
    project_id INT REFERENCES public.project(project_id) ON DELETE SET NULL,
    title VARCHAR(255) NOT NULL,
    audio BOOLEAN DEFAULT FALSE,
    video BOOLEAN DEFAULT FALSE,
    release_date DATE,
    feature VARCHAR(255),
    featured_by VARCHAR(255),
    producers TEXT,
    genre VARCHAR(100),
    duration TIME,
    platform VARCHAR(100),
    youtube BOOLEAN DEFAULT FALSE,
    verified_date DATE,
    verified_by VARCHAR(100),
    confidence_level VARCHAR(50),
    notes TEXT
);

CREATE TABLE public.platform_tracking (
    tracking_id SERIAL PRIMARY KEY,
    song_id INT NOT NULL REFERENCES public.songs_masters_list(song_id) ON DELETE CASCADE,
    spotify_url TEXT,
    applemusic_url TEXT,
    youtube_url TEXT,
    audiomack_url TEXT,
    other_urls TEXT,
    deezer TEXT,
    sound_cloud TEXT,
    amazon_music TEXT,
    UNIQUE(song_id)
);

-- 2. Set ownership
ALTER TABLE public.project OWNER TO postgres;
ALTER TABLE public.songs_masters_list OWNER TO postgres;
ALTER TABLE public.platform_tracking OWNER TO postgres;

-- 3. Create indexes
CREATE INDEX idx_songs_project_id ON public.songs_masters_list(project_id);
CREATE INDEX idx_songs_release_date ON public.songs_masters_list(release_date);
CREATE INDEX idx_songs_genre ON public.songs_masters_list(genre);
CREATE INDEX idx_platform_tracking_song_id ON public.platform_tracking(song_id);