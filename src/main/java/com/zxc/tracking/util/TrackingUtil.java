package com.zxc.tracking.util;

import com.zxc.tracking.model.OrderStatus;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;


import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

public class TrackingUtil {

    public static Pageable getPageFromRequest(HttpServletRequest request) {
        String iDisplayStartTxt = request.getParameter("iDisplayStart");
        String iDisplayLengthTxt = request.getParameter("iDisplayLength");


        Integer iDisplayStart = (!isNullOrEmpty(iDisplayStartTxt)) ? Integer.valueOf(iDisplayStartTxt) : 0;
        Integer iDisplayLength = (!isNullOrEmpty(iDisplayLengthTxt)) ? Integer.valueOf(iDisplayLengthTxt) : 0;
        Integer cPage = 0;

        if (iDisplayStart != 0) {
            cPage = (iDisplayStart / iDisplayLength) ;
        }

        return PageRequest.of(cPage, iDisplayLength);
    }

    public static boolean isNullOrEmpty(String value){
        if (value != null)
            return value.length() == 0;
        else
            return true;
    }


    public static String getCurrentStatus(Boolean iscomplete, List<OrderStatus> statusList){

        OrderStatus status= statusList.stream().filter(m->m.getDate()!=null && (m.getDate().compareTo(new Date())<0)).max(Comparator.comparing(OrderStatus::getDate)).get();
        return status.getCode().getCodeName();
    }

    public static String DateToString(Date date){
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm aa");
        return format.format(date);
    }


}
