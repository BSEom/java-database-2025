
-- 1번.
SELECT email
	 , mobile
	 , names
	 , addr
  FROM membertbl;


-- 2번.
SELECT names AS 도서명
	 , author AS 저자
	 , isbn 
	 , price AS 정가
  FROM bookstbl
 ORDER BY isbn ASC;


-- 3번.
SELECT m.names AS 비대여자명
	 , m.levels AS 등급
	 , m.addr AS 주소
	 , r.rentaldate AS 대여일
  FROM membertbl m, rentaltbl r
 WHERE m.idx = r.memberidx(+)
   AND r.rentaldate IS NULL
 ORDER BY m.levels ASC;
 

-- 4번.
SELECT DISTINCT nvl(d.names, '합계') AS 장르
	 , ltrim(to_char(SUM(b.price), '9,999,999') || '원') AS 총합계금액
  FROM divtbl d, bookstbl b 
 WHERE d.division = b.division
 GROUP BY ROLLUP(d.names , b.division)
 ORDER BY 1 ASC;
 

COMMIT;