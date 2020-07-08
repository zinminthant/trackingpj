<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/admin/customers" class="nav-link" ><i class="fas fa-user"></i><span>Customer List</span></a>
                    </li>

                    <li class="menu-header">Setting</li>

                    <li>
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
                    <h1>Customer</h1>
                    <div class="section-header-breadcrumb">
                        <div class="breadcrumb-item active"><a href="#">Customer</a></div>
                        <div class="breadcrumb-item"><a href="#">List</a></div>

                    </div>
                </div>

                <div class="section-body">


                    <div class="row">
                        <div class="col-12">



                            <div id="list" class="card" style=" box-shadow: 0 5px 9px 0 rgba(0,0,0,0.2);">

                                <div style="height: 20px"></div>
                                <form id="search_form">
                                    <div class="row">
                                        <div class="col-md-4" >



                                        </div>
                                        <div class="col-md-4" >
                                            <div class="row">

                                                <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3" style="color:#000000">Customer</label>
                                                <div class="col-sm-12 col-md-7">
                                                    <input type="text" name="search_name" id="search_customer" class="form-control" >
                                                    <span id="customerHelp" style="font-size: small;color: #6777ef"></span>
                                                </div>
                                            </div>


                                        </div>

                                        <div class="col-md-4" >
                                            <div class="row">

                                                <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3" style="color:#000000">Region</label>
                                                <div class="col-sm-12 col-md-7">
                                                    <select name="search_region" id="search_regioon" class="form-control">
                                                        <option value="">All</option>
                                                        <c:forEach items="${codes}" var="code">
                                                            <option value="${code.codeID}">${code.codeName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>


                                        </div>




                                    </div>
                                </form><div style="height: 20px"></div>


                                <div  class="card-body">

                                    <div class="table-responsive table-striped">
                                        <table class="table" id="resultTableId">

                                        </table>
                                    </div>
                                    <div style="height: 50px;"></div>
                                </div>
                            </div>

                            <div id="form" class="card card-secondary" style="display:none">
                                <div class="card-header">

                                </div>
                                <form id="merchant_form"  class="needs-validation"  accept-charset="utf-8">

                                    <div class="card-body">
                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Name</label>
                                            <div class="col-sm-12 col-md-7">
                                                <input type="text" id="name"  name="name" class="form-control" required>
                                                <span id="nameValid" style="color: red;font-size: small"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Phone</label>
                                            <div class="col-sm-12 col-md-7">
                                                <input type="text" id="phone" name="phone" class="form-control" required>
                                                <span id="phoneValid" style="color: red;font-size: small"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">E-mail</label>
                                            <div class="col-sm-12 col-md-7">
                                                <input type="email" id="email" name="email" class="form-control" required>
                                                <span id="emailValid" style="color: red;font-size: small"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Password</label>
                                            <div class="col-sm-12 col-md-7">
                                                <input type="text" id="password" name="password" class="form-control" required>
                                                <span id="passValid" style="color: red;font-size: small"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Gender</label>
                                            <div class="col-sm-12 col-md-7">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio" id="customRadioInline1" name="gender" value="MALE" checked class="custom-control-input">
                                                    <label class="custom-control-label" for="customRadioInline1">Male</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio" id="customRadioInline2" name="gender" value="FEMALE" class="custom-control-input">
                                                    <label class="custom-control-label" for="customRadioInline2">Female</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3" required>Store Name</label>
                                            <div class="col-sm-12 col-md-7">
                                                <input type="text" id="store_name"  name="store_name" class="form-control" required>
                                                <span id="storeValid" style="color: red;font-size: small"></span>
                                            </div>
                                        </div>


                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Address</label>
                                            <div class="col-sm-12 col-md-7">
                                                <textarea name="address" id="address" class="form-control" ></textarea>
                                            </div>
                                        </div>
                                        <%--  <div class="form-group row mb-4">
                                              <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Description</label>
                                              <div class="col-sm-12 col-md-7">
                                                  <textarea name="description" id="description" class="form-control" ></textarea>
                                              </div>
                                          </div--%><br><br>
                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-left col-12 col-md-3 col-lg-3"></label>
                                            <div class="col-sm-12 col-md-7 text-right">
                                                <button type="button" onclick="onSubmit()" class="btn btn-dark">Create Merchant</button>
                                            </div>
                                        </div>



                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </section>
        </div>
        <%@include file="/WEB-INF/views/common/footer.jsp"%>
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
<script src="/assets/js/jquery.onEnter.js"></script>
<script src="/assets/modules/datatables/datatables.min.js"></script>
</body>
<script>
    var contextPath='${pageContext.request.contextPath}';




    var columns = [
        { "sTitle": "No", "mData": "id" }
        ,{ "sTitle": "Name", "mData": "name" }
        ,{ "sTitle": "Phone", "mData": "phone" }
        ,{ "sTitle": "Region", "mData": "region" }
        ,{   "sTitle":"Action",
            "sClass": "text-center",
            "mData": null,
            "bSortable": false,
            "mRender": function(data) {
                return '<a href="${pageContext.request.contextPath}/admin/customers/detail" onclick="funtion()" class="btn btn-icon icon-left btn-outline-dark"><i class="fas fa-user"></i> Detail</a>';
            }
        }];

    $(document).ready(function () {

        orderList();



    });




    $("#search_customer").focusin(function () {
        $("#customerHelp").html("press enter to search");
    });
    $("#search_customer").focusout(function () {
        $("#customerHelp").html("");
    });


    $("#search_customer").onEnter(function () {
        orderList();
    })


    function orderList(){


 oTable = ajaxDataTableWithoutSelect($('#resultTableId'), columns, '/rest/customers',$("#search_form").serialize(), 10, true, true);



    }
</script>
</html>