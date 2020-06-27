package com.zxc.tracking.service.impl;

import com.zxc.tracking.model.Const.Role;
import com.zxc.tracking.model.User.User;
import com.zxc.tracking.model.Util.Code;
import com.zxc.tracking.repository.CodeRepository;
import com.zxc.tracking.repository.RoleRepository;
import com.zxc.tracking.repository.UserRepository;
import com.zxc.tracking.service.SettingService;
import com.zxc.tracking.util.TrackingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SettingServiceImpl implements SettingService {

    @Autowired
    private CodeRepository codeRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;


    @Override
    public Code createCode(Code code) {
        return codeRepository.save(code);
    }

    @Override
    public Code getCodeByCodeId(String codeId) {
        return codeRepository.getCodeByCodeID(codeId);
    }

    @Override
    public Page<Code> findAllCodeByType(String type, Pageable page) {
        if(TrackingUtil.isNullOrEmpty(type)){
            return codeRepository.findAll(page);
        }
        return codeRepository.findAllByCodeType(type,page);
    }

    @Override
    public List<Code> findCodesByType(String type) {
        return codeRepository.findAllByCodeType(type);
    }

    @Override
    public List<User> deliveryList() {
        try{
            System.out.println("_____________________--"+roleRepository.getRoleByRole("DELIVERY"));
        }catch (Exception e){
            System.out.println("excefwefwefwefwe");
            e.printStackTrace();
        }

        return userRepository.findAllByRole(roleRepository.getRoleByRole(Role.DELIVERY.toString()));
    }


}
