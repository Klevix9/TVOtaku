-- Table: anime
ALTER TABLE anime
MODIFY COLUMN title VARCHAR(255),
MODIFY COLUMN studio VARCHAR(255),
MODIFY COLUMN synopsis TEXT,
MODIFY COLUMN animecol VARCHAR(255),
MODIFY COLUMN rating DECIMAL(4, 2),
MODIFY COLUMN air_date DATE;

-- Table: episode
ALTER TABLE episode
MODIFY COLUMN title VARCHAR(255),
MODIFY COLUMN synopsis TEXT,
MODIFY COLUMN air_date DATE,
MODIFY COLUMN duration TIME,
MODIFY COLUMN link VARCHAR(255),
MODIFY COLUMN anime_id_anime INT;

-- Table: genre (assuming genre column is already defined correctly)

-- Table: links
ALTER TABLE links
MODIFY COLUMN player_name VARCHAR(255),
MODIFY COLUMN embedded_url VARCHAR(255),
MODIFY COLUMN episode_id_episode INT;

-- Table: playlist
ALTER TABLE playlist
MODIFY COLUMN name VARCHAR(255),
MODIFY COLUMN description TEXT,
MODIFY COLUMN create_date DATE,
MODIFY COLUMN update_date DATE,
MODIFY COLUMN user_id_user INT;

-- Table: playlist_has_episodes (assuming foreign keys are already defined correctly)

-- Table: season
ALTER TABLE season
MODIFY COLUMN season VARCHAR(255),
MODIFY COLUMN anime_id_anime INT;

-- Table: staff
ALTER TABLE staff
MODIFY COLUMN username VARCHAR(255),
MODIFY COLUMN password VARCHAR(255),
MODIFY COLUMN status VARCHAR(255),
MODIFY COLUMN role VARCHAR(255);

-- Table: user
ALTER TABLE user
MODIFY COLUMN name VARCHAR(255),
MODIFY COLUMN surname VARCHAR(255),
MODIFY COLUMN username VARCHAR(255),
MODIFY COLUMN email VARCHAR(255),
MODIFY COLUMN password VARCHAR(255),
MODIFY COLUMN age INT,
MODIFY COLUMN type VARCHAR(255);