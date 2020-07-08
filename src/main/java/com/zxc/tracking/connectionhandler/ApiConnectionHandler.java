package com.zxc.tracking.connectionhandler;

import org.springframework.http.*;
import org.springframework.http.client.BufferingClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.util.Collections;

@Component
public class ApiConnectionHandler {
    private RestTemplate rest;
    /* private HttpHeaders headers;*/
    private HttpStatus status;
    private int statusCode;


    public ApiConnectionHandler() {
        this.rest = new RestTemplate();


        /* rest.setInterceptors(Collections.singletonList(new RequestResponseLoggingInterceptor()));*/



        rest.getMessageConverters().add(1,new StringHttpMessageConverter(StandardCharsets.UTF_8));

        // set header value
    /*    this.headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON_UTF8));
*/
        HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory ();
        requestFactory.setConnectTimeout(60000);
        requestFactory.setReadTimeout(30000);
        rest.setRequestFactory(new BufferingClientHttpRequestFactory(requestFactory));



    }


    public ResponseEntity Post(String json) {
        try {

            HttpHeaders headers=httpHeaders();

            headers.add("Authorization", "Bearer 7hvzbyVOcxTbmWWTfAvnOxcJ5705VT4hqUuqNvx4_VdR0vFQj9Gk7KvTFMN2ifYG");


            final String requestUri = "https://smspoh.com/api/v2/send";

            System.out.println(requestUri);
            HttpEntity<String> requestEntity = new HttpEntity<String>(json, headers);
            ResponseEntity<String> response = rest.exchange(requestUri, HttpMethod.POST, requestEntity, String.class);
            System.out.println(response);
            return response;
        } catch (Exception e){
            e.printStackTrace();

        }
        return  null;
    }




    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public HttpStatus getStatus() {
        return status;
    }

    public void setStatus(HttpStatus status) {
        this.status = status;
    }

    private HttpHeaders httpHeaders(){
        HttpHeaders headers=new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        return headers;
    }

}
