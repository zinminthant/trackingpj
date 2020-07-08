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



    @RequestMapping(value = "/saveCode",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> saveCode(HttpServletRequest request){

        Code coderesult=new Code();

        long id=Long.parseLong(request.getParameter("id"));
        String codeType=request.getParameter("codeType");
        String codeId  =request.getParameter("codeID");
        String codeName=request.getParameter("codeName");
        String description=request.getParameter("descriptioon");


        if(id==0L){
            coderesult=settingService.createCode(new Code(codeId,codeType,codeName,description));

        }
        else {
            Code code=settingService.findCodeById(id);
            code.setCodeName(codeName);code.setDescriptioon(description);
            coderesult=settingService.createCode(code);
        }




        return new ResponseEntity<>(coderesult,HttpStatus.OK);
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
