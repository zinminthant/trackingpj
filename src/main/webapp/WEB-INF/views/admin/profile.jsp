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
                        <a href="${pageContext.request.contextPath}/admin/admin" class="nav-link" ><i class="fa fa-shopping-bag"></i>
                            <span>Order List</span></a>
                    </li>
                    <li class="dropdown ">
                        <a href="${pageContext.request.contextPath}/admin/merchant" class="nav-link" ><i class="fa fa-shopping-bag"  style="color: #00462e"></i><span>Create Order</span></a>
                    </li>

                    <li class="menu-header">Customer</li>
                    <li class="dropdown ">
                        <a href="${pageContext.request.contextPath}/admin/admin" class="nav-link" ><i class="fas fa-user" style="color: #00462e"></i><span>Customer List</span></a>
                    </li>

                    <li class="menu-header">Setting</li>
                    <li class="dropdown ">
                        <a href="${pageContext.request.contextPath}/admin/admin" class="nav-link" ><i class="fa fa-cog" style="color: #00462e"></i>
                            <span>Setting</span></a>
                    </li>



                </ul>
            </aside>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <section id="list_view" class="section">
                <div class="section-header">
                    <h1>Profile</h1>
                    <div class="section-header-breadcrumb">
                        <div class="breadcrumb-item active"><a href="#">Order</a></div>
                        <div class="breadcrumb-item"><a href="#">profile</a></div>

                    </div>
                </div>



                <div class="section-body">


                    <div class="section-body" style="">
                        <div class="row">
                            <div class="col-12 col-md-2 col-lg-2"></div>
                            <div class="col-12 col-md-8 col-lg-8">
                                <div class="card profile-widget" style="  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">
                                    <div class="profile-widget-header">
                                        <img alt="image" src="/assets/img/avatar/avatar-11.png" class="rounded-circle profile-widget-picture">

                                    </div>
                                    <form:form id="userForm" action="${pageContext.request.contextPath}/admin/saveUser" modelAttribute="user" enctype="multipart/form-data">
                                    <div class="profile-widget-description">
                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Name</label>
                                            <div class="col-sm-12 col-md-6">
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Phone</label>
                                            <div class="col-sm-12 col-md-6">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">
                                                            <i class="fas fa-phone"></i>
                                                        </div>
                                                    </div>
                                                    <input type="text" class="form-control phone-number">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Username</label>
                                            <div class="col-sm-12 col-md-6">
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group row mb-4">
                                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Password</label>
                                            <div class="col-sm-12 col-md-5">
                                                <a href="#">Change Password</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-9 text-right">
                                            <button class="btn btn-outline-dark" type="button" onclick="save()">Update</button>
                                        </div>
                                        </form:form>
                                        <div id="changePass">
                                            <div class="form-group row mb-4">
                                                <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Old password</label>
                                                <div class="col-sm-12 col-md-6">
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group row mb-4">
                                                <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">New Password </label>
                                                <div class="col-sm-12 col-md-6">
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-9 text-right">
                                                <button class="btn btn-outline-primary" type="submit">Change</button>
                                                <button class="btn btn-outline-dark" type="submit">Cancel</button>
                                            </div>

                                        </div>


                                    </div>


                                </div>
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
<script src="http://malsup.github.com/jquery.form.js"></script>
</body>
<script>
    var contextPath='${pageContext.request.contextPath}';

    function save() {

        $("#userForm").ajaxForm({
            dataType:  'json',
            beforeSend: function(){

            },
            complete: function(xhr, textStatus){

            },
            success: function(data) {
                console.log("---"+data);


            },

            error: function(xhr, textStatus, errorThrown){
                console.log(xhr);
                console.log(textStatus);
                console.log(errorThrown);

            }
        }).submit();
        
    }

</script>
</html>