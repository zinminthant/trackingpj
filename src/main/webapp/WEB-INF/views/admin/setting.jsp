<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>121</title>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="/assets/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/modules/fontawesome/css/all.min.css">

    <!-- CSS Libraries -->

    <!-- Template CSS -->
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/components.css">
    <link rel="stylesheet" href="/assets/modules/datatables/datatables.min.css">
    <link rel="stylesheet" href="/assets/modules/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" crossorigin="anonymous">

</head>

<body>
<div id="app">
    <div class="main-wrapper main-wrapper-1">
        <div class="navbar-bg"></div>
        <%@include file="/WEB-INF/views/admin/navbar.jsp"%>
        <div class="main-sidebar sidebar-style-2">
            <aside id="sidebar-wrapper">
                <div class="sidebar-brand">
                    <a href="index.html"><img src="/assets/img/onetwoone.png" width="170px"> </a>
                </div>
                <div class="sidebar-brand sidebar-brand-sm">
                    <a href="index.html">OT</a>
                </div>
                <div style="height: 70px"></div>
                <ul class="sidebar-menu">
                    <li class="menu-header">Order</li>
                    <li>
                        <a href="${pageContext.request.contextPath}/main" class="nav-link" ><i class="fa fa-shopping-bag"></i>
                            <span>Order List</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/createorder" class="nav-link" ><i class="fa fa-shopping-bag"></i><span>Create Order</span></a>
                    </li>

                    <li class="menu-header">Customer</li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/customers" class="nav-link" ><i class="fas fa-user"></i><span>Customer List</span></a>
                    </li>

                    <li class="menu-header">Setting</li>

                    <li class="active">
                        <a href="${pageContext.request.contextPath}/admin/setting" class="nav-link" ><i class="fas fa-file-code"></i>

                            <span>Code</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/message" class="nav-link" ><i class="fas fa-comment-alt"></i>
                            <span>Message</span></a>
                    </li>




                </ul>
            </aside>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <section id="list_view" class="section">
                <div class="section-header">
                    <h1>Setting</h1>
                    <div class="section-header-breadcrumb">
                        <div class="breadcrumb-item active"><a href="#">Order</a></div>
                        <div class="breadcrumb-item"><a href="#">List</a></div>

                    </div>
                </div>

                <div class="section-body">


                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-6">




                            <div id="list" >
                                <div class="row" style="float: right;padding-right:50px;">

                                    <button type="button" class="btn btn-icon icon-left btn-outline-dark" onclick="addFunction()"><i class="fa fa-plus" aria-hidden="true"></i></button>
                                </div>
                                <div class="row-fluid">
                                    <div class="col-md-7" >
                                        <div class="row">

                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3" style="color:#000000">Type</label>
                                            <div class="col-sm-12 col-md-7">
                                                <select class="form-control">
                                                    <option value="" selected>ALL</option>
                                                 <c:forEach items="${list}" var="code">
                                                     <option value="${code}">${code}</option>
                                                 </c:forEach>
                                                </select>
                                            </div>
                                        </div>


                                    </div>


                                </div>

                                <div style="height: 20px"></div>




                                <div  class="card-body">

                                    <div class="table-responsive table-striped">
                                        <table class="table" id="resultTableId">

                                        </table>
                                    </div>
                                    <div style="height: 50px;"></div>
                                </div>
                            </div>


                        </div>
                        <div class="col-12 col-md-6 col-lg-6">
                            <div class="card" style=" box-shadow: 0 5px 9px 0 rgba(0,0,0,0.2);">
                                <form:form id="saveForm" action="${pageContext.request.contextPath}/admin/saveCode" modelAttribute="code" method="post">

                                    <form:hidden path="id" id="id" />
                                    <div class="card-header">
                                        <h4>Code Detail</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Code Type</label>
                                            <form:select path="codeType" id="code_type" disabled="true" cssClass="form-control">
                                                <c:forEach items="${list}" var="item">
                                                    <option value="${item}">${item}</option>
                                                </c:forEach>
                                            </form:select>

                                        </div>
                                        <div class="form-group">
                                            <label>Code ID</label>
                                            <form:input path="codeID" id="code_id" cssClass="form-control" />

                                        </div>
                                        <div class="form-group">
                                            <label>Code Name</label>

                                            <form:input path="codeName" id="code_name" cssClass="form-control" required=""/>
                                      </div>

                                        <div class="des_div">
                                        <div class="form-group">
                                            <label>Code Descriptioon</label>
                                            <form:input path="descriptioon" id="code_description" cssClass="form-control"/>

                                        </div>
                                        </div>

                                    </div>
                                    <div class="card-footer text-right">
                                        <button type="button" class="btn btn-outline-dark" onclick="saveCode()" >Save</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>


                </div>
            </section>
        </div>
        <footer class="main-footer">
            <div class="footer-left">
                Copyright &copy; 2018 <div class="bullet"></div> Design By <a href="https://nauval.in/">zxc</a>
            </div>
            <div class="footer-right">

            </div>
        </footer>
    </div>
</div>

<!-- General JS Scripts -->
<script src="/assets/modules/jquery.min.js"></script>
<script src="/assets/modules/popper.js"></script>
<script src="/assets/modules/tooltip.js"></script>
<script src="/assets/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
<script src="/assets/modules/moment.min.js"></script>
<script src="/assets/js/stisla.js"></script>

<!-- JS Libraies -->
<script src="/assets/modules/jquery-ui/jquery-ui.min.js"></script>

<!-- Page Specific JS File -->
<script src="/assets/js/page/components-table.js"></script>

<!-- Template JS File -->
<script src="/assets/js/scripts.js"></script>
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/util.js"></script>
<script src="/assets/modules/datatables/datatables.min.js"></script>
</body>
<script>
    var contextPath='${pageContext.request.contextPath}';



    var oTable ;
    var columns = [

        { "sTitle": "Code Type", "mData": "codeType" }
        ,{ "sTitle": "Code ID", "mData": "codeID" }
        ,{ "sTitle": "Code Name", "mData": "codeName" }
        ,{   "sTitle":"Action",
            "sClass": "text-center",
            "mData": null,
            "bSortable": false,
            "mRender": function(data) {
                return '<a href="#" onclick="funtion()" class="btn btn-icon icon-left btn-outline-danger"><i class="fa fa-trash"></i>&nbsp;Delete</a>';
            }
        }];

    $(document).ready(function () {


        orderList();



        $('#resultTableId tbody').on( 'click', 'tr', function () {
            var dat=$("#resultTableId").DataTable().row( this ).data();
            console.log(dat);

            $("#id").val(dat.id);

            $("#code_type").val(dat.codeType);
            $("#code_id").val(dat.codeID);
            $("#code_name").val(dat.codeName);
            $("#code_description").val(dat.descriptioon);

        } );






    });



    function orderList(){

        var obj='';


        oTable = ajaxDataTable($('#resultTableId'), columns, '/rest/admin/codes',obj, 5, true, true);


    }






function saveCode() {
        console.log($("#code_type").val());
        console.log($("#saveForm").serialize());
    $.ajax({
        url: '${pageContext.request.contextPath}/rest/admin/saveCode',
        type: 'POST',
        data: $("#saveForm").serialize()+'&codeType='+$("#code_type").val() ,
        dataType:'json',
        success: function (response) {
           orderList();
        },
        error: function () {
            alert("error");
        }
    });

}

    function addFunction(){
        $('#saveForm')[0].reset();

        $("#id").val(0);

        $("#des_div").hide();

    }



</script>
</html>