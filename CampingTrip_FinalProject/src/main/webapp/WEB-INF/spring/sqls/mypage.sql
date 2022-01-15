-- admin

-- 캠핑지 등록 리스트 테이블

DROP SEQUENCE CAMPLISTSEQ;
DROP TABLE CAMPLIST;

CREATE SEQUENCE CAMPLISTSEQ NOCACHE;

CREATE TABLE CAMPLIST (
	CAMPLISTNO NUMBER CONSTRAINT PK_CAMPLISTNO PRIMARY KEY,
	CAMPNAME VARCHAR2(200) NOT NULL,
	CONSTRAINT FK_NAME FOREIGN KEY (CAMPNAME) REFERENCES CAMP(NAME) ON DELETE CASCADE
);

SELECT * FROM CAMPLIST;

SELECT * FROM MYMEMBER;


select * from CAMP;
select * from ROOM;
select * from POINT;

SELECT CAMP.CAMPNO, NAME, ROOM_NAME
		FROM CAMP
		JOIN ROOM
		ON CAMP.CAMPNO = ROOM.CAMPNO;
		
SELECT CAMP.CAMPNO, ROOM.ROOMNO, ROOM_NAME, ROOM_PRICE, GUEST_NUMBER, ROOM_CONTENT
		FROM CAMP
		JOIN ROOM
		ON ROOM.CAMPNO = CAMP.CAMPNO;
		
		SELECT CAMP.NAME, CAMP.CAMPNO, ROOM.ROOMNO, ROOM_NAME, ROOM_PRICE, GUEST_NUMBER, ROOM_CONTENT
		FROM ROOM
		JOIN CAMP
		ON ROOMNO = 3 AND CAMP.CAMPNO = ROOM.CAMPNO;