-- Users 테이블
CREATE TABLE User (
    user_id CHAR(64) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    api_key VARCHAR(255) NOT NULL
);

-- ChatRoom 테이블
CREATE TABLE ChatRoom (
    room_id CHAR(64) PRIMARY KEY,
    user_id CHAR(64),
    room_name VARCHAR(255),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp 추가
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- ChatMessage 테이블
CREATE TABLE ChatMessage (
    message_id CHAR(64) PRIMARY KEY,           -- 메세지 고유 ID(UUID)
    room_id CHAR(64),                          -- 채팅방 ID (외래 키)
    content TEXT NOT NULL,                     -- 메세지 내용 저장
    sender_type ENUM('User', 'AI') NOT NULL,   -- 메세지 발신자를 나타냄
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp 추가

    -- 외래 키 설정 (ChatRoom 테이블의 room_id 참조)
    CONSTRAINT FK_ChatRoom FOREIGN KEY (room_id)
    REFERENCES ChatRoom(room_id) ON DELETE CASCADE
);

drop table ChatMessage;
drop table ChatRoom;
drop table User;

select * from User;
select * from ChatMessage;
select * from ChatRoom;