/**
 * Java Locus CRM javascript core framework.
 * Version : 1.0.0
 * Create Date :
 *
 * Modify History
 * =================================================================================================================================================================
 * Modify Date		Description													Version Update From		Version Update To
 * =================================================================================================================================================================
 */

var AJAX_TIMEOUT = '60000'; // 1 minute = 60 second >>  1 second = 1000 milliseconds
var LOADING_MSG = 'loading';
var curRowSelectedDt = 0;
var chatMsgCount = 0;

var datatable_emptyTable='Record not found';
var datatable_pagedetailTable='Showing _START_ to _END_ of _TOTAL_ entries'
/**
 * Description 	: Mask Input :: format input start on load jlo-common.js finish time
 * @param		: -
 * @returns		: -
 * @author 		: Poobase Sangsorn
 */

function setSelect2me(){
    if (jQuery().select2) {
        try{
            $('.select2me').select2({
                placeholder: select2_pleaseSelect,
                allowClear: true
            });
        }catch(e){}

    }
}

/***
 * Description : For check length phoneNo
 * @param phoneNo
 * @returns {Boolean}
 * @author preyanoot
 */
function validatePhone(phoneNo){

    var replacePhone = new RegExp("\\-","g");
    phoneNo = phoneNo.replace(replacePhone,"");

    var index = phoneNo.indexOf("_");
    if(index > -1){
        var indexReplacePhone = new RegExp("\\_","g");
        phoneNo = phoneNo.replace(indexReplacePhone,"");
    }

    var phonelen = phoneNo.length;

    if(phonelen == 10 || phonelen == 4){
        return true;
    }else{
        return false;
    }
}


/**
 * Description 	: Mask Input :: format input start on load jlo-common.js finish time
 * @param		: -
 * @returns		: - format
 */
function setMaskComponent(){

    if ( $.isFunction($.fn.inputmask) ) {
        $(".maskdate").inputmask("d/m/y", {
            "placeholder": "dd/mm/yyyy"
        });
        $(".masktime").inputmask("hh:mm", {
            "placeholder": "__:__"
        });
        $(".maskmobile").inputmask("099-999-9999",{
            "placeholder": "___-___-____",
        });
        $(".masktel").inputmask("09-999-9999",{
            "placeholder": ""
        });

        $(".maskzipcode").inputmask("99999",{
            "placeholder": ""
        });
        $(".mask2digitnum").inputmask("99",{
            "placeholder": ""
        });

        $(".maskcost").inputmask("9999999999",{
            "placeholder": ""
        });

        $(".inputnumber").keypress(function (e) {
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
        });
    }
}

/***
 *
 * @param parentTag  division
 * @param attId      key Id Attachement
 * @param fileType  type of file
 * @param height    height
 * @author Poobase Sangsorn
 */
function playAttFile(parentTag, attId, fileType, height){

    var urlReadFile  = CONTEXT_PATH+"/readFile.htm?attId="+attId;
    var urlDowloadFile  = CONTEXT_PATH+"/downloadFile.htm?attId="+attId;
    parentTag.html("");
    var rowIndexVDO = fileType.indexOf("video");
    var rowIndeximage = fileType.indexOf("image");
    var rowIndexPDF = fileType.indexOf("pdf");
    var rowIndexAudio = fileType.indexOf("audio");

    if(rowIndexVDO != -1) {

        var rowIndexWMV =  fileType.indexOf("wmv");

        if(rowIndexWMV > -1){
            parentTag.html('<object width="100%" height="'+height+'" data="'+urlDowloadFile+'" type="'+fileType+'"></object>');
        } else {
            var flashvideo = '<object type="application/x-shockwave-flash" data="http://'+window.location.hostname+(location.port ? ':'+location.port: '')+CONTEXT_PATH+'/assets/swf/flowplayer-3.2.1.swf" width="100%" height="'+height+'">'+
                '<param name="movie" value="http://'+window.location.hostname+(location.port ? ':'+location.port: '')+CONTEXT_PATH+'/assets/swf/flowplayer-3.2.1.swf" />'+
                '<param name="allowFullScreen" value="true" />'+
                '<param name="wmode" value="transparent" />'+
                '<param name="flashVars" value="config={\'playlist\':[{\'url\':\''+encodeURIComponent('http://'+window.location.hostname+(location.port ? ':'+location.port: '')+urlDowloadFile)+'\',\'autoPlay\':false}]}" />'+
                '<span title="No video playback capabilities, please download the video below"></span>'+
                '</object>';
            parentTag.html(flashvideo);
        }

    } else if(rowIndeximage != -1) {

        if(typeof height == 'undefined') {
            height = 400;
        }

        parentTag.html('<div style="width:100%;height:'+height+'px;overflow: scroll;"><img id="displaypicsimpleshow" src="'+urlDowloadFile+'" /></div>');
        parentTag.append('<div align="center" style="margin-left: 20px;margin-right: 20px;"><input id="range_sizepic" type="text" name="range_sizepic" value="1;200"/></div>');

        $("#range_sizepic").ionRangeSlider({
            type: "single",
            min: 0,
            max: 200,
            from: 100,
            step: 5,
            postfix:"%",
            hasGrid: true,
            onChange: function(obj){
//            	 console.log(obj);
                $("#displaypicsimpleshow").attr("width",obj.fromNumber+"%");
            }
        });

    } else if (rowIndexPDF != -1) {

        if(typeof height == 'undefined') {
            height = 400;
        }
        parentTag.html('<object width="100%" height="'+height+'" data="'+urlReadFile+'" type="'+fileType+'"></object>');

        var dowLoadLink = '<div class="alert alert-block alert-warning fade in">'+
            '<h4 class="alert-heading">'+youcanDownload+'</h4>'+
            '<p><a href="'+urlDowloadFile+'">'+downloadFile+'</a></p>'+
            '</div>';
        parentTag.append(dowLoadLink);

    } else if(rowIndexAudio != -1) {

        var dowLoadLink = '<div class="alert alert-block alert-warning fade in">'+
            '<h4 class="alert-heading">'+youcanDownload+'</h4>'+
            '<p><a href="'+urlDowloadFile+'">'+downloadFile+'</a></p>'+
            '</div>';

        parentTag.html('<audio controls>'+
            '<source src="'+urlDowloadFile+'" type="audio/ogg">'+
            '<source src="'+urlDowloadFile+'" type="audio/mpeg">'+
            'Your browser does not support the audio element.'+
            '</audio>');
        parentTag.append(dowLoadLink);
    } else {
        parentTag.html('<div class="alert alert-block alert-warning fade in">'+
            '<h4 class="alert-heading">'+fileNotSupportPlayer+'</h4>'+
            '<p><a href="'+urlDowloadFile+'">'+downloadFile+'</a></p>'+
            '</div>');
    }
}

function playAttCmpFile(parentTag, attId, fileType, height){

    var urlReadFile  = CONTEXT_PATH+"/readFile.htm?attId="+attId;
    var urlDowloadFile  = CONTEXT_PATH+"/downloadCmpFile.htm?attId="+attId;
    parentTag.html("");
    var rowIndexVDO = fileType.indexOf("video");
    var rowIndeximage = fileType.indexOf("image");
    var rowIndexPDF = fileType.indexOf("pdf");
    var rowIndexAudio = fileType.indexOf("audio");

    if(rowIndexVDO != -1) {

        var rowIndexWMV =  fileType.indexOf("wmv");

        if(rowIndexWMV > -1){
            parentTag.html('<object width="100%" height="'+height+'" data="'+urlDowloadFile+'" type="'+fileType+'"></object>');
        } else {
            var flashvideo = '<object type="application/x-shockwave-flash" data="http://'+window.location.hostname+(location.port ? ':'+location.port: '')+CONTEXT_PATH+'/assets/swf/flowplayer-3.2.1.swf" width="100%" height="'+height+'">'+
                '<param name="movie" value="http://'+window.location.hostname+(location.port ? ':'+location.port: '')+CONTEXT_PATH+'/assets/swf/flowplayer-3.2.1.swf" />'+
                '<param name="allowFullScreen" value="true" />'+
                '<param name="wmode" value="transparent" />'+
                '<param name="flashVars" value="config={\'playlist\':[{\'url\':\''+encodeURIComponent('http://'+window.location.hostname+(location.port ? ':'+location.port: '')+urlDowloadFile)+'\',\'autoPlay\':false}]}" />'+
                '<span title="No video playback capabilities, please download the video below"></span>'+
                '</object>';
            parentTag.html(flashvideo);
        }

    } else if(rowIndeximage != -1) {

        if(typeof height == 'undefined') {
            height = 400;
        }

        parentTag.html('<div style="width:100%;height:'+height+'px;overflow: scroll;"><img id="displaypicsimpleshow" src="'+urlDowloadFile+'" /></div>');
        parentTag.append('<div align="center" style="margin-left: 20px;margin-right: 20px;"><input id="range_sizepic" type="text" name="range_sizepic" value="1;200"/></div>');

        $("#range_sizepic").ionRangeSlider({
            type: "single",
            min: 0,
            max: 200,
            from: 100,
            step: 5,
            postfix:"%",
            hasGrid: true,
            onChange: function(obj){
//            	 console.log(obj);
                $("#displaypicsimpleshow").attr("width",obj.fromNumber+"%");
            }
        });

    } else if (rowIndexPDF != -1) {

        if(typeof height == 'undefined') {
            height = 400;
        }
        parentTag.html('<object width="100%" height="'+height+'" data="'+urlReadFile+'" type="'+fileType+'"></object>');

        var dowLoadLink = '<div class="alert alert-block alert-warning fade in">'+
            '<h4 class="alert-heading">'+youcanDownload+'</h4>'+
            '<p><a href="'+urlDowloadFile+'">'+downloadCmpFile+'</a></p>'+
            '</div>';
        parentTag.append(dowLoadLink);

    } else if(rowIndexAudio != -1) {

        var dowLoadLink = '<div class="alert alert-block alert-warning fade in">'+
            '<h4 class="alert-heading">'+youcanDownload+'</h4>'+
            '<p><a href="'+urlDowloadFile+'">'+downloadCmpFile+'</a></p>'+
            '</div>';

        parentTag.html('<audio controls>'+
            '<source src="'+urlDowloadFile+'" type="audio/ogg">'+
            '<source src="'+urlDowloadFile+'" type="audio/mpeg">'+
            'Your browser does not support the audio element.'+
            '</audio>');
        parentTag.append(dowLoadLink);
    } else {
        parentTag.html('<div class="alert alert-block alert-warning fade in">'+
            '<h4 class="alert-heading">'+fileNotSupportPlayer+'</h4>'+
            '<p><a href="'+urlDowloadFile+'">'+downloadCmpFile+'</a></p>'+
            '</div>');
    }
}


var $countdown;
function idleTimeout(){

    $('body').append('<div class="modal fade" id="idle-timeout-dialog" data-backdrop="static"><div class="modal-dialog modal-small"><div class="modal-content"><div class="modal-header"><h4 class="modal-title">Your session is about to expire.</h4></div><div class="modal-body"><p><i class="fa fa-warning"></i> You session will be locked in <span id="idle-timeout-counter"></span> seconds.</p><p>Do you want to continue your session?</p></div><div class="modal-footer"><button id="idle-timeout-dialog-logout" type="button" class="btn btn-default">No, Logout</button><button id="idle-timeout-dialog-keepalive" type="button" class="btn btn-primary" data-dismiss="modal">Yes, Keep Working</button></div></div></div></div>');

    // start the idle timer plugin
    $.idleTimeout('#idle-timeout-dialog', '.modal-content button:last', {
        idleAfter: 600, // 600 seconds ไม่ได้อยู่ใน tab ในหน้าจอนั้น ไม่ได้ ขยับ mouse keyboard เกิน 600วิ
        timeout: 30000, //30 seconds to timeout นับถอยหลัง logout
        pollingInterval: 100, // 100 seconds live ส่งไปต่อชีวิต ผ่าน keepAliveURL
        keepAliveURL: 'idletimeoutkeepalive.htm',
        serverResponseEquals: 'OK',
        onTimeout: function(){
            window.location = "logout.htm";
        },
        onIdle: function(){
            $('#idle-timeout-dialog').modal('show');
            $countdown = $('#idle-timeout-counter');

            $('#idle-timeout-dialog-keepalive').on('click', function () {
                $('#idle-timeout-dialog').modal('hide');
            });

            $('#idle-timeout-dialog-logout').on('click', function () {
                $('#idle-timeout-dialog').modal('hide');
                $.idleTimeout.options.onTimeout.call(this);
            });
        },
        onCountdown: function(counter){
            $countdown.html(counter); // update the counter
        }
    });
}


/**
 * Description 	: To call controller via ajax and return to callback function. support multipart/form-data
 * @param		: objform - $("#formid")
 * 				: callbackFunction - Callback function.
 * @returns		: JSON Format
 * @author 		: Poobase Sangsorn
 */

function ajaxSubmitForm(objform,callbackFunction){
    objform.ajaxForm({
        dataType:  'json',
        beforeSend: function(){
            jLoBlockUI();
        },
        complete: function(xhr, textStatus){
            $.unblockUI();
        },
        success: callbackFunction,
        error: function(xhr, textStatus, errorThrown){
            checkShowMsgAjaxError(xhr, textStatus, errorThrown);
        }
    }).submit();

}

/**
 * Description 	: To call controller via ajax and return to re-direct URL with POST method
 * @param		: objform - $("#formid")
 * @author 		: Auttapol Pipatpatama
 */

function ajaxSubmitFormAndRedirect(objform){
    objform.ajaxForm({
        dataType:  'json',
        beforeSend: function(){
            jLoBlockUI();
        },
        complete: function(xhr, textStatus){
            $.unblockUI();
        },
        success: function(url) {
            postAction(url);

        },
        error: function(xhr, textStatus, errorThrown){
            checkShowMsgAjaxError(xhr, textStatus, errorThrown);
        }
    }).submit();

}
/**
 * Description 	: To call controller via ajax and return to callback function.
 * @param		: postUrl - HTTP request URL.
 * 				: param - HTTP request parameter.
 * 				: method - 'GET' or 'POST'
 * 				: callbackFunction - Callback function.
 * @returns		: None
 * @author 		: Auttapol Pipatpatama
 */
function loadJsonData(postUrl, param, method, callbackFunction) {

    jLoBlockUI();

    $.ajax({
        timeout: AJAX_TIMEOUT,
        url : postUrl,
        dataType: 'json',
        data: param,
        type: method,
        cache: false,
        success : callbackFunction

        ,error: function (xhr, textStatus, errorThrown) {

            checkShowMsgAjaxError(xhr, textStatus, errorThrown);

        }
    });
}

/**
 * Description 	: To call controller via ajax and return json object
 * @param		: postUrl - HTTP request URL.
 * 				: param - HTTP request parameter.
 * 				: method - 'GET' or 'POST'
 * @returns		: json object
 * @author		: Auttapol Pipatpatama
 */
function getJsonData(postUrl, param, method) {
    var obj = null;
    jLoBlockUI();
    $.ajax({
        timeout: AJAX_TIMEOUT,
        url : postUrl,
        dataType: 'json',
        data: param,
        type: method,
        async: false,
        cache: false,
        success : function (xhr, textStatus, errorThrown) {
            obj = xhr;
        }

        ,error: function (xhr, textStatus, errorThrown) {

            checkShowMsgAjaxError(xhr, textStatus, errorThrown);

        }
    });
    return obj;

}

/**
 * Description 	:
 * @param		:
 * @returns		:
 * @author		:
 */
function loadJsonDataForUpload(postUrl, param, method, callbackFunction) {

    jLoBlockUI();

    $.ajax({
        timeout: AJAX_TIMEOUT,
        url : postUrl,
        dataType: 'json',
        data: param,
        type: method,
        cache: false,
        contentType: "multipart/form-data",
        success : callbackFunction

        ,error: function (xhr, textStatus, errorThrown) {

            checkShowMsgAjaxError(xhr, textStatus, errorThrown);

        }
    });
}

/**
 * Description 	: To validate component in form
 * @param		: obj - form object
 * @returns		: boolean
 * @author		: Auttapol Pipatpatama
 */
function validateForm(obj) {
    var $valid = obj.validate(
        {
            errorClass : 'help-block',
            highlight : function(element) {
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight : function(element) {
                $(element).closest('.form-group').removeClass('has-error');
            },
            errorPlacement : function(error, element) {
                if (element.parent(".input-group").size() > 0) {
                    error.insertAfter(element.parent(".input-group"));
                } else if (element.attr("data-error-container")) {
                    error.appendTo(element.attr("data-error-container"));
                } else if (element.parents('.radio-list').size() > 0) {
                    error.appendTo(element.parents('.radio-list').attr("data-error-container"));
                } else if (element.parents('.radio-inline').size() > 0) {
                    error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
                } else if (element.parents('.checkbox-list').size() > 0) {
                    error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
                } else if (element.parents('.checkbox-inline').size() > 0) {
                    error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
                } else if (element.parent().find('.wysihtml5-sandbox').size() > 0){
                    error.insertAfter(element.parent().find('.wysihtml5-sandbox'));
                } else{
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },
        });
    (function ($) {
        $.extend($.validator.messages, {
            required: required,
            remote: remote,
            email: email,
            url: url,
            date: date,
            dateISO: dateISO,
            number: number,
            digits: digits,
            creditcard: creditcard,
            equalTo: equalTo,
            accept: accept,
            maxlength: $.validator.format(maxlength),
            minlength: $.validator.format(minlength),
            rangelength: $.validator.format(rangelength),
            range: $.validator.format(range),
            max: $.validator.format(max),
            min: $.validator.format(min)
        });
    }(jQuery));
    return $valid;
}

/**
 * Description 	: To clear error component in form
 * @param		: obj - form object
 * @author		: Auttapol Pipatpatama
 */
function clearValidateForm(obj) {
    obj.validate().resetForm();
    $('.has-error').removeClass('has-error');
}

/**
 * Description 	: Now only use for role action to create table with paint background to empty cell.
 * @param		: objTable - table object.
 * 				: postUrl - HTTP request URL.
 * 				: param - HTTP request parameter.
 * 				: method - 'GET' or 'POST'
 * @returns		: None
 * @author		: Auttapol Pipatpatama
 */
function loadJsonDataTable (objTable, postUrl, param, method) {

    jLoBlockUI();

    $.ajax({
        timeout: AJAX_TIMEOUT,
        url : postUrl,
        dataType: 'json',
        data: param,
        type: method,
        cache: false,
        success : function(data, textStatus, jqXHR) {
            objTable.dataTable().fnClearTable();
            objTable.dataTable({
                "bFilter": false,
                "bLengthChange": false,
                "bDestroy": true,
                "bSort" : false,
                "bAutoWidth": true,
                "bPaginate": false,
                "bInfo": false,});
            objTable.dataTable().fnAddData(data);
            findEmptyCols(objTable);
        },
        error: function (xhr, textStatus, errorThrown) {

            checkShowMsgAjaxError(xhr, textStatus, errorThrown);

        }
    });
}

/**
 * Description 	: Change empty cell background.
 * @param		: objTable - table object.
 * @author		: Auttapol Pipatpatama
 */
function findEmptyCols(objTable) {
    var numCols = $("tr", objTable).length;
    for ( var i = 1; i <= numCols; i++ ) {

        $("tr:nth-child(" + i + ") td", objTable).each(function(index, el) {
            //console.log(i + "-->" + index + "-->" + $(el).html());

            if ($(el).html() == '') {
                $(el).css('background-color', '#ddd');
            }
        });
    }
}


/**
 * Description 	: To call controller via ajax and get json data set to datatable.
 * @param		: objTable - table object
 * 				: columns - aoColumns description.
 * 				: postUrl - HTTP request URL.
 * 				: param - HTTP request parameter.
 * 				: totalRecordPerPage - Total record per page.
 * 				: isPaginate - use pagination.
 * 				: showNumber - use ordering number.
 * @returns		: datatable object
 * @author		: Auttapol Pipatpatama
 */
function ajaxDataTable (objTable, columns, postUrl, param, totalRecordPerPage, isPaginate, showNumber) {


    var recordPerPage = parseInt(totalRecordPerPage);

    return objTable.dataTable({
        "aoColumns": columns,
        "bFilter": false,
        "bLengthChange": false,
        "bDestroy": true,
        "bAutoWidth": false,
        "rowId": 'extn',
        "bPaginate": isPaginate,
        "bInfo": isPaginate,
        "bSort" : false,
        "bServerSide": true,
        "bProcessing": true,
        "pageLength": 10,
        "sServerMethod": "POST",
        "iDisplayLength" : recordPerPage,
        "sAjaxSource": postUrl,
        "fnStateSave": function (oSettings, oData) {
            localStorage.setItem('DataTables_' + window.location.pathname, JSON.stringify(oData));
        },
        "fnStateLoad": function (oSettings) {
            var data = localStorage.getItem('DataTables_' + window.location.pathname);
            return JSON.parse(data);
        },
        "fnServerData": function(sSource, aoData, fnCallback) {
            pushParam2Json(aoData, param);

            $.post( sSource, aoData, function (json) {
                fnCallback(json);


            } );
        },
        "fnDrawCallback":reDrawCallback(showNumber, false,objTable),
        "oLanguage": {  // language settings
            "sProcessing": LOADING_MSG,
            "sEmptyTable": datatable_emptyTable,
            "sInfo": datatable_pagedetailTable,
            "sInfoEmpty": datatable_emptyTable
        },
    });
}

function pushParam2Json(aoData, getParam) {

    if (getParam != '') {
        var eachParam = getParam.split('&');
        var inside = {};

        $.each(eachParam, function(index, item) {
            var param = item.split('=');
            inside[param[0]] = param[1];
            aoData.push( {name: param[0], value:decodeURIComponent(param[1])} );
        });
    } else {
        console.log('No parameter');
    }
}

/**
 * Description 	: To redraw datatable for set ordering to column or redirect when use double click event.
 * @param		: oSettings from datatable.
 * @returns		: None
 * @author		: Auttapol Pipatpatama
 */
function reDrawCallback(showNumber, useDbClick,objTable) {

    var objDtId = "";

    if(!empty(objTable)){
        objDtId = objTable[0].id;
    }


    return function(oSettings) {
        if (showNumber) {
            for ( var i=0, iLen=oSettings.aiDisplay.length ; i<iLen ; i++ ) {
                var tdValue = $('td:eq(0)', oSettings.aoData[ oSettings.aiDisplay[i] ].nTr ).html();
                if (tdValue.indexOf("href") >= 0 || tdValue == '') {
                    $('td:eq(1)', oSettings.aoData[ oSettings.aiDisplay[i] ].nTr ).html( i+oSettings._iDisplayStart+1 );
                } else {
                    $('td:eq(0)', oSettings.aoData[ oSettings.aiDisplay[i] ].nTr ).html( i+oSettings._iDisplayStart+1 );
                }

            }
        }

        if(!empty(objDtId)){

            $('#'+objDtId+' tbody tr').on("click", function () {

                curRowSelectedDt = $(this).index();

                onRowSelected($(this),objTable);
            } );
        }


        var url = '';
        for ( var i=0, iLen=oSettings.aiDisplay.length ; i<iLen ; i++ ) {

            $(this).css('cursor', 'pointer');
            if(useDbClick){
                $( oSettings.aoData[ oSettings.aiDisplay[i] ].nTr).live('dblclick touchstart', function () {

                    url = $('td:last a', this).attr('href');
                    if (typeof url != 'undefined' && url != '') {
                        redirectUrlAction(url);
                    }

                });
            }
        }
    };
}

/**
 * Description 	: To call controller via ajax and get json data to create tree.
 * @param		: objTree - Tree object.
 * 				: postUrl - HTTP request URL.
 * 				: param - HTTP request parameter.
 * 				: method - 'GET' or 'POST'
 * @returns		: None
 * @author		: Auttapol Pipatpatama
 */
function loadJsonTree(objTree, postUrl, param, method) {

    jLoBlockUI();

    $.ajax({
        timeout: AJAX_TIMEOUT,
        url : postUrl,
        dataType: 'json',
        type: method,
        data: param,
        cache: false,
        success : function(data) {
            objTree.jstree({
                'core' : {
                    'data' : data,
                    'multiple' : false,
                    'check_callback' : function (operation, node, node_parent, node_position, more) {
                        //console.log('operation ' + operation);
                        //console.log('node ' + JSON.stringify(node));
                        //console.log('node_parent ' + JSON.stringify(node_parent));

                        if (operation === 'move_node') {
                            if (node_parent.id == '#') {
                                return true;
                            } else {
                                if (node_parent.parent == '#') {
                                    return true;
                                } else {
                                    return false;
                                }
                            }

                        } else {
                            return true;
                        }
                        // return true;
                    }
                },
                "dnd": {
                    check_while_dragging: true
                },
                'plugins' : [ 'dnd' ]
            });
        },

        error: function (xhr, textStatus, errorThrown) {

            checkShowMsgAjaxError(xhr, textStatus, errorThrown);

        }
    });
}

/**
 * Description 	:
 * @param		:
 * @returns		:
 * @author		:
 */
function createTreeMenuWithSearch(objTree, postUrl, param, method) {

    jLoBlockUI();

    $.ajax({
        timeout: AJAX_TIMEOUT,
        url : postUrl,
        dataType: 'json',
        type: method,
        data: param,
        cache: false,
        success : function(data) {

            objTree.jstree({
                'core' : {
                    'data' : data
                },
                'plugins' : [ 'search' ]

            });
        } ,

        error: function (xhr, textStatus, errorThrown) {

            checkShowMsgAjaxError(xhr, textStatus, errorThrown);
        }
    });
}

/**
 * Description 	:
 * @param		:
 * @returns		:
 * @author		:
 */
function createTreeMenuAjax(objTree, postUrl, param,method) {

    jLoBlockUI();
    /*
     * {
     * id          : "string" // required
     * parent      : "string" // required
     * text        : "string" // node text
     * children    : boolean  // is children
     */
    return objTree.jstree({
        'core' : {
            'data' : {
                'url' : function (node) {
                    return node.id === '#' ? postUrl+(param.length>0?"?":"&")+param : postUrl+(param.length>0?"?":"&")+param+"&children="+node.id;
                },
                'data' : function (node) {
                    return { 'id' : node.id };
                },
                cache: false
            }
        }

    });
}

/**
 * Description 	: To show message popup on screen.
 * @param		: title - title message.
 * 				: text - description message.
 * @returns		: None
 * @author		: Auttapol Pipatpatama
 */
function sendGritterMsg(title, text) {
    $.gritter.add({
        title: title,
        text: text,
        sticky: false,
        time: 18000,
        class_name: 'gritter-blue'
    });
}

/**
 * Description 	: To show message popup on screen.
 * @param		: title - title message.
 * 				: text - description message.
 * 				: cssClass - stylesheet class name.
 * @returns		: None
 * @author		: Auttapol Pipatpatama
 */
function sendGritterMsg(title, text, cssClass) {
    $.gritter.add({
        title: title,
        text: text,
        sticky: false,
        time: 18000,
        class_name: cssClass
    });
}

/**
 * Description 	: use before call ajax
 * @param		:
 * @returns		: Block User Interface  Block Page.
 * @author		: Mr.BoonOOm
 */
function jLoBlockUI(){
    //App.blockUI({boxed: true});
    $.blockUI({ message: LOADING_MSG , css: { backgroundColor: 'none', border: 'none'} });
}


/**
 * Description 	: use before call ajax
 * @param		:
 * @returns		: Block User Interface  Block Page.
 * @author		: Mr.BoonOOm
 */
function jLoMaskLoadingBlockUI(){
    $("#maskLoadingGlobal").mask(LOADING_EMAIL_MSG); //LOADING_EMAIL_MSG
}

/**
 * Description 	: unmask waiting use After callback ajax
 * @param		:
 * @returns		:unmask , UnBlock User Interface  Block Page.
 * @author		: Mr.BoonOOm
 */
function jLoMaskLoadingUnBlockUI(){
    $("#maskLoadingGlobal").unmask();
}


/**
 * Description 	: Message Broadcast Interval
 * @param	:
 * @returns		:
 * @author		: Poobase Sangsorn
 */
function messageBroadcastNavInbox(){

    setInterval(function() {
        $.ajax({
            type: "POST",
            url: CONTEXT_PATH+'/getInboxMessage.htm',
            cache: false,
            dataType:"json",
            async: false,
            cache: false,
            success: function(json){
                if (json != null) {
                    console.log("json size:"+json.length);
                    if(json.length>0){
                        $("#inbox-badge").text(json.length);
                        $("#inbox-badge").show();
                        $("#countinboxnumber").html(json.length);
                        $("#header_inbox_bar #countinbox p").show();
                        $("#audio_newmessage")[0].play();
                        if(typeof $.gritter != 'undefined'){
                            var unique_id = $.gritter.add({
                                // (string | mandatory) the heading of the notification
                                title: $("#header_inbox_bar #countinbox p").html(),
                                // (string | mandatory) the text inside the notification
                                text: '<a href="'+CONTEXT_PATH+'/messageBroadcast.htm">'+seeallMessage+'</a>',
                                // (string | optional) the class name you want to apply to that specific message
                                class_name: 'my-sticky-class'
                            });

                            // You can have it return a unique id, this can be used to manually remove it later using
                            setTimeout(function () {
                                $.gritter.remove(unique_id, {
                                    fade: true,
                                    speed: 'slow'
                                });
                            }, 15000);
                        }
                        $("#inboxList").html("");
                        for(var i=0;json.length>i;i++){
                            console.log(json[i]);
                            console.log("sender:"+json[i].userName);
                            console.log("userpic:"+json[i].userPic);
                            console.log("title:"+json[i].title);
                            console.log("message:"+json[i].content);
                            $("#inboxList").append('<li><a href="#msgId='+json[i].msgId+'" msgId="'+json[i].msgId+'">' +
                                '<span class="photo">' +
                                '<img src="'+CONTEXT_PATH+'/imageFile.htm?src='+json[i].userPic+'" alt=""/>' +
                                '</span>' +
                                '<span class="subject">' +
                                '<span class="from">' +
                                json[i].userName +
                                '</span>' +
                                '<span class="time">' +
                                json[i].lastSenderTime +
                                '</span>' +
                                '</span>' +
                                '<span class="message">' +
                                '<b>'+json[i].title+'</b> ' +
                                json[i].content +
                                '</span>' +
                                '</a></li>');
                        }
                    }
                }
            },
            error : function() {
                //result = false;
            }
        });

    }, 30000);
}

function reloadTaskProgress() {
    try {
        /*
        var srAmount = parseInt(getJsonData("countServiceRequestTask.htm", "", "POST"));
        var actAmount =  parseInt(getJsonData("countActivityTask.htm", "", "POST"));
        var totalTask = srAmount+actAmount;

        $("#task-message").html(totalTask);
        $("#task-badge").html(totalTask);

        try {

            if (totalTask > 0) {
                var srPercentage = (srAmount / totalTask) * 100;
                srPercentage = Math.round(srPercentage);
                var actPercentage = (actAmount / totalTask) * 100;
                actPercentage = Math.round(actPercentage);

                $('#activityProgress').css('width', actPercentage+'%');
                $('#activityProgress').attr('aria-valuenow', actPercentage);
                $('#srProgress').css('width',srPercentage+'%');
                $('#srProgress').attr('aria-valuenow', srPercentage);
            }
        } catch (error) {
            console.log('Cannot calculate percentage : ' + error);
        }
        */

        /*		$.post("countServiceRequestTask.htm",function(txtsrAmount){
                    $.post("countActivityTask.htm",function(txtactAmount){
                        $.post("countServiceRequestInThreshold.htm",function(txtThresholdSrAmount){
                            $.post("countOverDueServiceRequest.htm",function(txtOverDueSrAmount){
                                $.post("countEmpLocationLost.htm",function(txtEmpLostLocAmount){
                                    var srAmount = parseInt(txtsrAmount);
                                    var actAmount =  parseInt(txtactAmount);
                                    var thresholdSrAmount = parseInt(txtThresholdSrAmount);
                                    var overDueSrAmount = parseInt(txtOverDueSrAmount);
                                    var emplostLocAmount = parseInt(txtEmpLostLocAmount);

                                    var totalTask = srAmount+actAmount+thresholdSrAmount+overDueSrAmount+emplostLocAmount;
                                    $("#task-message").html(totalTask);
                                    $("#task-badge").html(totalTask);

                                    try {

                                        if (totalTask > 0) {
                                            var srPercentage = (srAmount / totalTask) * 100;
                                            srPercentage = Math.round(srPercentage);
                                            var actPercentage = (actAmount / totalTask) * 100;
                                            actPercentage = Math.round(actPercentage);
                                            var thresholdSrPercentage = (thresholdSrAmount / totalTask) * 100;
                                            thresholdSrPercentage = Math.round(thresholdSrPercentage);
                                            var overDueSrPercentage = (overDueSrAmount / totalTask) * 100;
                                            overDueSrPercentage = Math.round(overDueSrPercentage);
                                            var lostEmpSignalPercentage = (emplostLocAmount / totalTask) * 100;
                                            lostEmpSignalPercentage = Math.round(lostEmpSignalPercentage);

                                            $('#activityProgress').css('width', actPercentage+'%');
                                            $('#activityProgress').attr('aria-valuenow', actPercentage);
                                            $('#srProgress').css('width',srPercentage+'%');
                                            $('#srProgress').attr('aria-valuenow', srPercentage);
                                            $('#thresholdSrProgress').css('width', thresholdSrPercentage+'%');
                                            $('#thresholdSrProgress').attr('aria-valuenow', thresholdSrPercentage);
                                            $('#overDueSrProgress').css('width', overDueSrPercentage+'%');
                                            $('#overDueSrProgress').attr('aria-valuenow', overDueSrPercentage);
                                            $('#emplostProgress').css('width', lostEmpSignalPercentage+'%');
                                            $('#emplostProgress').attr('aria-valuenow', lostEmpSignalPercentage);

                                        }
                                    } catch (error) {
                                        console.log('Cannot calculate percentage : ' + error);
                                    }
                                });
                            });
                        });
                    });
                });*/

        //@sandar
        $.post("countDoctorRequestTask.htm", function(txtdoctorCount){
            var doctorCount = parseInt(txtdoctorCount);
            $("#task-message").html(doctorCount);
            $("#task-badge").html(doctorCount);

            try{

                if( doctorCount > 0 ){
                    var doctorPercentage = (doctorCount/100) * 100;
                    doctorPercentage = Math.round(doctorPercentage);

                    $('#doctorProgress').css('width', doctorPercentage+'%');
                }

            }catch(error){
                console.log('cannot calculate percentage : ' + error);
            }
        });

    } catch (err) {
        console.log(err);
        $("#task-badge").html(0);
    }

}

function reloadNewSampleRequest() {


    try {

        //Count New Sample Request
        $.post("countNewSampleRequest.htm", function(txtnewSampleCount){

            var newSampleCount = parseInt(txtnewSampleCount);
            $("#sample-message").html(newSampleCount);
            $("#sample-badge").html(newSampleCount);

            try{

                if( newSampleCount > 0 ){
                    var newSamplePercentage = (newSampleCount/100) * 100;
                    newSamplePercentage = Math.round(newSamplePercentage);

                    $('#newSampleProgress').css('width', newSamplePercentage+'%');
                }

            }catch(error){
                console.log('cannot calculate percentage : ' + error);
            }
        });

    } catch (err) {
        console.log(err);
        $("#sample-badge").html(0);
    }

}

function reloadCompletedSampleRequest(){
    $.ajax({
        type: "POST",
        url: CONTEXT_PATH+'/getCompletedSampleRequest.htm',
        cache: false,
        dataType:"json",
        async: false,
        cache: false,
        success: function(json){
            if (json != null) {
                console.log("json size:"+json.length);
                if(json.length>0){
                    $("#requester-badge").text(json.length);
                    $("#requester-badge").show();
                    //$("#countChatMsgNumber").html(json.length);

                    $("#requesterboxList").html("");
                    for(var i=0;json.length>i;i++){

                        $("#requesterboxList").append('<li><a href="/BSCRM/spRequestEditDetail.htm?id='+json[i].requestId + '&fromURL=noti">' +
                            '<span class="subject">' +
                            '<span class="from">Your Request ' +
                            json[i].requestId +
                            '</span>' +

                            '</span>' +
                            '<span class="message"> is ' +
                            json[i].reqStatus +
                            '</span>' +
                            '</a></li>');
                    }
                } else {
                    $("#requesterboxList").html("");
                    //$("#countChatMsgNumber").html("");
                }
            }  else {
                $("#requesterboxList").html("");
                //$("#countChatMsgNumber").html("");
            }
        },
        error : function() {
            console.log("Chat Msg Noti ERROR!!!");
        }

    });
}

/**
 * Description 	: Message Broadcast Interval
 * @param	:
 * @returns		:
 * @author		: Chaiwat
 */
//function messageBroadcastInterval(){
//	setInterval(function() {
//
//		$.ajax({
//		type: "POST",
//		url: CONTEXT_PATH+'/checkMessage.htm',
//		cache: false,
//		dataType:"json",
//		async: false,
//		success: function(json){
//			if (json != null) {
//				console.log(json);
//				console.log("json size:"+json.length);
//
//                for(var i=0;json.length>i;i++){
//                	var jobj = json[i];
//                	console.log("jobj.messageCode:"+jobj.messageCode);
//                	console.log("jobj.messageDesc:"+jobj.messageDesc);
////					setTimeout(function () {
//		                var unique_id = $.gritter.add({
//		                    // (string | mandatory) the heading of the notification
//		                    title: jobj.messageCode,
//		                    // (string | mandatory) the text inside the notification
//		                    text: jobj.messageDesc,
//		                    // (string | optional) the image to display on the left
//		                    image: './assets/img/locus_2.png',
//		                    // (bool | optional) if you want it to fade out on its own or just sit there
//		                    sticky: true,
//		                    // (int | optional) the time you want it to be alive for before fading out
//		                    time: '',
//		                    // (string | optional) the class name you want to apply to that specific message
//		                    class_name: 'my-sticky-class'
//		                });
//
//		                // You can have it return a unique id, this can be used to manually remove it later using
//		                setTimeout(function () {
//		                    $.gritter.remove(unique_id, {
//		                        fade: true,
//		                        speed: 'slow'
//		                    });
//		                }, 10000);
////		            }, 3000);
//
//                }
//			}
//		},error : function() {
//			//result = false;
//		}
//	});
//	}, 15000);
//
//}

/**
 * Description 	:
 * @param		:
 * @returns		:
 * @author		:
 */
//function alertMessage(messageTitle,messageDesc){
//
//	bootbox.dialog({
//        message: messageDesc,
//        title: messageTitle,
//        buttons: {
//          main: {
//            label: "Close",
//            className: "blue",
//            callback: function() {
//              //alert("Primary button");
//            }
//          }
//        }
//    });
//
//}

/**
 * Description 	:
 * @param		:
 * @returns		:
 * @author		:
 */
function alertMessage(messageTitle,messageDesc,callback){

    if(messageDesc.indexOf('success')==-1 && messageDesc.indexOf('สำเร็จ')==-1 && messageDesc.indexOf('เรียบร้อย') == -1 ){

        var box = bootbox.dialog({
            message: messageDesc,
            title: messageTitle,
            show: false,
            buttons: {
                main: {
                    label: "Close",
                    className: "blue",
                    callback: function() {
                        //alert("Primary button");
                        var callbackFunction = window[callback];
                        if (typeof callbackFunction === "function") callbackFunction();

                    }
                }
            }
        });
        box.bind('shown.bs.modal', function(){
            box.find(".btn:last").focus();

        });
        box.modal("show");
        return box;

    }
}

///**
// * Description 	:
// * @param		:
// * @returns		:
// * @author		:
// */
//function alertConfirm(messageConfirm){
//
//	bootbox.confirm(messageConfirm, function(result) {
//		return result;
//    });
//
//}
//
///**
// * Description 	:
// * @param		:
// * @returns		:
// * @author		:
// */
//function alertConfirm(messageConfirm,callback){
//
//	bootbox.confirm(messageConfirm, function(result) {
//		if(result){
//			var callbackFunction = window[callback];
//			if (typeof callbackFunction === "function") callbackFunction();
//		}
//    });
//}

/**
 * Description 	:
 * @param		:
 * @returns		:
 * @author		:
 */
function alertConfirm(messageConfirm,callback,param){

    /*bootbox.confirm(messageConfirm, function(result) {
        if(result){
            var callbackFunction = window[callback];
            if (typeof callbackFunction === "function") callbackFunction(param);
        }
    });*/

    var box = bootbox.dialog({
        message: messageConfirm,
        title: confirmation_title,
        closeButton: true,
        show: false,
        buttons: {
            success: {
                label: "Confirm",
                className: "btn-success",
                callback: function() {
                    var callbackFunction = window[callback];
                    if (typeof callbackFunction === "function") callbackFunction(param);
                }
            },
            "Close": {
                className: "",
                callback: function() {}
            }
        }
    });
    box.bind('shown.bs.modal', function(){
        box.find(".btn:last").focus();
    });

    box.modal("show");
}


/**
 * Description 	: must be use when ajax error.
 A function to be called if the request fails.
 The function receives three arguments: The jqXHR (XMLHttpRequest) object,
 a string describing the type of error that occurred and an optional exception object, if one occurred.
 Possible values for the second argument (besides null) are "timeout", "error", "abort", and "parsererror".
 When an HTTP error occurs, errorThrown receives the textual portion of the HTTP status, such as "Not Found" or "Internal Server Error."
 * @param		:
 * @returns		: Error Message
 * @author		: Mr.BoonOOm
 */
function checkShowMsgAjaxError(xhr, textStatus, errorThrown){

    if (xhr.status == 0) {

    } else if(xhr.status == 404){
        alert("404 Not found error occurred");
    } else if(xhr.status == 500) {
        alert("500 A server error occurred");
    }else if(textStatus === 'timeout'){
        alert("Request Timeout");
    }else if(textStatus === 'abort'){
        alert("Ajax request aborted.");
    }else if (textStatus === 'parsererror') {
        alert("Requested JSON parse failed.");
    }else if(xhr.status == 401) {
        alert(" You're not authorized to do this action.");
    }else {
        //alert("Uncaught Error." + xhr.responseText);
    }

    return false;
}

/**
 * Description 	:
 * @param		:
 * @returns		:
 * @author		:
 */
function timestamp2datetime(ts) {
    if(ts == "" || ts == null) {
        return;
    }

    var d = new Date(ts);
    var day = d.getDate();
    var month = d.getMonth() + 1;
    var year = d.getFullYear();

    if (day < 10) {
        day = "0" + day;
    }

    if (month < 10) {
        month = "0" + month;
    }

    var hours = d.getHours();
    var minutes = d.getMinutes();

    if (hours < 10) {
        hours = "0"+hours;
    }

    if(minutes<10){
        minutes = "0"+minutes;
    }

    var date = day + "/" + month + "/" + year;
    var time = hours+":"+minutes;

    return date+" "+time;
}

/**
 * Description 	:
 * @param		:
 * @returns		:
 * @author		:
 */
function timestamp2date(ts) {
    if(ts == "" || ts == null) {
        return;
    }

    var d = new Date(ts);
    var day = d.getDate();
    var month = d.getMonth() + 1;
    var year = d.getFullYear();

    if (day < 10) {
        day = "0" + day;
    }

    if (month < 10) {
        month = "0" + month;
    }
    var date = day + "/" + month + "/" + year;

    return date;
}

/**
 * Description 	:
 * @param		:
 * @returns		:
 * @author		:
 */
function timestamp2time(ts) {
    if(ts == "" || ts == null){
        return;
    }

    var d = new Date(ts);
    var hours = d.getHours();
    var minutes = d.getMinutes();

    if (hours < 10) {
        hours = "0"+hours;
    }

    if(minutes<10) {
        minutes = "0"+minutes;
    }

    return hours + ":" + minutes;
}

/**
 * Description 	: To select radio value of Keen theme radio
 * @param		: name property name
 * @param		: value of radio
 * @returns		: None
 * @author		: Poobase
 */
function setRadioValue(name,value){
    $("input[name="+name+"]").prop('checked', false);
    $("input[name="+name+"][value=" + value + "]").attr('checked', 'checked');
    $("input[name="+name+"]").parent().removeClass("checked");
    $("input[name="+name+"][value=" + value + "]").parent().addClass("checked");
}

/**
 * Description 	: To change all component in form to readonly mode.
 * @param		: formId - form id.
 * @returns		: None
 * @author		: Auttapol Pipatpatama
 */
function changeToReadOnly(formId) {
    $('#' + formId + ' input[type="text"]').replaceWith( function() {
        return "<label>" + $( this ).val() + "</label>";
    });

    $('#' + formId + ' textarea').replaceWith( function() {
        return "<label>" + $( this ).val() + "</label>";
    });

    $('#' + formId + ' input[type="radio"]').attr('disabled', 'disabled');
    $('#' + formId + ' input[type="checkbox"]').attr('disabled', 'disabled');
    $('#' + formId + ' input[type="button"]').attr('disabled', 'disabled');
    $('#' + formId + ' button').attr('disabled', 'disabled');
    $('#' + formId + ' select').attr('disabled', 'disabled');

    // Only button id equal backBtn is active
    $('#backBtn').removeAttr('disabled', '');

    // Control buuton by roleAction
    //$('button[roleAction="add"]').attr('disabled', 'disabled');

    $("a").removeAttr("href");
    $("a").unbind();
}

/**
 * Description 	: To convert date object to String with format DD/MM/YYYY
 * @param		: dateInput - date object.
 * @returns		: Date text.
 * @author		: Auttapol Pipatpatama
 */
function formatDateDDMMYYYY(dateInput) {
    var currDate = padZeroTime( dateInput.getDate() );
    var currMonth = padZeroTime( dateInput.getMonth() + 1 ); //Months are zero based
    var currYear = dateInput.getFullYear();

    return (currDate + "/" + currMonth + "/" + currYear);
}

/**
 * Description 	: To convert date object to String with format YYYY-MM-dd
 * @param		: dateInput - date object.
 * @returns		: Date text.
 * @author		: Htet
 */
function formatDateYYYYMMDD(dateInput) {
    var currDate = padZeroTime( dateInput.getDate() );
    var currMonth = padZeroTime( dateInput.getMonth() + 1 ); //Months are zero based
    var currYear = dateInput.getFullYear();

    return (currYear + "-" + currMonth + "-" + currDate);
}

/**
 * Description 	: To convert date object to String with format DD/MM/YYYY hh:mm:ss
 * @param		: dateInput - date object.
 * @returns		: Date text.
 * @author		: Auttapol Pipatpatama
 */
function formatDateDDMMYYYYWithTime(dateInput) {
    var dateOut = formatDateDDMMYYYY(dateInput);

    var timeSec = padZeroTime( dateInput.getSeconds() );
    var timeMin = padZeroTime( dateInput.getMinutes() );
    var timeHour = padZeroTime( dateInput.getHours() );

    var timeOut = timeHour + ":" + timeMin + ":" + timeSec;
    return dateOut + ' ' + timeOut;
}

/**
 * Description 	: To pad zero when value less than 10 (2 digits)
 * @param		: text
 * @returns		: 2 digit text
 * @author		: Auttapol Pipatpatama
 */
function padZeroTime(input) {
    if (input < 10) {
        return "0" + input;
    } else {
        return input;
    }
}

/**
 * Example.
 *  var compArr = ["txt_sr_subject","cmb_sr_type","btn_srSave","button_asset"];
 *	setComponentDisableById(compArr,false);
 * @param comObject is Array Type
 * @param logic  is Boolean( Disable=true ,Enable=false)
 * @author Mr.BoonOom
 */
function setComponentDisableById(comArrObject,logic) {

    // Disable=true ,Enable=false
    for(var i = 0; i < comArrObject.length; i++){
        $('#'+comArrObject[i]).prop("disabled",logic);
    }

}

/**
 *
 * @param objId formId ('#formId')
 * @param flag  logic true or false ,Disable=true ,Enable=false
 * @author Mr.BoonOom
 */
function disableEnableForm(formId,flag){

    $("#"+formId.attr("id")+" input[type='text']").prop("disabled",flag);
    $("#"+formId.attr("id")+" select").prop("disabled",flag);
    $("#"+formId.attr("id")+" .input-group-btn button").prop("disabled",flag);

    $("#"+formId.attr("id")+" textarea").prop("disabled",flag);
    $("#"+formId.attr("id")+" input[type='tel']").prop("disabled",flag);
    $("#"+formId.attr("id")+" input[type='email']").prop("disabled",flag);
    $("#"+formId.attr("id")+" button").prop("disabled",flag);
    $("#"+formId.attr("id")+" input[type='radio']").prop("disabled",flag);
    $("#"+formId.attr("id")+" input[type='checkbox']").prop("disabled",flag);
}



/**
 * for load code type and default value
 * @param objectComboId
 * @param codetype
 * @param defaultValueJsp
 * @param caption
 * @author Mr.BoonOom
 */
function getCodeBookComboByCodeTypeDefaultVal(objectComboId,codetype,defaultValueJsp,caption){

    var codetypeParam= codetype.trim();
    var strCaption = (caption != null)? caption.trim() :  "";
    var defaultCombo = null;

    //jLoBlockUI();

    console.log("codetype"+codetypeParam);
    $.getJSON("getCodeBookByCodeType.htm?codetype="+codetypeParam,function(data){

        var listItems= "";

        listItems+= "<option></option>";

        if(strCaption.length > 0){
            listItems+= "<option value=''> "+ strCaption +" </option>";
        }

        for(var i = 0; i < data.length; i++){

            listItems += "<option value='" + data[i].value + "'>" + data[i].label + "</option>";

            // Set Default first
            if(i == 0){
                if(strCaption.length > 0){
                    defaultCombo = '';
                }else{
                    //defaultCombo = data[i].value;
                }

            }
        }

        objectComboId.html(listItems);

        if(defaultValueJsp.length > 0){
            defaultCombo = defaultValueJsp;
        }

        objectComboId.select2("val",defaultCombo);

    }).error(function(xhr, textStatus, errorThrown) {

        checkShowMsgAjaxError(xhr, textStatus, errorThrown);

    });




}

/**
 * for load codebook children type reference parent type and parent id
 * and defualt value
 * @param objectComboId
 * @param parentCodeType
 * @param id
 * @param defaultValueJsp
 * @param caption
 * @author Mr.BoonOom
 */
function getCodeBookByParentTypeAndParentIdDefaultVal(objectComboId,parentCodeType,codeType,id,defaultValueJsp,caption){

    var parentCodeTypeParam =parentCodeType.trim();
    var parentIdParam= (id != null)? id.trim() : "";
    var strCaption = (caption != null)? caption.trim() :  "";
    var defaultCombo = null;

    //jLoBlockUI();
    console.log("parentCodeTypeParam"+parentCodeTypeParam);

    $.getJSON("getCodeBookByParentTypeAndParentId.htm?parentCodeType="+parentCodeTypeParam+"&codeType="+codeType+"&id="+parentIdParam,function(data){
        var listItems= "";
        listItems+= "<option></option>";

        if(strCaption.length > 0){
            listItems+= "<option value=''> "+ strCaption +" </option>";
        }

        for(var i = 0; i < data.length; i++){
            listItems += "<option value='" + data[i].value + "'>" + data[i].label + "</option>";

            // Set Default first
            if(i == 0){
                if(strCaption.length > 0){
                    defaultCombo = '';
                }else{
                    defaultCombo = data[i].value;
                }

            }

        }

        objectComboId.html(listItems);

        if(defaultValueJsp.length > 0){
            defaultCombo = defaultValueJsp;
        }

        objectComboId.select2("val",defaultCombo);


    }).error(function(xhr, textStatus, errorThrown) {

        checkShowMsgAjaxError(xhr, textStatus, errorThrown);

    });

}

/**
 * Exam. serviceRequestDetailMain.jsp
 * @param objectComboId Exam > $("#comboId")
 * @param codetype      Exam > SRQ_TYPE
 * @param caption		Exam > Please Select etc.ฯลฯ
 * @author Mr.BoonOom
 *
 */
function getCodeBookComboByCodeType(objectComboId,codetype,caption){

    var codetypeParam= codetype.trim();
    var strCaption = (caption != null)? caption.trim() :  "";
    var defaultCombo = null;

    //jLoBlockUI();
    console.log("codetype"+codetypeParam);

    $.getJSON("getCodeBookByCodeType.htm?codetype="+codetypeParam,function(data){

        var listItems= "";

        listItems+= "<option></option>";

        if(strCaption.length > 0){
            listItems+= "<option value=''> "+ strCaption +" </option>";
        }

        for(var i = 0; i < data.length; i++){
            listItems += "<option value='" + data[i].value + "'>" + data[i].label + "</option>";

            // Set Default first
            if(i == 0){
                if(strCaption.length > 0){
                    defaultCombo = '';
                }else{
                    defaultCombo = data[i].value;
                }

            }
        }

        objectComboId.html(listItems);
        objectComboId.select2("val",defaultCombo);

    }).error(function(xhr, textStatus, errorThrown) {

        checkShowMsgAjaxError(xhr, textStatus, errorThrown);

    });

}

/**
 * Exam. serviceRequestDetailMain.jsp
 * @param objectComboId Exam > $("#comboId")
 * @param parentCodeType Exam > i.e. SRQ_TYPE
 * @param id  is parentId
 * @param caption
 * @author Mr.BoonOom
 */
function getCodeBookByParentTypeAndParentId(objectComboId,parentCodeType,codeType,id,caption){

    var parentCodeTypeParam = parentCodeType.trim();
    var parentIdParam= (id != null) ? id.trim(): "";
    var strCaption = (caption != null)? caption.trim() :  "";
    var defaultCombo = null;

    //jLoBlockUI();
    console.log("parentCodeType"+parentCodeType);

    $.getJSON("getCodeBookByParentTypeAndParentId.htm?parentCodeType="+parentCodeTypeParam+"&codeType="+codeType+"&id="+parentIdParam,function(data){
        var listItems= "";

        listItems+= "<option></option>";

        if(strCaption.length > 0){
            listItems+= "<option value=''> "+ strCaption +" </option>";
        }

        for(var i = 0; i < data.length; i++){
            listItems += "<option value='" + data[i].value + "'>" + data[i].label + "</option>";

            // Set Default first
            if(i == 0){
                if(strCaption.length > 0){
                    defaultCombo = caption;
                }else{
                    defaultCombo = data[i].value;
                }

            }

        }

        objectComboId.html(listItems);
        objectComboId.select2("val",defaultCombo);

    }).error(function(xhr, textStatus, errorThrown) {

        checkShowMsgAjaxError(xhr, textStatus, errorThrown);

    });

}

/**
 * for redirect page
 * @param strUrlAndParam
 * @returns {Boolean}, page
 * @author Mr.BoonOom
 */
function redirectUrlAction(strUrlAndParam){
    if(!empty(strUrlAndParam)){
        window.location.href=strUrlAndParam;
    }else{
        return false;
    }

}


/***
 * Exam. serviceRequestDetailMain.jsp
 * @param divObj  componentObjectId('#div_render')
 * @param urlAction   Url for Action
 * @param pageModalName  jsp page for display on the div_render
 * @param headerCaption   Caption for display on modal
 * @param callbackfnMainPage call backFunction
 * @author Mr.BoonOom
 */
function loadContentIntoModal(divObj,urlAction,pageModalName,headerCaption,callbackfnMainPage){

    var url = urlAction+"?pageModalName="+pageModalName+"&modalHeaderCode="+headerCaption+"&callbackfn="+callbackfnMainPage;

    divObj.html("");

    divObj.load(url,  function( response, status, xhr ) {

        if(status == "error"){
            checkShowMsgAjaxError(xhr, xhr.statusText, response);
        }

    });

}

/**
 *
 * @param divObj
 * @param urlAction
 * @param pageModalName
 * @param headerCaption
 * @param callbackfnMainPage
 * @param strParam
 * @author Mr.BoonOom
 */
var sqlparam="";
function loadContentIntoModalWithParameter(divObj,urlAction,pageModalName,headerCaption,callbackfnMainPage,strParam,dialogName){

    sqlparam=strParam;
    //var url = urlAction+"?pageModalName="+pageModalName+"&modalHeaderCode="+headerCaption+"&callbackfn="+callbackfnMainPage+"&strParam="+strParam;
    divObj.html("");
    //alert("changed");
    divObj.load(urlAction,{pageModalName:pageModalName,modalHeaderCode:headerCaption,callbackfn:callbackfnMainPage,strParam:strParam,dialogName:dialogName}, function( response, status, xhr ) {
        //divObj.load(url,function( response, status, xhr ) {

        if(status == "error"){
            checkShowMsgAjaxError(xhr, xhr.statusText, response);
        }

    });

}


/***
 * Growl message
 * @param resultCode
 * @param resultDesc
 * @param timeout
 * @param onClose
 * @author Auttapol Pipatpatama
 */
$.growlCustomUI = function(resultCode , resultDesc, timeout, onClose) {
    var $m = $('<div class="growlUI"></div>');
    if (resultCode) $m.append('<h4>'+resultCode+'</h4>');
    if (resultDesc) $m.append('<h4>'+resultDesc+'</h4>');
    if (timeout === undefined) timeout = 3000;

    var backColor = '';
    if (resultCode == '0') {
        backColor = '#2473F7';
    } else {
        backColor = '#FF227E';
    }

    // Added by konapun: Set timeout to 30 seconds if this growl is moused over, like normal toast notifications
    var callBlock = function(opts) {
        opts = opts || {};

        $.blockUI({
            message: $m,
            fadeIn : typeof opts.fadeIn  !== 'undefined' ? opts.fadeIn  : 700,
            fadeOut: typeof opts.fadeOut !== 'undefined' ? opts.fadeOut : 1000,
            timeout: typeof opts.timeout !== 'undefined' ? opts.timeout : timeout,
            centerY: false,
            showOverlay: false,
            onUnblock: onClose,
            css: {
                width:		'350px',
                top:		'45px',
                left:		'',
                right:		'2px',
                border:		'none',
                padding:	'5px',
                opacity:	0.75,
                cursor:		'default',
                color:		'#fff',
                backgroundColor: backColor,
                '-webkit-border-radius':'10px',
                '-moz-border-radius':	'10px',
                'border-radius':		'10px'
            },
        });
    };

    callBlock();
    var nonmousedOpacity = $m.css('opacity');
    $m.mouseover(function() {
        callBlock({
            fadeIn: 0,
            timeout: 30000
        });

        var displayBlock = $('.blockMsg');
        displayBlock.stop();
        displayBlock.fadeTo(300, 1);
    }).mouseout(function() {
        $('.blockMsg').fadeOut(1000);
    });
};

/**
 * Create codebook select component from hidden field
 * @param obj input hidden object (required)
 * @param codeType (required)
 * @param initCaption
 * @author Auttapol Pipatpatama
 */
function getCodebookSel2DropdownByCodeType(obj, codeType, initCaption) {
    jLoBlockUI();

    var selectedValue = obj.val();
    //alert(selectedValue);
    $.getJSON("getCodebookCombo.htm?codeType=" + codeType, function(data) {
        if (typeof initCaption != 'undefined' && initCaption != '') {
            data.unshift( {id: '', text: initCaption} );
        }

        obj.select2({
            data: data,
            val: selectedValue,
        });

    });
}

/***
 * for set Screen by json from bean
 * @param formId
 * @param data
 * @author Mr.BoonOom
 */
function setFormScreenByModelBean(formId,data){

    var jsonData = data;

    for(var obj in jsonData){

        if(jsonData.hasOwnProperty(obj)){

            for(var prop in jsonData[obj]){

                if(jsonData[obj].hasOwnProperty(prop)){

                    var value = $.trim(jsonData[obj][prop]);
                    var isRadio = $("#"+formId+" input[name='"+prop+"']").is(":radio");
                    var isCheckbox = $("#"+formId+" input[name='"+prop+"']").is(":checkbox");

                    if(!isRadio && !isCheckbox){

                        $("#"+formId+" input[name='"+prop+"']").val(value);
                        $("#"+formId+" select[name='"+prop+"']").select2("val",value);
                        $("#"+formId+" textarea[name='"+prop+"']").val(value);
                    }


                    //console.log(prop + ":" + jsonData[obj][prop]);

                }
            }
        }
    }

}


/***
 * for set Screen by json ( 1 dimension)
 * Exam {"name":"apichat","lastName":true,"insertMode":false}
 * @param formId
 * @param dataIn is jsondata
 * @author Mr.BoonOom
 */
function setFormScreenOnSelectDatable(formId,dataIn){

    var jsonData = dataIn;

    //console.log(JSON.stringify(jsonData));

    for(var keyName in jsonData){

        if(jsonData.hasOwnProperty(keyName)){
            var value =   $.trim(jsonData[keyName]);

            var isRadio = $("#"+formId+" input[name='"+keyName+"']").is(":radio");
            var isCheckbox = $("#"+formId+" input[name='"+keyName+"']").is(":checkbox");

            if(!isRadio && !isCheckbox){
                $("#"+formId+" input[name='"+keyName+"']").val(value);
                $("#"+formId+" select[name='"+keyName+"']").select2("val",value);
                $("#"+formId+" textarea[name='"+keyName+"']").val(value);
            }

            //console.log(keyName+" : "+value);

        }
    }

}

/***
 * for set Screen by json from bean
 * @param formId
 * @param data
 * @author Poobase
 */
function setCheckbox(idname, flag){
    if(flag){
        $('#'+idname).parent().addClass("checked");
        $('#'+idname).attr("checked", "checked");
    }else{
        $('#'+idname).parent().removeClass("checked");
        $('#'+idname).removeAttr("checked");
    }
}


/***
 * for customize
 * behavior can not dblClick first time click row 1
 * @param objTable
 * @param columns
 * @param postUrl
 * @param param
 * @param totalRecordPerPage
 * @param isPaginate
 * @param showNumber
 * @param compArrDis
 * @param firstTime
 * @returns
 * @author Mr.BoonOom
 */
function ajaxDataTableSetCallback (objTable, columns, postUrl, param, totalRecordPerPage, isPaginate, showNumber,compArrDis,firstTime) {

    //jLoBlockUI();
    var recordPerPage = parseInt(totalRecordPerPage);

    return objTable.dataTable({
        "aoColumns": columns,
        "bFilter": false,
        "bLengthChange": false,
        "bDestroy": true,
        "bAutoWidth": false,
        "bPaginate": isPaginate,
        "bInfo": isPaginate,
        "bSort" : false,
        "deferLoading": 57,

        "bServerSide": true,
        "bProcessing": false,
        "sServerMethod": "POST",
        "iDisplayLength" : recordPerPage,
        "sAjaxSource": postUrl,
        "fnServerData": function(sSource, aoData, fnCallback) {
            pushParam2Json(aoData, param);
            $.post( sSource, aoData, function (json) {
                var totalRec = json.iTotalRecords;

                if(totalRec == 0){
                    setComponentDisableById(compArrDis,true);
                }

                fnCallback(json);

                var rowPerPage = objTable.fnGetData().length;
                if(firstTime){
                    if(curRowSelectedDt >= rowPerPage){
                        objTable.$("tr:eq("+(rowPerPage-1)+")" ).click();
                        objTable.$("tr:eq("+(rowPerPage-1)+")" ).addClass("selected");
                    }else{
                        objTable.$("tr:eq("+curRowSelectedDt+")" ).click();
                        objTable.$("tr:eq("+curRowSelectedDt+")" ).addClass("selected");

                    }
                }

            } );
        },
        "fnDrawCallback":reDrawSetClickCallback(showNumber,false,firstTime,objTable),
        "oLanguage": {  // language settings
            "sProcessing": LOADING_MSG,
        },
    });

}

/**
 *
 * @param showNumber
 * @param useDbClick
 * @param firstTime
 * @param objTable
 * @returns {Function}
 * @author Mr.BoonOom
 */
function reDrawSetClickCallback(showNumber, useDbClick,firstTime,objTable) {

    var objDtId="";
    if(!empty(objTable)){
        objDtId = objTable[0].id;
    }

    return function(oSettings) {
        if (showNumber) {
            for ( var i=0, iLen=oSettings.aiDisplay.length ; i<iLen ; i++ ) {
                $('td:eq(0)', oSettings.aoData[ oSettings.aiDisplay[i] ].nTr ).html( i+oSettings._iDisplayStart+1 );
            }
        }

        for ( var i=0, iLen=oSettings.aiDisplay.length ; i<iLen ; i++ ) {
            $(this).css('cursor', 'pointer');
        }

        if(!empty(objDtId)){

            $('#'+objDtId+' tbody tr').on("click", function () {
                curRowSelectedDt = $(this).index();

                onRowSelected($(this),objTable);
            } );
        }


        if (firstTime) {
            objTable.$('tr:first').click();
            firstTime = false;
        }

    };
}


/***
 * Like $.serialize but replace space with %20
 * @param form
 * @author Auttapol Pipatpatama
 */
function serialize(form) {
    if (!form || form.nodeName !== "FORM") {
        return;
    }
    var i, j, q = [];
    for (i = form.elements.length - 1; i >= 0; i = i - 1) {
        if (form.elements[i].name === "") {
            continue;
        }
        switch (form.elements[i].nodeName) {
            case 'INPUT':
                switch (form.elements[i].type) {
                    case 'text':
                    case 'hidden':
                    case 'password':
                    case 'button':
                    case 'reset':
                    case 'submit':
                        q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                        break;
                    case 'checkbox':
                    case 'radio':
                        if (form.elements[i].checked) {
                            q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                        }
                        break;
                    case 'file':
                        break;
                }
                break;
            case 'TEXTAREA':
                q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                break;
            case 'SELECT':
                switch (form.elements[i].type) {
                    case 'select-one':
                        q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                        break;
                    case 'select-multiple':
                        for (j = form.elements[i].options.length - 1; j >= 0; j = j - 1) {
                            if (form.elements[i].options[j].selected) {
                                q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].options[j].value));
                            }
                        }
                        break;
                }
                break;
            case 'BUTTON':
                switch (form.elements[i].type) {
                    case 'reset':
                    case 'submit':
                    case 'button':
                        q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                        break;
                }
                break;
        }
    }
    return q.join("&");
}

/***
 * for use enter keypresss
 * @param $
 * @author Mr.BoonOom
 */
(function($) {
    $.fn.onEnter = function(func) {
        this.bind('keypress', function(e) {
            if (e.keyCode == 13) func.apply(this, [e]);
        });
        return this;
    };
})(jQuery);

/**
 * For clear Form Screen
 * Exam.$('#formID').clearForm();
 * @author Mr.BoonOom
 */
$.fn.clearForm = function() {

    return this.each(function() {

        var type = this.type, tag = this.tagName.toLowerCase();
        if(tag == 'form'){
            return $(':input',this).clearForm();
        }


        if (type == 'text' || type == 'tel' || type == 'email' || type == 'file' || tag == 'textarea'){
            this.value = '';
        }else if (type == 'checkbox' || type == 'radio'){

            this.checked = false;

        }else if (tag == 'select'){

            $("#"+this.id).select2("val", "");
        }

    });
};

/**
 * Show text row details in tooltip on mouseover.
 * Exam.	dataTableOnMouseoverTooltips('datatableID');
 * @author Mr.BoonOom
 */
function dataTableOnMouseoverTooltips(dataTableId){

    $('#'+dataTableId+' tbody td').live('mouseover', function() {
        var sTitle;
        sTitle = $(this).text();
        this.setAttribute( 'title', sTitle );
    });
}

/**
 * for Call function in main Screen when Dblclick
 * @param jsonObj
 * @author Mr.BoonOom
 */
function setDataIntoComponent(funcCallMain,jsonObj){

    //console.log("JloCommon funcCallMain :"+funcCallMain);

    var strFun = funcCallMain;

    if(strFun != ""){
        var callbackfunction= window[strFun];

        callbackfunction.call(this, jsonObj);

        /*
        console.log("this "+this);
        console.log("callbackfunction "+callbackfunction);
        console.log("Pass call back function ");
        */
    }


}

/////////////add by pannei for carry two data

function setDataIntoComponentForTwoData(funcCallMain,jsonObj,Data){

    //console.log("JloCommon funcCallMain :"+funcCallMain);

    var strFun = funcCallMain;

    if(strFun != ""){
        var callbackfunction= window[strFun];

        callbackfunction.call(this, jsonObj,Data);

        /*
        console.log("this "+this);
        console.log("callbackfunction "+callbackfunction);
        console.log("Pass call back function ");
        */
    }


}
function setDataIntoComponentForThreeData(funcCallMain,jsonObj,Data1,Data2){

    //console.log("JloCommon funcCallMain :"+funcCallMain);

    var strFun = funcCallMain;

    if(strFun != ""){
        var callbackfunction= window[strFun];

        callbackfunction.call(this, jsonObj,Data1,Data2);

        /*
        console.log("this "+this);
        console.log("callbackfunction "+callbackfunction);
        console.log("Pass call back function ");
        */
    }


}

/**
 * Description 	:
 * @param		:
 * @returns		:
 * @author 		:
 */
function exportCSV(aData, ReportTitle, ShowLabel) {
    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object

    var JSONData = "["+JSON.stringify(aData)+"]";

    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;

    var CSV = '';
    //Set Report title in first row or line

    CSV += ReportTitle + '\r\n\n';

    //This condition will generate the Label/Header
    if (ShowLabel) {
        var row = "";

        //This loop will extract the label from 1st index of on array
        for (var index in arrData[0]) {

            //Now convert each value to string and comma-seprated
            row += index + ',';
        }

        row = row.slice(0, -1);

        //append Label row with line break
        CSV += row + '\r\n';
    }

    //1st loop is to extract each row
    for (var i = 0; i < arrData.length; i++) {
        var row = "";

        //2nd loop will extract each column and convert it in string comma-seprated
        for (var index in arrData[i]) {
            row += '"' + arrData[i][index] + '",';
        }

        row.slice(0, row.length - 1);

        //add a line break after each row
        CSV += row + '\r\n';
    }

    if (CSV == '') {
        //alert("Invalid data");
        return;
    }

    //Generate a file name
    var fileName = "MyReport_";
    //this will remove the blank-spaces from the title and replace it with an underscore
    fileName += ReportTitle.replace(/ /g,"_");

    //Initialize file format you want csv or xls
    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);

    // Now the little tricky part.
    // you can use either>> window.open(uri);
    // but this will not work in some browsers
    // or you will not get the correct file extension

    //this trick will generate a temp <a /> tag
    var link = document.createElement("a");
    link.href = uri;

    //set the visibility hidden so it will not effect on your web-layout
    link.style = "visibility:hidden";
    link.download = fileName + ".csv";

    //this part will append the anchor tag and remove it after automatic click
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

/**
 * Description 	: use for check Empty Values
 * @param		: data for check
 * @returns		: Boolean.
 * @author		: Mr.BoonOOm
 */
function empty(dataIn){

    var data = $.trim(dataIn);

    if(typeof(data) == 'number' || typeof(data) == 'boolean') {
        return false;
    }
    if(typeof(data) == 'undefined' || data === null) {
        return true;
    }

    if(typeof(data.length) != 'undefined') {
        return data.length == 0;
    }

    var count = 0;
    for(var i in data) {
        if(data.hasOwnProperty(i)) {
            count ++;
        }
    }

    return count == 0;
}

/***
 * for validate email format is valid
 * @param emailAddress
 * @returns boolean
 * @author Mr.BoonOom
 */
function isValidEmailAddress(emailAddress) {

    var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    var findIndex = emailAddress.indexOf(",");
    var valid = true;
    var emailArr;

    if(findIndex > -1){
        emailArr = emailAddress.split(',');

        for(var i = 0; i < emailArr.length; i++){

            valid = emailReg.test(emailArr[i]);
            console.log(i+": "+emailArr[i]+" is "+valid);

            if(!valid){

                return false;
            }


        }

    }else{

        valid = emailReg.test(emailAddress);
        console.log(emailAddress+" is "+valid);
    }

    if(valid) {
        return true;
    } else {
        return false;
    }
};



/**
 * For get province list into combobox
 * @param objectComboId
 * @param defaultValueJsp
 * @param caption
 * @author Mr.BoonOom
 */
function getProvinceListDefaultVal(objectComboId,defaultValueJsp,caption){

    var strCaption =  ( !empty(caption) ? caption : "");
    var defaultCombo = null;

    $.getJSON("getProvinceList.htm",function(data){

        var listItems= "";
        listItems+= "<option></option>";

        if(!empty(strCaption)){
            listItems+= "<option value=''> "+ strCaption +" </option>";
        }

        for(var i = 0; i < data.length; i++){
            listItems += "<option value='" + data[i].value + "'>" + data[i].label + "</option>";

            // Set Default first
            if(i == 0){
                if(!empty(strCaption)){
                    defaultCombo = '';
                }else{
                    //defaultCombo = data[i].value;
                }

            }
        }

        objectComboId.html(listItems);

        if(!empty(defaultValueJsp)){
            defaultCombo = defaultValueJsp;
        }

        objectComboId.select2("val",defaultCombo);

    }).error(function(xhr, textStatus, errorThrown) {

        checkShowMsgAjaxError(xhr, textStatus, errorThrown);

    });
}

/**
 * for load codebook children type reference parent type and parent id
 * and defualt value
 * @param objectComboId
 * @param parentCodeType
 * @param id
 * @param defaultValueJsp
 * @param caption
 * @author Mr.BoonOom
 */
function getAmpurByProvinceIdListDefaultVal(objectComboId,provinceId,defaultValueJsp,caption){

    var provinceIdParam= empty(provinceId) ?  "-1" : provinceId;
    var strCaption = empty(caption) ? "" :  caption.trim() ;
    var defaultCombo = null;

    $.getJSON("getAmpurByProvinceId.htm?provinceId="+provinceIdParam,function(data){
        var listItems= "";
        listItems+= "<option></option>";

        if(!empty(strCaption)){
            listItems+= "<option value=''> "+ strCaption +" </option>";
        }

        for(var i = 0; i < data.length; i++){
            listItems += "<option value='" + data[i].value + "'>" + data[i].label + "</option>";

            // Set Default first
            if(i == 0){
                if(!empty(strCaption)){
                    defaultCombo = '';
                }else{
                    defaultCombo = data[i].value;
                }

            }

        }

        objectComboId.html(listItems);

        if(!empty(defaultValueJsp)){
            defaultCombo = defaultValueJsp;
        }

        objectComboId.select2("val",defaultCombo);


    }).error(function(xhr, textStatus, errorThrown) {

        checkShowMsgAjaxError(xhr, textStatus, errorThrown);

    });

}

/**
 * Description 	: Format string to xxx-xxx-xxxx
 * @param		: Phone Number
 * @returns		: String.
 * @author		: Auttapol Pipatpatama
 */
function formatPhone(phoneNum) {
    return phoneNum.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
}


function onRowSelected(thisDt,objectDT) {

    if (thisDt.hasClass('selected')) {
        thisDt.removeClass('selected');
    }else {
        objectDT.$('tr.selected').removeClass('selected');
        thisDt.addClass('selected');
    }
}

/**
 * Description 	: Send url action
 * @param		: path
 * @param		: params (JSON)
 * @param		: method ('POST' or 'GET')
 * @author		: Auttapol Pipatpatama
 */
function sendUrl(path, params, method) {
    method = method || "post"; // Set method to post by default if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    if (typeof params !== 'undefined' && params.length > 0) {
        for (var i = 0 ; i< params.length; i++) {
            for(var key in params[i]) {
                console.log('key         : ' + key);
                console.log('params[key] : ' + params[i][key]);

                if(params[i].hasOwnProperty(key)) {
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", key);
                    hiddenField.setAttribute("value", params[i][key]);

                    form.appendChild(hiddenField);
                }
            }
        }
    }

    document.body.appendChild(form);
    form.submit();
}

/**
 * Description 	: Send url action
 * @param		: url
 * @author		: Auttapol Pipatpatama
 */
function postAction(url) {
    jLoBlockUI();
    var qPos = url.indexOf("?");
    var postUrl;
    if (qPos < 0) {
        postUrl = url;
    } else {
        postUrl = url.substring(0, qPos);
    }
    var jsonArr = [];

    if (qPos+1 < url.length) {
        var data = url.substring(qPos+1);
        var dataArray = data.split("&");

        $.each(dataArray, function(i, value) {
            var xx = value.split("=");
            var paramName = xx[0];
            var paramvalue = xx[1];
            var obj = {};

            obj[paramName] = paramvalue;
            jsonArr.push(obj);
        });
    }

    sendUrl(CONTEXT_PATH + postUrl, jsonArr, 'POST');
}

/***
 * for set currentPage data table
 * @param objectDT
 @author Mr.BoonOom
 */
function setPageChangeCurrent(objectDT){

    var startRecord = objectDT.fnSettings()._iDisplayStart;
    var lengthRecord = objectDT.fnSettings()._iDisplayLength;
    var currentPage = (startRecord/lengthRecord);
    objectDT.fnPageChange(currentPage,true);
}

/***
 * set clearValidateElement
 * @param element
 @author Preyanoot Kluisritrakul
 */
function clearValidate(element) {

    for(var i = 0; i < element.length; i++){
        $('#'+element[i]).closest('.form-group').removeClass('has-error');
        $('.help-block').hide();
    }
}

/**
 * Example.
 *  var compArr = ["txt_sr_subject","cmb_sr_type","btn_srSave","button_asset"];
 *	setComponentVisibleById(compArr,false);
 * @param comObject is Array Type
 * @param logic  is Boolean( show=true ,hide=false)
 * @author Mr.BoonOom
 */
function setComponentVisibleById(comArrObject,logic) {

    // Disable=true ,Enable=false
    for(var i = 0; i < comArrObject.length; i++){
        if(logic){
            $('#'+comArrObject[i]).show();
        }else{
            $('#'+comArrObject[i]).hide();
        }

    }

}

function setClassActiveTab(tabObjMain,liTabId,tabId,tabIndex){

    tabObjMain.tabs("option", "active", tabIndex);

    var liActive = $("#"+liTabId).hasClass("active");

    if(liActive){
        $("#"+liTabId).removeClass("active");
    }

    $("#"+liTabId).addClass("active");

    var active = $("#"+tabId).hasClass("active");
    var classIn = $("#"+tabId).hasClass("in");

    if(active && classIn){
        $("#"+tabId).removeClass("active");
        $("#"+tabId).removeClass("in");
    }

    $("#"+tabId).addClass("active");
    $("#"+tabId).addClass("in");

}

function alertConfirmYesNo(messageConfirm,callbackYes,callbackNo,param){

    var box = bootbox.dialog({
        message: messageConfirm,
        title: confirmation_title,
        closeButton: true,
        show: false,
        buttons: {
            success: {
                label: "Yes",
                className: "btn-success",
                callback: function() {
                    var callbackFunction = window[callbackYes];
                    if (typeof callbackFunction === "function") callbackFunction(param);
                }
            },
            "No": {
                className: "btn-fail",
                callback: function() {
                    var callbackFunction = window[callbackNo];
                    if (typeof callbackFunction === "function") callbackFunction(param);
                }
            }
        }
    });
    box.bind('shown.bs.modal', function(){
        box.find(".btn:last").focus();
    });

    box.modal("show");
}

/*BEGIN TEST SORTING Data table*/
function initajaxDataTable_sorting(objTable, columns) {

    return objTable.dataTable({
        "aoColumns": columns,
        "bFilter": false,
        "bLengthChange": false,
        "bDestroy": true,
        "bSort" : true,
        "bAutoWidth": false,
        "bPaginate": false,
        "bInfo": false,
        "deferLoading": 57,
        "oLanguage": {
            "sEmptyTable": datatable_emptyTable,
            "sInfo": datatable_pagedetailTable,
            "sInfoEmpty": datatable_emptyTable
        }
    });
}

function ajaxDataTable_sorting(objTable, columns, postUrl, param, totalRecordPerPage, isPaginate, showNumber) {

    var recordPerPage = parseInt(totalRecordPerPage);

    return objTable.dataTable({
        "aoColumns": columns,
        "bFilter": false,
        "bLengthChange": false,
        "bDestroy": true,
        "bAutoWidth": false,	 // Disable columns width calculation, it's faster and sometimes produce very tiny columns.
        "bPaginate": isPaginate,
        "bInfo": isPaginate,
        "bSort" : true,
        "deferLoading": 57,

        "bServerSide": true,
        "bProcessing": true,
        "sServerMethod": "POST",
        "iDisplayLength" : recordPerPage,
        "sAjaxSource": postUrl,
        "fnServerData": function(sSource, aoData, fnCallback) {
            pushParam2Json(aoData, param);

            $.post( sSource, aoData, function (json) {
                fnCallback(json);

                var rowPerPage = objTable.fnGetData().length;
                if(curRowSelectedDt >= rowPerPage){
                    objTable.$("tr:eq("+(rowPerPage-1)+")" ).click();
                    objTable.$("tr:eq("+(rowPerPage-1)+")" ).addClass("selected");
                }else{
                    objTable.$("tr:eq("+curRowSelectedDt+")" ).click();
                    objTable.$("tr:eq("+curRowSelectedDt+")" ).addClass("selected");
                }

            } );
        },
        "fnDrawCallback":reDrawCallback(showNumber, false,objTable),
        "oLanguage": {  // language settings
            "sProcessing": LOADING_MSG,
            "sEmptyTable": datatable_emptyTable,
            "sInfo": datatable_pagedetailTable,
            "sInfoEmpty": datatable_emptyTable
        },
    });
}



function sqlQuery(index)
{
    //alert("sqlQuery :"+sqlparam);
    orlist=[];
    betweenlist=[];
    andlist=[];
    startwithlist=[];
    inlist=[];
    for(var j=1;j<=index;j++)
    {

        var selectType=$("#searchType"+j).val();
        var anddata=$("#inputAndData"+j).val();
        if(selectType=='OR')
        {
            orlist.push($("#inputData"+j).val());
        }
        else if(selectType=='BETWEEN')
        {
            betweenlist.push($("#inputData"+j).val());
            andlist.push(anddata);
        }
        else if(selectType=='START WITH')
        {
            startwithlist.push($("#inputData"+j).val());
        }
        else if(selectType=='IN')
        {
            inlist.push($("#inputData"+j).val());
        }

    }
    var sql="";//\n AND (
    var orsize=orlist.length;
    var betweensize=betweenlist.length;
    var startwithsize=startwithlist.length;
    var insize=inlist.length;
    /*alert("ORS :"+orsize+"\n"+
            "BetweenS :"+betweensize+"\n"+
            "SWS :"+startwithsize+"\n"+
            "INS :"+insize+"\n");*/
    for(var k=0;k<orsize;k++)
    {
        sql+=" "+sqlparam+"*'"+orlist[k]+"' OR\n";
    }
    for(var k=0;k<betweensize;k++)
    {
        sql+=" "+sqlparam+" BETWEEN '"+betweenlist[k]+"' AND '"+andlist[k]+"' OR\n";
    }
    for(var k=0;k<startwithsize;k++)
    {
        sql+=" "+sqlparam+" LIKE '"+startwithlist[k]+"^' OR\n";
    }
    if(insize>0)
    {
        sql+=" "+sqlparam+" IN (";
        for(var k=0;k<insize;k++)
        {
            sql+="'"+inlist[k]+"',";
        }
        var index= sql.lastIndexOf(",");
        sql=sql.substring(0, index);
        sql+=") OR\n";
    }
    var index= sql.lastIndexOf(" ");
    sql=sql.substring(0, index);
    //sql+=")";
    //alert(sql);

    return sql;
}

/**
 * ChatMessage
 * Re-send Unsent Chat Messages at Project Starts
 * calls every ? minutes
 */
function resendChatMessages() {

    //alert("IN jlocommon.js resendChatMessages....");

    setInterval(function() {

        $.ajax({
            type: "POST",
            url: CONTEXT_PATH+'/resendUnsetMessages.htm',
            cache: false,
            dataType:"json",
            async: false,
            cache: false,
            success: function(json){
                if (json != null) {
                    console.log("json size:"+json.length);
                    //alert("Finished sending unsent messages! " + json.length);
                }
            },
            error : function() {
                console.log("Error in sending unsent messages!");
            }
        });

    }, 60000);
}

/**
 * Description 	: Chat Message
 * @param	:
 * @returns		:
 * @author		:
 */
function chatMessageNavInbox(){

    setInterval(function() {

        $.ajax({
            type: "POST",
            url: CONTEXT_PATH+'/getUnreadMsgList.htm',
            cache: false,
            dataType:"json",
            async: false,
            cache: false,
            success: function(json){
                if (json != null) {
                    console.log("json size:"+json.length);
                    if(json.length>0){
                        $("#chat-badge").text(json.length);
                        $("#chat-badge").show();
                        $("#countChatMsgNumber").html(json.length);

                        $("#chatboxList").html("");
                        for(var i=0;json.length>i;i++){

                            $("#chatboxList").append('<li><a href="/BSCRM/chatBoxFromNoti.htm?emp_id='+json[i].emp_id + '&emp_name='+json[i].emp_name + '&emp_device_id='+json[i].chat_msg_device_id + '">' +
                                '<span class="subject">' +
                                '<span class="from">' +
                                json[i].emp_name +
                                '</span>' +
                                '<span class="time">' +

                                '</span>' +
                                '</span>' +
                                '<span class="message">' +
                                json[i].chat_msg_content +
                                '</span>' +
                                '</a></li>');
                        }
                    } else {
                        $("#chatboxList").html("");
                        $("#countChatMsgNumber").html("");
                    }
                }  else {
                    $("#chatboxList").html("");
                    $("#countChatMsgNumber").html("");
                }
            },
            error : function() {
                console.log("Chat Msg Noti ERROR!!!");
            }

        });
        reloadTaskProgress();
        reloadNewSampleRequest();
        reloadCompletedSampleRequest();
    }, 5000);
}

function goToChatMessage(emp_id, emp_name) {

    /*$("#messageList").html("");
    $("chatEmp").html= emp_name;
    var urlSearchHistory = 'searchEmpChatHistory.htm';
    console.log("Jlocommon SearchHisURL - " + urlSearchHistory);
    getChatMessageHistory(emp_id, urlSearchHistory);*/
    var param = "emp_id="+emp_id+"&emp_name="+emp_name;
    $.ajax({
        timeout: AJAX_TIMEOUT,
        url : "/chatBox.htm",
        type: "GET",
        data: param,
        dataType: "json",
        success: function(data, textStatus, jqXHR){


        },error: function (xhr, textStatus, errorThrown) {

        }
    });
}
