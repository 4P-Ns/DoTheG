-- family 데이터 삽입
INSERT INTO family (family_name) VALUES ('Family A');

INSERT INTO family (family_name) VALUES ('Family B');

INSERT INTO family (family_name) VALUES ('Family C');

INSERT INTO family (family_name) VALUES ('Family D');

INSERT INTO family (family_name) VALUES ('Family E');

INSERT INTO family (family_name) VALUES ('Family F');

SELECT * FROM family;

-- teacher 데이터 삽입
INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('teacher1', 'pw1', '김마이클', 'Michael Kim', 'minsu.kim@example.com', 'teacher', '..\DoTheG\src\main\java\images\teacher01.png', 1);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('teacher2', 'pw2', '강미나', '강미나', 'jiyoung.park@example.com', 'teacher', '..\DoTheG\src\main\java\images\teacher02.png', 2);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('teacher3', 'pw3', '박파라', 'Farah', 'junho.lee@example.com', 'teacher', '..\DoTheG\src\main\java\images\teacher03.png', 3);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('teacher4', 'pw4', '정민지', '정민지', 'eunji.choi@example.com', 'teacher', '..\DoTheG\src\main\java\images\teacher04.png', 4);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('teacher5', 'pw5', '박이삭', 'Isaac Park', 'woosung.jung@example.com', 'teacher', '..\DoTheG\src\main\java\images\teacher05.png', 5);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('teacher6', 'pw66', '김영숙', '영숙', 'woosung.jung@example.com', 'teacher', '..\DoTheG\src\main\java\images\teacher06.png', 6);

-- student 데이터 삽입
INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student1', 'pw6', '김하나', '하나', 'hana.kim@example.com', 'student', NULL, 1);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student2', 'pw7', '이도윤', '도윤', 'doyoon.lee@example.com', 'student', NULL, 1);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student3', 'pw8', '박서준', '서준', 'seojoon.park@example.com', 'student', NULL, 2);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student4', 'pw9', '최민아', '민아', 'mina.choi@example.com', 'student', NULL, 2);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student5', 'pw10', '장하윤', '하윤', 'hayoon.jang@example.com', 'student', NULL, 2);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student6', 'pw11', '정수아', '수아', 'sua.jung@example.com', 'student', NULL, 2);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student7', 'pw12', '김영훈', '영훈', 'younghoon.kim@example.com', 'student', NULL, 3);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student8', 'pw13', '이서연', '서연', 'seoyeon.lee@example.com', 'student', NULL, 3);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student9', 'pw14', '박민혁', '민혁', 'minhyuk.park@example.com', 'student', NULL, 3);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student10', 'pw15', '최예은', '예은', 'yeeun.choi@example.com', 'student', NULL, 4);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student11', 'pw16', '박지민', '지민', 'jimin.park@example.com', 'student', NULL, 4);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student12', 'pw17', '김태현', '태현', 'taehyun.kim@example.com', 'student', NULL, 4);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student13', 'pw18', '이서연', '서연', 'seoyeon.lee@example.com', 'student', NULL, 4);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student14', 'pw19', '정하윤', '하윤', 'hayoon.jung@example.com', 'student', NULL, 5);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student15', 'pw20', '오민석', '민석', 'minseok.oh@example.com', 'student', NULL, 5);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student16', 'pw21', '최하나', '하나', 'hana.choi@example.com', 'student', NULL, 5);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student17', 'pw22', '박준영', '준영', 'joonyoung.park@example.com', 'student', NULL, 5);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student18', 'pw23', '이유진', '유진', 'yujin.lee@example.com', 'student', NULL, 5);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student19', 'pw24', '김영훈', '영훈', 'younghoon.kim@example.com', 'student', NULL, 6);

INSERT INTO member (id, pw, name, nickname, email, role, profile_image_path, family_id)
VALUES ('student20', 'pw25', '장민아', '민아', 'mina.jang@example.com', 'student', NULL, 6);


-- lecture 데이터 삽입 (외국어 학습 강의)
INSERT INTO lecture (lecture_name, description, createdAt, endAt, member_id, family_id)
VALUES ('English Basics', '타파스바에서 시작하는 즐거운 밤☀️', SYSDATE, SYSDATE + 30, 1, 1);

INSERT INTO lecture (lecture_name, description, createdAt, endAt, member_id, family_id)
VALUES ('일본어 회화 마스터', '혼자서도 척척, 완벽한 여행 일본어', SYSDATE, SYSDATE + 45, 2, 2);

INSERT INTO lecture (lecture_name, description, createdAt, endAt, member_id, family_id)
VALUES ('여행용 아랍어', '시장에서 흥정하며 즐기는 여행의 맛!', SYSDATE, SYSDATE + 60, 3, 3);

INSERT INTO lecture (lecture_name, description, createdAt, endAt, member_id, family_id)
VALUES ('관광 중국어', '관광명소에서 바로 쓰는 필수 표현', SYSDATE, SYSDATE + 30, 4, 4);

INSERT INTO lecture (lecture_name, description, createdAt, endAt, member_id, family_id)
VALUES ('자신있게 영어!', '공항부터 호텔까지 자신있게 영어로!', SYSDATE, SYSDATE + 50, 5, 5);

INSERT INTO lecture (lecture_name, description, createdAt, endAt, member_id, family_id)
VALUES ('봉주르 프랑스', '프랑스 디저트 탐방을 위한 필수 회화', SYSDATE, SYSDATE + 50, 6, 6);

SELECT * FROM lecture;

-- article 데이터 삽입 (학생들이 작성한 게시글)

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (7, '영어 기초 공부 후기', '영어 기초 강의를 듣고 많이 배웠어요! 정말 도움이 되었습니다.', SYSDATE, SYSDATE, 1);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (7, '영어 학습 팁 공유', '단어를 외울 때 그림과 함께 외우면 더 기억에 오래 남아요.', SYSDATE, SYSDATE, 1);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (8, '일본어 회화 연습 후기', '일본어로 간단한 대화를 할 수 있게 되었어요! 재미있습니다.', SYSDATE, SYSDATE, 2);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (8, '여행 일본어 필수 표현', '여행할 때 필요한 일본어 표현들을 정리해봤어요.', SYSDATE, SYSDATE, 2);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (9, '아랍어 공부 시작', '처음에는 어려웠지만 강의를 들으면서 점점 익숙해지고 있어요.', SYSDATE, SYSDATE, 3);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (9, '아랍어 발음 팁', '발음이 어렵지만 자꾸 소리 내어 연습하면 좋아집니다.', SYSDATE, SYSDATE, 3);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (10, '중국어 관광 표현', '관광명소에서 꼭 필요한 중국어 표현들을 배웠어요.', SYSDATE, SYSDATE, 4);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (10, '중국어 발음 연습', '성조 발음이 어렵지만, 강사님의 설명이 정말 도움이 되었어요.', SYSDATE, SYSDATE, 4);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (11, '영어 자신감 얻기', '호텔과 공항에서 영어를 사용해보니 자신감이 생겼습니다.', SYSDATE, SYSDATE, 5);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (11, '영어 듣기 공부법', '영화와 노래로 듣기 연습을 하면 정말 효과적입니다.', SYSDATE, SYSDATE, 5);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (12, '프랑스어 맛보기', '프랑스 디저트를 주문할 때 꼭 필요한 표현을 배웠습니다.', SYSDATE, SYSDATE, 6);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (12, '프랑스어 강의 추천', '프랑스 여행을 준비하는 분께 강력 추천합니다.', SYSDATE, SYSDATE, 6);

-- 추가 데이터
INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (13, '중국어 실력 늘리기', '매일 꾸준히 연습하니 실력이 늘고 있어요.', SYSDATE, SYSDATE, 4);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (14, '아랍어 공부 경험', '어려웠지만 꾸준히 하니 점점 이해가 됩니다.', SYSDATE, SYSDATE, 3);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (15, '일본어 실전 회화', '일본 여행 중 직접 사용해보니 정말 유용했습니다.', SYSDATE, SYSDATE, 2);

INSERT INTO article (member_id, title, content, createdAt, updatedAt, family_id)
VALUES (16, '영어 발음 교정', '발음을 교정하면서 자신감이 생겼어요.', SYSDATE, SYSDATE, 1);




