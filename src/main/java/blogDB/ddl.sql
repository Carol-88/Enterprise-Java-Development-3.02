-- DDL para la tabla Authors
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(255) UNIQUE NOT NULL
);

-- DDL para la tabla Blogs
CREATE TABLE Blogs (
    blog_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    word_count INT,
    views INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);