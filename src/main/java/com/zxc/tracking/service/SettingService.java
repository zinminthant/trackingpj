package com.zxc.tracking.service;

import com.zxc.tracking.model.Const.Message;
import com.zxc.tracking.model.User.User;
import com.zxc.tracking.model.Util.Code;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface SettingService {


    Code createCode(Code code);

    Code getCodeByCodeId(String codeId);

    Page<Code> findAllCodeByType(String type, Pageable page);

    List<Code> findCodesByType(String type);

    Code findCodeById(long id);

    //Delivery List
    List<User> deliveryList();




    //Message
    Message createMessageFormat(Message message);

    Message getMessage(String type);
}
