-- 사용자에게 기본 테이블스페이스 설정
-- ALTER USER DOTHEG DEFAULT TABLESPACE USERS;

-- 테이블스페이스 쿼타 할당 (무제한 크기 허용)
-- ALTER USER DOTHEG QUOTA UNLIMITED ON USERS;

-- GRANT CREATE TRIGGER TO DOTHEG;

-- GRANT CREATE SEQUENCE TO DOTHEG;

-- GRANT INSERT, UPDATE, SELECT ON family TO DOTHEG;

-- drop

DROP TABLE LECTURE;

DROP TABLE ARTICLE;

DROP TABLE MEMBER;

DROP TABLE FAMILY;

DROP SEQUENCE seq_member_id;

DROP SEQUENCE seq_family_id;

DROP SEQUENCE seq_lecture_id;

DROP SEQUENCE seq_article_id;


DROP TRIGGER trg_member_id;

DROP TRIGGER trg_family_id;

DROP TRIGGER trg_lecture_id;

DROP TRIGGER trg_article_id;

-- family 테이블
CREATE TABLE family (
    family_id NUMBER(20) PRIMARY KEY,
    family_name VARCHAR(255) NOT NULL
);

-- member 테이블
CREATE TABLE member (
    member_id NUMBER(20) PRIMARY KEY,
    id VARCHAR(50) NOT NULL,
    pw VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    nickname VARCHAR(50),
    email VARCHAR(50) NOT NULL,
    role VARCHAR(50),
    profile_image_path VARCHAR(255),
    family_id NUMBER(20),
    FOREIGN KEY (family_id) REFERENCES family(family_id)
);


-- lecture 테이블
CREATE TABLE lecture (
    lecture_id NUMBER(20) PRIMARY KEY,
    lecture_name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    createdAt DATE NOT NULL,
    endAt DATE,
    member_id NUMBER(20) NOT NULL,
    family_id NUMBER(20),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (family_id) REFERENCES family(family_id)
);

-- article 테이블
CREATE TABLE article (
    article_id NUMBER(20) PRIMARY KEY,
    member_id NUMBER(20) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content VARCHAR(255) NOT NULL,
    createdAt DATE NOT NULL,
    updatedAt DATE,
    family_id NUMBER(20),
    task_done NUMBER(1) DEFAULT 0,
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (family_id) REFERENCES family(family_id)
);

-- family_id 시퀀스
CREATE SEQUENCE seq_family_id START WITH 1 INCREMENT BY 1;

-- family 테이블용 트리거
CREATE OR REPLACE TRIGGER trg_family_id
BEFORE INSERT ON family
FOR EACH ROW
BEGIN
    :NEW.family_id := seq_family_id.NEXTVAL;
END;

-- member_id 시퀀스
CREATE SEQUENCE seq_member_id START WITH 1 INCREMENT BY 1;

-- member 테이블용 트리거
CREATE OR REPLACE TRIGGER trg_member_id
BEFORE INSERT ON member
FOR EACH ROW
BEGIN
    :NEW.member_id := seq_member_id.NEXTVAL;
END;

-- lecture_id 시퀀스
CREATE SEQUENCE seq_lecture_id START WITH 1 INCREMENT BY 1;

-- lecture 테이블용 트리거
CREATE OR REPLACE TRIGGER trg_lecture_id
BEFORE INSERT ON lecture
FOR EACH ROW
BEGIN
    :NEW.lecture_id := seq_lecture_id.NEXTVAL;
END;

-- article_id 시퀀스
CREATE SEQUENCE seq_article_id START WITH 1 INCREMENT BY 1;

-- article 테이블용 트리거
CREATE OR REPLACE TRIGGER trg_article_id
BEFORE INSERT ON article
FOR EACH ROW
BEGIN
    :NEW.article_id := seq_article_id.NEXTVAL;
END;


