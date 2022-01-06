select * from user_tables;

CREATE SEQUENCE USERSEQ NOCACHE;
CREATE SEQUENCE JOONGGOSEQ NOCACHE;
CREATE SEQUENCE HITSEQ NOCACHE;
CREATE SEQUENCE RENEWSEQ NOCACHE;

CREATE TABLE MYMEMBER(
    MYNO NUMBER NOT NULL,
    MYID VARCHAR2(500) NOT NULL,
    MYPW VARCHAR2(500) NOT NULL,
    MYNAME VARCHAR2(1000) NOT NULL,
    MYADDR VARCHAR2(4000) NOT NULL,
    MYPHONE VARCHAR2(20) NOT NULL,
    MYEMAIL VARCHAR2(100) NOT NULL,
    MYBIRTH DATE NOT NULL,
    MYSEX VARCHAR2(10) NOT NULL,
    MYENABLED VARCHAR2(2) NOT NULL,
    MYROLE VARCHAR2(50) NOT NULL,
    MYPENALTY NUMBER DEFAULT 0 NOT NULL
    CONSTRAINT MYMEMBER_PK PRIMARY KEY(MYNO),
    CONSTRAINT MYMEMBER_UQ_ID UNIQUE(MYID),
    CONSTRAINT MYMEMBER_UQ_PHONE UNIQUE(MYPHONE),
    CONSTRAINT MYMEMBER_UQ_EMAIL UNIQUE(MYEMAIL),
    CONSTRAINT MYMEMBER_SEX_CHK CHECK( MYSEX IN('남성','여성')),
    CONSTRAINT MYMEMBER_ENABLED_CHK CHECK( MYENABLED IN('Y','N'))
);

--1)
CREATE TABLE JOONGGO(
	SEQ NUMBER PRIMARY KEY,
	ID VARCHAR2(50) NOT NULL,
	REGDATE DATE NOT NULL,
	TITLE VARCHAR2(500) NOT NULL,
	CONTENT CLOB NOT NULL,
	CATEGORY VARCHAR2(100) NOT NULL,
	PRICE NUMBER NOT NULL,
	PLACE VARCHAR2(100) NULL,
	TAG VARCHAR2(100) NOT NULL,
	QUALITY VARCHAR2(20) NOT NULL,
	DELIVERY VARCHAR2(20) NOT NULL,
	AGREE VARCHAR2(20) NOT NULL,
	TRADE VARCHAR2(20) DEFAULT 'Y' NOT NULL,
	HIT NUMBER DEFAULT 0 NOT NULL,
	HEART NUMBER DEFAULT 0 NOT NULL,
	IMGLIST VARCHAR2(2000) NOT NULL,
	CONSTRAINT FK_ID_JOONGGO FOREIGN KEY(ID) REFERENCES MYMEMBER(MYID) ON DELETE CASCADE,
	CONSTRAINT CK_QUALITY_JOONGGO CHECK (QUALITY IN('A','B','C')),
	CONSTRAINT CK_DELIVERY_JOONGGO CHECK (DELIVERY IN('A','D','C')),
	CONSTRAINT CK_AGREE_JOONGGO CHECK (AGREE IN('Y','N')),
	CONSTRAINT CK_TRADE_JOONGGO CHECK (TRADE IN('Y','N','T'))
);

--2)
CREATE TABLE HITDATA(
	HITSEQ NUMBER PRIMARY KEY,
	HITDATE DATE NOT NULL,
	JOONGGOSEQ NUMBER NOT NULL,
	CONSTRAINT FK_SEQ_HITDATA FOREIGN KEY(JOONGGOSEQ) REFERENCES JOONGGO(SEQ) ON DELETE CASCADE
);

--3) view
CREATE OR REPLACE VIEW HITDATA_VIEW
AS
SELECT K.COUNT, L.* 
FROM (
	SELECT J.JOONGGOSEQ SEQ, COUNT(J.JOONGGOSEQ) COUNT  
	FROM (
		SELECT *
		FROM HITDATA
		WHERE HITDATE >= SYSDATE-7
		) J
	GROUP BY J.JOONGGOSEQ
	) K, JOONGGO L
WHERE 
K.SEQ = L.SEQ
AND L.TRADE = 'Y'
AND L.DELIVERY != 'C'
ORDER BY COUNT DESC

--4) renewal table
CREATE TABLE RENEWAL(
	RENEWSEQ NUMBER PRIMARY KEY,
	RENEWDATE DATE NOT NULL,
	JOONGGOSEQ NUMBER NOT NULL,
	CONSTRAINT FK_SEQ_RENEW FOREIGN KEY(JOONGGOSEQ) REFERENCES JOONGGO(SEQ) ON DELETE CASCADE
)


--5) 찜테이블
CREATE TABLE JOONGGO_HEART(
	HEARTDATE DATE NOT NULL,
	HEARTID VARCHAR2(50) NOT NULL,
	JOONGGOSEQ NUMBER NOT NULL,
	CONSTRAINT FK_SEQ_HEART FOREIGN KEY(JOONGGOSEQ) REFERENCES JOONGGO(SEQ) ON DELETE CASCADE,
	CONSTRAINT FK_ID_HEART FOREIGN KEY(HEARTID) REFERENCES MYMEMBER(MYID) ON DELETE CASCADE,
	CONSTRAINT PK_HEART PRIMARY KEY(HEARTID, JOONGGOSEQ)
)



DROP TABLE T_USER;
DROP TABLE JOONGGO;
DROP TABLE HITDATA
DROP TABLE JOONGGO_HEART;
DROP TABLE RENEWAL
SELECT * FROM JOONGGO_HEART
DELETE FROM JOONGGO_HEART
DELETE FROM JOONGGO;







INSERT INTO T_USER
VALUES(USERSEQ.NEXTVAL, '호갱', '1234', 'general', '12345@naver.com', '010-9922-5401', 0);
INSERT INTO T_USER
VALUES(USERSEQ.NEXTVAL, '가나다', '1234', 'general', 'abcd@naver.com', '010-1234-5401', 0);
SELECT * FROM T_USER;
SELECT * FROM JOONGGO WHERE CATEGORY = '캠핑 > 텐트/타프/매트' OR CATEGORY = '캠핑 > 캠핑카/카라반/트레일러' OR CATEGORY = '캠핑 > 기타 캠핑용품' ORDER BY SEQ;

SELECT *
FROM JOONGGO
WHERE TITLE LIKE '%캠핑용 식기%'
UNION ALL
SELECT *
FROM JOONGGO
WHERE TITLE LIKE '%캠핑용%'

INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');
INSERT INTO JOONGGO(SEQ, ID, REGDATE, TITLE, CONTENT, CATEGORY, PRICE, PLACE, TAG, QUALITY, DELIVERY, AGREE, IMGLIST)
VALUES(JOONGGOSEQ.NEXTVAL, '호갱', SYSDATE, '캠핑용의자랑 기타 물품 팔아요', '팔아용~', '캠핑 > 텐트/타프/매트', 37000, '잠실동,목동', '의자','B','D','Y','https://img.wizwid.com/PImg/706861/bsc/706861593.jpg');

SELECT *
FROM (SELECT ROWNUM AS NUM, J.* FROM (
	  SELECT * FROM JOONGGO 
	  WHERE CATEGORY = '캠핑 > 텐트/타프/매트'  
	  
	  ORDER BY SEQ DESC) J)
WHERE NUM between 7 AND 10;

SELECT J.*
FROM JOONGGO J
WHERE CATEGORY = '캠핑 > 텐트/타프/매트' 
AND ROWNUM BETWEEN 1 AND 10
ORDER BY SEQ DESC;

SELECT J.*, U.EMAIL, U.PHONE
FROM JOONGGO J, T_USER U
WHERE J.ID = U.USERID
AND J.SEQ = 1;
































