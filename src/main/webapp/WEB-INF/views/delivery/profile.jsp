<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>Tracking</title>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="/assets/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/modules/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/assets/modules/datatables/datatables.min.css">
    <link rel="stylesheet" href="/assets/modules/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
    <!-- CSS Libraries -->

    <!-- Template CSS -->
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/js/all.min.js"></script>
    <!-- Start GA -->

    <!-- /END GA --></head>
<style>
    .content {
        padding: 10px;
    }

    .sticky {
        position: fixed;
        top: 0;
        width: 100%;
    }

    .sticky + .content {
        padding-top: 0px;
    }
</style>
<body class="layout-3">
<div id="app">
    <div class="main-wrapper container">

        <nav class="navbar navbar-expand-lg main-navbar" style="background-color: #00642e">
            <a href="index.html" class="navbar-brand sidebar-gone-hide" style="padding-left: 200px;"><img src="/assets/img/tracking_d.png" width="70px"> </a>
            <a href="#" class="nav-link sidebar-gone-show" data-toggle="sidebar" ><i class="fas fa-bars"></i></a>

            <form class="form-inline ml-auto" >


            </form>
            <ul class="navbar-nav navbar-right" style="padding-right: 200px">


                <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                    <img alt="image" src="/assets/img/avatar/avatar-11.png" class="rounded-circle mr-1">
                    <div class="d-sm-none d-lg-inline-block">Delivery</div></a>
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

        <nav id="navbar" class="navbar navbar-secondary navbar-expand-lg">
            <div class="container">
                <ul class="navbar-nav">
                    <%--<li class="nav-item dropdown">--%>
                    <%--<a href="#" data-toggle="dropdown" class="nav-link has-dropdown"><i class="fas fa-fire"></i><span>Dashboard</span></a>--%>
                    <%--<ul class="dropdown-menu">--%>
                    <%--<li class="nav-item"><a href="index-0.html" class="nav-link">General Dashboard</a></li>--%>
                    <%--<li class="nav-item"><a href="index.html" class="nav-link">Ecommerce Dashboard</a></li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>

                    <li class="nav-item active">
                        <a href="#" class="nav-link" style="color: #000000;"><i class="fa fa-shopping-bag"></i>&nbsp;<span>Order List</span></a>
                    </li>
                    <li class="nav-item ">
                        <a href="#" class="nav-link" style="color: #000000;"><i class="fa fa-user"></i>&nbsp;<span>Customer</span></a>
                    </li>
                    <%--<li class="nav-item active dropdown">--%>
                    <%--<a href="#" data-toggle="dropdown" class="nav-link has-dropdown"><i class="far fa-clone"></i><span>Multiple Dropdown</span></a>--%>
                    <%--<ul class="dropdown-menu">--%>
                    <%--<li class="nav-item"><a href="#" class="nav-link">Not Dropdown Link</a></li>--%>
                    <%--<li class="nav-item dropdown"><a href="#" class="nav-link has-dropdown">Hover Me</a>--%>
                    <%--<ul class="dropdown-menu">--%>
                    <%--<li class="nav-item"><a href="#" class="nav-link">Link</a></li>--%>
                    <%--<li class="nav-item dropdown"><a href="#" class="nav-link has-dropdown">Link 2</a>--%>
                    <%--<ul class="dropdown-menu">--%>
                    <%--<li class="nav-item"><a href="#" class="nav-link">Link</a></li>--%>
                    <%--<li class="nav-item"><a href="#" class="nav-link">Link</a></li>--%>
                    <%--<li class="nav-item"><a href="#" class="nav-link">Link</a></li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li class="nav-item"><a href="#" class="nav-link">Link 3</a></li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="main-content">

            <section class="section">
                <div style="height: 20px"></div>

                <div class="section-body" style="">
                    <div class="row">
                    <div class="col-12 col-md-2 col-lg-2"></div>
                    <div class="col-12 col-md-8 col-lg-8">
                    <div class="card profile-widget" style="  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">
                        <div class="profile-widget-header">
                            <img alt="image" src="/assets/img/avatar/avatar-11.png" class="rounded-circle profile-widget-picture">

                        </div>
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
                                <button class="btn btn-outline-dark" type="submit">Update</button>
                            </div>
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
            </section>
        </div>
        <footer class="main-footer">
            <div class="footer-left">
                Copyright &copy; 2018 <div class="bullet"></div> Design By <a href="https://nauval.in/">Muhamad Nauval Azhar</a>
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

<!-- Page Specific JS File -->

<!-- Template JS File -->
<script src="/assets/js/scripts.js"></script>
<script src="/assets/js/custom.js"></script>
<script src="/assets/modules/datatables/datatables.min.js"></script>
<script src="/assets/js/util.js"></script>


</body>
<script>

</script>
</html>