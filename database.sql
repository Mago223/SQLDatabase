
-- User, Post, and Application(junction) tables
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    display_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    passcode VARCHAR(60) NOT NULL,
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    post_title VARCHAR(255) NOT NULL,
    post_body TEXT NOT NULL,
    user_id INT NOT NULL REFERENCES users(id),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE applications (
    CONSTRAINT application_id PRIMARY KEY (user_id, post_id),
    post_id INT NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    application_status VARCHAR(50),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- User_image table

CREATE TABLE user_images (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    image_data BYTEA
);

-- Skill, User_skill, and Post_skill table 

CREATE TABLE skills (
    id SERIAL PRIMARY KEY,
    skill_name vARCHAR(100)
);

CREATE TABLE user_skills (
    CONSTRAINT userskill_id PRIMARY KEY (user_id, skill_id),
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    skill_id INT NOT NULL REFERENCES skills(id)
);

CREATE TABLE post_skills (
    CONSTRAINT postskill_id PRIMARY KEY (post_id, skill_id),
    post_id INT NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    skill_id INT NOT NULL REFERENCES skills(id) ON DELETE CASCADE
);

-- User links

CREATE TABLE user_links (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    link VARCHAR(255) NOT NULL
);
