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
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/admin/customers" class="nav-link" ><i class="fas fa-user"></i><span>Customer List</span></a>
                    </li>

                    <li class="menu-header">Setting</li>
                    <li class="dropdown ">
                        <a href="${pageContext.request.contextPath}/admin/setting" class="nav-link" ><i class="fa fa-cog" ></i>
                            <span>Setting</span></a>
                    </li>



                </ul>
            </aside>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-header">
                    <a  onclick="viewDetailFunction()" class="btn btn-icon"><i class="fas fa-arrow-left" style="color:#00642e;font-size: larger"></i></a>

                    <h1>Profile</h1>
                    <div class="section-header-breadcrumb">
                        <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                        <div class="breadcrumb-item">Profile</div>
                    </div>
                </div>
                <div class="section-body">

                    <div class="row mt-sm-4">
                        <div class="col-12 col-md-12 col-lg-5">
                            <div class="card profile-widget" style="  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">
                                <div class="profile-widget-header">
                                    <img alt="image" src="/assets/img/avatar/avatar-11.png" class="rounded-circle profile-widget-picture">
                                    <div class="profile-widget-items">
                                        <div class="profile-widget-item">
                                            <div class="profile-widget-item-label">Orders</div>
                                            <div class="profile-widget-item-value">6</div>
                                        </div>
                                        <%--<div class="profile-widget-item">--%>
                                            <%--<div class="profile-widget-item-label">Followers</div>--%>
                                            <%--<div class="profile-widget-item-value">6,8K</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="profile-widget-item">--%>
                                            <%--<div class="profile-widget-item-label">Following</div>--%>
                                            <%--<div class="profile-widget-item-value">2,1K</div>--%>
                                        <%--</div>--%>
                                    </div>
                                </div>
                                <div class="profile-widget-description" style="text-align: center">
                                    <div class="profile-widget-name">U Mg Mg  <div class="text-muted d-inline font-weight-normal"><div class="slash"></div>Yangon</div></div>
                                    <br>
                                    <b>094323456</b><br><br>
                                    <b>Yangon</b><br><br>
                                    (23),Street<br>



                                </div>
                                <div class="card-footer text-center">

                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-12 col-lg-7">

                                <form method="post" class="needs-validation" novalidate="">

                                        <h4 style="padding-left: 50px">Orders</h4>

                                    <div class="card-body">
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>

                                                <th scope="col" style="text-align: center">OrderID</th>
                                                <th scope="col" style="text-align: center">Date</th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>

                                                <td style="text-align: center">#O23425VNRE</td>
                                                <td style="text-align: center">2020-06-04 12:30 PN</td>

                                            </tr>
                                            <tr>

                                                <td style="text-align: center">#O23425VNRE</td>
                                                <td style="text-align: center">2020-06-04 12:30 PN</td>

                                            </tr> <tr>

                                                <td style="text-align: center">#O23425VNRE</td>
                                                <td style="text-align: center">2020-06-04 12:30 PN</td>

                                            </tr> <tr>

                                                <td style="text-align: center">#O23425VNRE</td>
                                                <td style="text-align: center">2020-06-04 12:30 PN</td>

                                            </tr> <tr>

                                                <td style="text-align: center">#O23425VNRE</td>
                                                <td style="text-align: center">2020-06-04 12:30 PN</td>

                                            </tr> <tr>

                                                <td style="text-align: center">#O23425VNRE</td>
                                                <td style="text-align: center">2020-06-04 12:30 PN</td>

                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </form>

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


</script>
</html>