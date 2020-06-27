package com.zxc.tracking.rest.controller;


import com.zxc.tracking.model.Util.Code;
import com.zxc.tracking.model.view.DatatableBean;
import com.zxc.tracking.service.SettingService;
import com.zxc.tracking.util.TrackingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


@RestController
@RequestMapping("/rest/admin")
public class AdminRestController {


    @Autowired
    private SettingService settingService;



    @RequestMapping(value = "/savecode",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> saveCode(HttpServletRequest request){

        String codeType=request.getParameter("code_type");
        String codeId  =request.getParameter("code_id");
        String codeName=request.getParameter("code_name");

        Code code=settingService.createCode(new Code(codeId,codeType,codeName));




        return new ResponseEntity<>(code,HttpStatus.OK);
    }

    @RequestMapping(value = "/codes", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> codeList(HttpServletRequest request) {


        Pageable pageable=TrackingUtil.getPageFromRequest(request);

        Page<Code> codeList=settingService.findAllCodeByType("",pageable);


        System.out.println(codeList.getContent());

        DatatableBean bean=new DatatableBean();

        bean.setiTotalDisplayRecords((int) (long)codeList.getTotalElements());
        bean.setiTotalRecords((int) (long)codeList.getTotalElements());
        bean.setAaData(codeList.getContent());

        return new ResponseEntity<>(bean, HttpStatus.OK);


    }
}
