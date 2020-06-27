package com.zxc.tracking.util;

import com.sun.prism.shader.Solid_TextureYV12_AlphaTest_Loader;
import com.zxc.tracking.model.Order;
import com.zxc.tracking.model.OrderStatus;
import com.zxc.tracking.model.User.Role;
import org.aspectj.weaver.ast.Or;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.awt.*;
import java.awt.font.TextAttribute;
import java.io.UnsupportedEncodingException;
import java.text.AttributedString;
import java.util.*;

import static java.util.GregorianCalendar.AD;

public class addJPAManually {



    public static void main(String[] args){

        System.out.println(new Date(1000));

        String original="ေက်ာ္ျကီး";

        System.out.println( "\\u" + Integer.toHexString('÷' | 0x10000).substring(1) );
        try {

            byte[] utf8Bytes = original.getBytes("UTF8");

            byte[] defaultBytes = original.getBytes();

            String roundTrip = new String(utf8Bytes, "UTF8");

            System.out.println("roundTrip = " + roundTrip);

            System.out.println();



        }

        catch (UnsupportedEncodingException e) {

            e.printStackTrace();

        }

//        List<OrderStatus> list=new ArrayList<>();
//        list.add(new OrderStatus("testing",new GregorianCalendar(2020, 6 - 1, 24,13,6,34).getTime()));
//        list.add(new OrderStatus("1",new GregorianCalendar(2020, 6 - 1, 24,13,7,34).getTime()));
//        list.add(new OrderStatus("2",new GregorianCalendar(2020, 6 - 1, 24,13,13,34).getTime()));
//        list.add(new OrderStatus("3",new GregorianCalendar(2020, 6 - 1, 254,13,40,34).getTime()));
//
//        OrderStatus status=Collections.max(list,Comparator.comparing(OrderStatus::getDate));
//
//
//
//       OrderStatus status1= list.stream().filter(m->m.getDate().compareTo(new Date())<0).max(Comparator.comparing(OrderStatus::getDate)).get();
//
//        System.out.println(status1);

    }
}
