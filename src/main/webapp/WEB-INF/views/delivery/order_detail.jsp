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
    <link rel="stylesheet" href="/assets/modules/bootstrap-daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="/assets/modules/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
    <link rel="stylesheet" href="/assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">

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
                            <a href="${pageContext.request.contextPath}/main" class="nav-link" style="color: #000000;"><i class="fa fa-shopping-bag"></i>&nbsp;<span>Order List</span></a>
                        </li>
                        <li class="nav-item ">
                            <a href="${pageContext.request.contextPath}/delivery/customers" class="nav-link" style="color: #000000;"><i class="fa fa-user"></i>&nbsp;<span>Customer</span></a>
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
              <div style="height: 20px"></div>
                <div class="section-body" style="">


                    <div class="section-body">
                        <%--<h2>#EFE423CES</h2>--%>
                        <div class="row">

                            <div class="col-12 col-sm-6 col-lg-6" style="text-align: left">


                                <div class="card" style="  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">
                                    <div class="card-header">
                                        <h4>#Fefwf34NEF</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-3 col-form-label">Customer Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" value="Mg MG" id="inputEmail3" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputPassword3" class="col-sm-3 col-form-label">Customer Phone</label>
                                            <div class="col-sm-9">
                                                <input type="text" value="0977056778" class="form-control" id="inputPassword3" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label  class="col-sm-3 col-form-label">Customer City</label>
                                            <div class="col-sm-9">
                                                <input type="text" value="Mandalay" class="form-control"  readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Customer Address</label>
                                            <textarea id="address"  class="form-control" name="description" placeholder="No(),Street "  rows="2" readonly></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label for="remark">Customer Remark</label>
                                            <textarea id="remark"  class="form-control" name="description" placeholder="customer remark" rows="2" readonly></textarea>
                                        </div>



                                    </div>

                                </div>

                            </div>
                            <div class="col-12 col-sm-5 col-lg-5">

                                <div class="activities">
                                    <div class="activity">
                                        <div class="activity-icon bg-tracking text-white shadow-tracking">
                                            <i class="fas fa-wine-bottle"></i>
                                        </div>
                                        <div class="activity-detail">
                                            <div class="mb-2">
                                                <span class="text-job" style="font-weight:900;font-size:15px">Order Confirmed</span>
                                                &emsp;
                                                <div class="float-right dropdown">
                                                    <i class="fas fa-edit"></i>
                                                </div>



                                            </div>
                                            <a class="text-job" href="#">18-06-2020 09:45AM</a>
                                        </div>
                                    </div>
                                    <div class="activity">
                                        <div class="activity-icon bg-tracking text-white shadow-tracking">
                                            <i class="fas fa-shopping-bag"></i>
                                        </div>
                                        <div class="activity-detail">
                                            <div class="mb-2">
                                                <span class="text-job" style="font-weight:900;font-size:15px">Ready To Ship</span>


                                            </div>

                                            <div class="form-group">
                                                <label>Date Time Picker</label>
                                                <input type="text" class="form-control datetimepicker">
                                            </div>
                                            <div class="text-right">
                                                <button class="btn btn-tracking">Submit</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="nonactivities">
                                    <div class="activity">
                                        <div class="activity-icon bg-secondary text-white shadow-secondary">
                                            <i class="fas fa-truck"></i>
                                        </div>
                                        <div class="activity-detail">
                                            <div class="mb-2">
                                                <span class="text-job" style="font-weight:900;font-size:15px;color:grey">Shipping</span>
                                                <span class="bullet"></span>
                                                <a class="text-job" href="#"></a>


                                            </div>
                                            <p>your order has been carrying by delivery</p>
                                        </div>
                                    </div>

                                    <div class="activity">
                                        <div class="activity-icon bg-secondary text-white shadow-secondary">
                                            <i class="fa fa-shopping-bag"></i>
                                        </div>
                                        <div class="activity-detail">
                                            <div class="mb-2">
                                                <span class="text-job" style="font-weight:900;font-size:15px;color:grey">Delivered</span>
                                                <span class="bullet"></span>
                                                <a class="text-job" href="#"></a>

                                            </div>
                                            <p>order has been successfully delivered</p>
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
                <%--Copyright &copy; 2018 <div class="bullet"></div> Design By <a href="https://nauval.in/">Muhamad Nauval Azhar</a>--%>
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
<script src="/assets/js/page/forms-advanced-forms.js"></script>
<script src="/assets/modules/cleave-js/dist/cleave.min.js"></script>
<script src="/assets/modules/cleave-js/dist/addons/cleave-phone.us.js"></script>
<script src="/assets/modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
<script src="/assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="/assets/modules/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="/assets/modules/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="/assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>


</body>
<script>
    var contextPath='${pageContext.request.contextPath}';

    window.onscroll = function() {myFunction()};
    //
    // var navbar = document.getElementById("navbar");
    // var sticky = navbar.offsetTop;
    //
    // function myFunction() {
    //     if (window.pageYOffset >= sticky) {
    //         navbar.classList.add("sticky");
    //         $(".navbar-secondary").css({ 'top' :0});
    //     } else {
    //         navbar.classList.remove("sticky");
    //         $(".navbar-secondary").css({ 'top' :'70px'});
    //     }
    // }




    var columns = [

        { "sTitle": "Order Id", "mData": "orderID" }
        ,{ "sTitle": "Customer", "mData": "customer" }
        ,{ "sTitle": "Delivery", "mData": "delivery" }
        ,{ "sTitle": "Status", "mData": "status" }
        ,{   "sTitle":"date",
            "sClass": "text-left",
            "mData": null,
            "bSortable": false,
            "mRender": function(data) {
                return moment(data.date).format('YYYY-MM-DD')+'<br>'+moment(data.date).format('hh:mm:ss a');
            }
        },
        {   "sTitle":"Action",
            "sClass": "text-center",
            "mData": null,
            "bSortable": false,
            "mRender": function(data) {
                return '<a href="#" onclick="funtion()" class="btn btn-icon icon-left btn-outline-dark"><i class="far fa-user"></i> Detail</a>';
            }
        }];


    $(document).ready(function () {

        orderList();



    });

    function orderList(){

        var obj='';


        oTable = ajaxDataTable($('#resultTableId'), columns, '/rest/orders',obj, 10, true, true);


    }


</script>
</html>