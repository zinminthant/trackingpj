package com.zxc.tracking.repository;

import com.zxc.tracking.model.Const.Message;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepository extends JpaRepository<Message,Long> {

    Message getMessageByType(String type);
}
