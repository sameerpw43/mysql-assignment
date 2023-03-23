
-- create
CREATE TABLE members (
  id INT NOT NULL AUTO_INCREMENT,
  created_at DATETIME NOT NULL,
  username VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- loop to insert random names and dates
INSERT INTO members (created_at, username)
VALUES 
  (DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'Pat Rick'),
  (DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'Pat Bob'),
  (DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'John Cena'),
  (DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'Jack Rose'),
  (DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'sameer khan'),
  (DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'amaan '),
   (DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'roman '),
    (DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'kane '),
	(DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'jones'),
	(DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'dean'),
	(DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 'jimmy')
	
  
  
;
INSERT INTO members (created_at, username)
SELECT 
  DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 
  CONCAT('Pat ', ELT(FLOOR(RAND()*2)+1, 'roman', 'khabib'))
FROM 
  (SELECT n FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) AS nums(n)) AS rnd
WHERE 
  (SELECT COUNT(*) FROM members) < 185
;
INSERT INTO members (created_at, username)
SELECT 
  DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 
  CONCAT('Pat ', ELT(FLOOR(RAND()*2)+1, 'Rick', 'Bob'))
FROM 
  (SELECT n FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) AS nums(n)) AS rnd
WHERE 
  (SELECT COUNT(*) FROM members) < 185
;

INSERT INTO members (created_at, username)
SELECT 
  DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 
  ELT(FLOOR(RAND()*2)+1, 'John Cena', 'Jack Rose')
FROM 
  (SELECT n FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) AS nums(n)) AS rnd
WHERE 
  (SELECT COUNT(*) FROM members) <185
;
INSERT INTO members (created_at, username)
SELECT 
  DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 
  CONCAT('Pat ', ELT(FLOOR(RAND()*2)+1, 'sameer khan', 'amaan'))
FROM 
  (SELECT n FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) AS nums(n)) AS rnd
WHERE 
  (SELECT COUNT(*) FROM members) < 185
;
INSERT INTO members (created_at, username)
SELECT 
  DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 
  ELT(FLOOR(RAND()*2)+1, 'kane', 'jones')
FROM 
  (SELECT n FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) AS nums(n)) AS rnd
WHERE 
  (SELECT COUNT(*) FROM members) <185
;
INSERT INTO members (created_at, username)
SELECT 
  DATE_ADD('2023-03-23 00:00:00', INTERVAL -FLOOR(RAND()*365) DAY), 
  ELT(FLOOR(RAND()*2)+1, 'kane', 'jones')
FROM 
  (SELECT n FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) AS nums(n)) AS rnd
WHERE 
  (SELECT COUNT(*) FROM members) <185
;

CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  created_at DATETIME NOT NULL,
  member_id INT NOT NULL,
  topic VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (member_id) REFERENCES members(id)
);


INSERT INTO posts (created_at, member_id, topic)
VALUES 
    (DATE_ADD(NOW(), INTERVAL -1 YEAR), 1, 'Cleaning'),
    (DATE_ADD(NOW(), INTERVAL -6 MONTH), 2, 'Decorating'),
    (DATE_ADD(NOW(), INTERVAL -3 MONTH), 3, 'Cleaning'),
    (DATE_ADD(NOW(), INTERVAL -1 MONTH), 4, 'Decorating'),
    (DATE_ADD(NOW(), INTERVAL -1 DAY), 5, 'Cleaning'),
    (DATE_ADD(NOW(), INTERVAL -2 DAY), 6, 'Decorating'),
    (DATE_ADD(NOW(), INTERVAL -3 DAY), 7, 'Cleaning'),
    (DATE_ADD(NOW(), INTERVAL -4 DAY), 8, 'Decorating'),
    (DATE_ADD(NOW(), INTERVAL -5 DAY), 9, 'Cleaning'),
    (DATE_ADD(NOW(), INTERVAL -6 DAY), 10, 'Decorating'),
    (DATE_ADD(NOW(), INTERVAL -7 DAY), 11, 'Cleaning'),
    (DATE_ADD(NOW(), INTERVAL -2 WEEK), 12, 'Decorating'),
    (DATE_ADD(NOW(), INTERVAL -1 MONTH), 13, 'Cleaning'),
    (DATE_ADD(NOW(), INTERVAL -3 MONTH), 14, 'Decorating'),
    (DATE_ADD(NOW(), INTERVAL -5 MONTH), 15, 'Cleaning'),
    (DATE_ADD(NOW(), INTERVAL -1 YEAR), 16, 'Decorating');
  
   
   CREATE TABLE likes (
    id INT NOT NULL AUTO_INCREMENT,
    liked_at DATETIME NOT NULL,
    post_id INT NOT NULL,
    member_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (member_id) REFERENCES members(id)
);
INSERT INTO likes (liked_at, post_id, member_id)
VALUES 
    (DATE_ADD(NOW(), INTERVAL -1 YEAR), 1, 1),
    (DATE_ADD(NOW(), INTERVAL -6 MONTH), 2, 2),
    (DATE_ADD(NOW(), INTERVAL -3 MONTH), 3, 3),
    (DATE_ADD(NOW(), INTERVAL -1 MONTH), 4, 4),
    (DATE_ADD(NOW(), INTERVAL -1 DAY), 5, 5),
    (DATE_ADD(NOW(), INTERVAL -2 DAY), 6, 6),
    (DATE_ADD(NOW(), INTERVAL -3 DAY), 7, 7),
    (DATE_ADD(NOW(), INTERVAL -4 DAY), 8, 8),
    (DATE_ADD(NOW(), INTERVAL -5 DAY), 9, 9),
    (DATE_ADD(NOW(), INTERVAL -6 DAY), 10, 10),
    (DATE_ADD(NOW(), INTERVAL -2 YEAR), 11, 1),
    (DATE_ADD(NOW(), INTERVAL -1 YEAR), 12, 2),
    (DATE_ADD(NOW(), INTERVAL -6 MONTH), 13, 3),
    (DATE_ADD(NOW(), INTERVAL -3 MONTH), 14, 4),
    (DATE_ADD(NOW(), INTERVAL -1 MONTH), 15, 5),
    (DATE_ADD(NOW(), INTERVAL -1 DAY), 16, 6);
   
SELECT COUNT(*) AS num_posts
FROM posts
WHERE topic = 'Cleaning' AND created_at >= DATE_ADD(NOW(), INTERVAL -45 DAY);

SELECT COUNT(DISTINCT p.member_id) AS num_members
FROM posts p
INNER JOIN members m ON p.member_id = m.id
WHERE p.created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
AND m.created_at <= DATE_SUB(NOW(), INTERVAL 2 MONTH);

SELECT member_id
FROM posts
GROUP BY member_id
HAVING COUNT(DISTINCT topic) >= 2;

SELECT COUNT(*) FROM members LEFT JOIN posts ON members.id = posts.member_id WHERE posts.id IS NULL;

SELECT 
    COUNT(DISTINCT p.member_id) AS cleaning_posters,
    COUNT(DISTINCT l.member_id) AS cleaning_likers,
    ROUND(COUNT(DISTINCT l.member_id) / COUNT(DISTINCT p.member_id) * 100, 2) AS percentage
FROM 
    posts p
    JOIN likes l ON p.id = l.post_id
WHERE 
    p.topic = 'Cleaning' AND
    l.member_id IN (SELECT member_id FROM posts WHERE topic = 'Cleaning');


SELECT COUNT(*) FROM members WHERE username LIKE 'Pat%' OR username LIKE 'Pat %';

    


