<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>Components &rsaquo; Table &mdash; Stisla</title>

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
        <nav class="navbar navbar-expand-lg main-navbar" style="background-color: #00642e">
            <form class="form-inline mr-auto">
                <ul class="navbar-nav mr-3">
                    <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
                    <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
                </ul>

            </form>
            <ul class="navbar-nav navbar-right">

                <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                    <img alt="image" src="/assets/img/avatar/avatar-11.png" class="rounded-circle mr-1">
                    <div class="d-sm-none d-lg-inline-block">Admin</div></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="dropdown-title">Logged in 5 min ago</div>
                        <a href="features-profile.html" class="dropdown-item has-icon">
                            <i class="far fa-user"></i> Profile
                        </a>
                        <a href="features-activities.html" class="dropdown-item has-icon">
                            <i class="fas fa-bolt"></i> Activities
                        </a>
                        <a href="features-settings.html" class="dropdown-item has-icon">
                            <i class="fas fa-cog"></i> Settings
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item has-icon text-danger">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="main-sidebar sidebar-style-2">
            <aside id="sidebar-wrapper">
                <div class="sidebar-brand">
                    <a href="index.html"><img src="/assets/img/tracking.png" width="70px"> </a>
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
                    <li class="dropdown ">
                        <a href="${pageContext.request.contextPath}/admin/createorder" class="nav-link" ><i class="fa fa-shopping-bag"></i><span>Create Order</span></a>
                    </li>

                    <li class="menu-header">Customer</li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/customers" class="nav-link" ><i class="fas fa-user"></i><span>Customer List</span></a>
                    </li>

                    <li class="menu-header">Setting</li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/admin/setting" class="nav-link" ><i class="fa fa-cog" ></i>
                            <span>Setting</span></a>
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

                                    <button type="button" class="btn btn-icon icon-left btn-outline-dark"><i class="fa fa-plus" aria-hidden="true"></i></button>
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
                                <form>
                                    <div class="card-header">
                                        <h4>Code Detail</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Code Type</label>
                                            <select id="code_type" class="form-control">
                                                <c:forEach items="${list}" var="item">
                                                    <option value="${item}">${item}</option>
                                                </c:forEach>

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Code ID</label>
                                            <input type="text" id="code_id" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Code Name</label>
                                            <input type="text" id="code_name" class="form-control">
                                        </div>

                                    </div>
                                    <div class="card-footer text-right">
                                        <button type="button" class="btn btn-outline-dark" onclick="saveCode()">Save</button>
                                    </div>
                                </form>
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



    });

    function orderList(){

        var obj='';


        oTable = ajaxDataTable($('#resultTableId'), columns, '/rest/admin/codes',obj, 5, true, true);


    }


    function saveCode(){
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${pageContext.request.contextPath}/rest/admin/savecode",
            data: { code_type:$("#code_type").val()
                     , code_id:$("#code_id").val()
                     ,code_name:$("#code_name").val()},

            success: function (response) {
                alert("success");
            },
            error: function(xhr, status, error){
                var errorMessage = xhr.status + ': ' + xhr.statusText
                alert('Error - ' + errorMessage);
            }
        })



    }
</script>
</html>