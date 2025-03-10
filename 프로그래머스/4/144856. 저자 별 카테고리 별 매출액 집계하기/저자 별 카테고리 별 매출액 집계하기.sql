/*
1. SELECT AUTHOR_ID, AUTHOR_NAME,
          CATEGORY, 매출액(TOTAL_SALES = 판매량 * 판매가)
2. WHERE 2022년 1월 판매
3. GROUP BY 저자, 카테고리
4. ORDER BY 1, 3 DESC
*/

SELECT B.AUTHOR_ID,
       A.AUTHOR_NAME,
       B.CATEGORY,
       SUM(B.PRICE * BS.SALES) AS TOTAL_SALES
  FROM BOOK B
  JOIN AUTHOR A
    ON B.AUTHOR_ID = A.AUTHOR_ID
  JOIN BOOK_SALES BS
    ON B.BOOK_ID = BS.BOOK_ID
 WHERE DATE_FORMAT(BS.SALES_DATE, '%Y-%m') = '2022-01'
 GROUP BY B.AUTHOR_ID, B.CATEGORY
 ORDER BY 1, 3 DESC;