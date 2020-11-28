#ctrl + b - uladnianie kodu pedzel
#ctrl enter - jedna linia
# ctrl shift emter zazmaczony tekst
use sales;
CREATE TABLE IF NOT EXISTS test (
    numbers		 INT(10),
    words 		 VARCHAR(10)
);

/*
dlugi komentarz
*/

SELECT 
    *
FROM
    test;

drop table test;