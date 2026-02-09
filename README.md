# Introduction
---
**The Shatta Database** is a structured data collection project tracking the music releases of Ghanaian dancehall artist Shatta Wale. It organizes song metadata, project information, and platform tracking data into a relational database format for analysis and cataloging purposes. This project serves as the foundational prototype for a broader, more ambitious initiative: to build a real-time, comprehensive database that tracks every song Shatta Wale has released since becoming a professional artist. The current dataset focuses on a recent, high-activity period, establishing the schema and validation processes needed for scaling.

**Future Vision** : This prototype will evolve into an automated system. A Python API will be developed to scrape data from online sources (like YouTube, streaming platforms, and music news sites) and feed it directly into the database. This live data pipeline will then power a Power BI dashboard designed to monitor trends, analyze the trajectory of the artist's musical catalogue, and provide insights into release patterns, collaborations, and audience engagement over his entire career.

SQL queries? Check them out here: [sql_load_files](/sql_load/)


# Background
---
This project was created to systematically catalog Shatta Wale's recent musical output (late 2025 - early 2026), which includes diss tracks targeting Stonebwoy, two major projects (an EP and a mixtape), and standalone singles. The database helps fans and researchers track release patterns, collaborations, and verify song authenticity.


# Tools I Used
---
I built and managed the Shatta Database using a practical, modern tech stack:

- **CSV & Spreadsheet Software (Excel/Google Sheets)** : Structured the initial dataset, cleaned metadata, and performed first-pass analysis to define the core schema and relationships between songs, projects, and platforms.

- **Relational Database Design Principles** : Applied normalization techniques to organize data across three interconnected tables (songs_masters_list, project, platform_tracking), ensuring data integrity and enabling efficient querying.

- **Visual Studio Code** : Used as the primary development environment to manage CSV files, document the project structure, and prepare scripts for future automation and API development.

- **Git & GitHub** : Version-controlled all project files, tracked changes to the dataset and documentation, and hosted the repository for collaboration, portfolio presentation, and future expansion.


# The Analysis
---
The database consists of three interconnected tables:

### 1. songs_masters_list.csv (28 songs)

- Core song metadata including titles, release dates, producers, and genres

- Tracks organized into projects or as standalone releases

- Verification system with confidence levels and verifier names

- Special notes documenting diss tracks and release contexts

This query shows the song_masters_list table
```sql
SELECT
song_id,
title,
release_date,
producers,
duration

FROM songs_masters_list;
```
![image of song list data](/images\1_image.PNG)


*image showing the song list with the corresponding meta data*

### 2. project.csv (2 projects)

- **"Echoes of the Ghetto" (EP)** - Released 2026-01-13

- **"A Taste of the African King" (Mixtape)** - Released 2026-01-26

This query shows the project table
```sql
SELECT *
FROM project;
```
![image of project list](images\2_image.PNG)


*image showing the project list*


### 3.  platform_tracking.csv

- YouTube-focused distribution tracking

- Links to official song videos

- Platform infrastructure ready for expansion to Spotify, Apple Music, etc.

**Key Insights**:

- 28 songs tracked from December 2025 to February 2026

- Productive period with multiple diss tracks against Stonebwoy

- Two major projects released within two weeks of each other

- YouTube is the primary distribution platform

- Consistent verification process with high confidence levels

This query shows the platform_tracking table
```sql
SELECT 
tracking_id,
song_id,
youtube_url

FROM platform_tracking;
```
![image of tracking list](images\3_image.PNG)


*image showing the tracking list table*


# What I Learned
---
- **Data normalization** : How to structure related data across multiple tables

- **Music industry tracking** : The importance of metadata in cataloging releases

- **Verification systems** : Implementing confidence levels and audit trails

- **Platform distribution** : YouTube's dominance in African music distribution

- **Project organization** : How artists bundle songs into EPs vs. mixtapes

- **Temporal analysis** : Tracking release patterns and productivity cycles


# Conclusion
---
**The Shatta Database** successfully captures a snapshot of Shatta Wale's prolific output during a musically active period. The structured approach allows for easy querying, trend analysis, and expansion as new songs are released. This database serves as a foundation for deeper music analytics, fan engagement tools, or research into contemporary Ghanaian dancehall music production patterns. The modular design allows for future expansion to include streaming metrics, lyrical analysis, or social media impact tracking.

