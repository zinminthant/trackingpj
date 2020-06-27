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
<style>
    .sep {
        display: flex;
        align-items: center;
        text-align: center;
        color:#00462e;
    }
    .sep::before, .sep::after {
        content: '';
        flex: 1;
        border-bottom: 1px solid #00462e;
    }
    .sep::before {
        margin-right: .25em;
    }
    .sep::after {
        margin-left: .25em;
    }
</style>

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
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/main" class="nav-link" ><i class="fa fa-shopping-bag"></i>
                            <span>Order List</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/createorder" class="nav-link" ><i class="fa fa-shopping-bag"></i><span>Create Order</span></a>
                    </li>

                    <li class="menu-header">Customer</li>
                    <li >
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
            <section id="list_view" class="section">
                <div class="section-header">
                    <a  onclick="viewDetailFunction()" class="btn btn-icon"><i class="fas fa-arrow-left" style="color:#00642e;font-size: larger"></i></a>

                    <h1>Order Detail</h1>
                    <div class="section-header-breadcrumb">
                        <div class="breadcrumb-item active"><a href="#">Order</a></div>
                        <div class="breadcrumb-item"><a href="#">List</a></div>

                    </div>
                </div>

                <div class="section-body">


                    <div class="row">
                        <div class="col-12 col-sm-6 col-lg-6">



                            <div class="card"  style="  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">

                                <div class="card-body">
                                    <br>
                                    <div class="sep">Customer Info</div>
                                    <br>
                                    <div class="form-row">


                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Name</label>
                                            <input type="text" class="form-control" id="inputEmail4" placeholder="name">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">Phone</label>
                                            <input type="text" class="form-control" id="inputPassword4" placeholder="09">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">city</label>
                                        <select id="city" class="form-control">
                                            <option selected>Choose City</option>
                                            <option>...</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <textarea id="address"  class="form-control" name="description" placeholder="No(),Street "  rows="2"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="remark">Remark</label>
                                        <textarea id="remark"  class="form-control" name="description" placeholder="customer remark" rows="2"></textarea>
                                    </div>

                                    <br>
                                    <div class="sep">Delivery Info</div>
                                    <br>
                                    <div class="form-row">


                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Name</label>
                                            <input type="text" class="form-control" id="Fwfewfe" placeholder="name">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">Phone</label>
                                            <input type="text" class="form-control" id="fe" placeholder="09">
                                        </div>
                                    </div>
                                    <br>

                                    <%--<div class="form-row">--%>
                                    <%--<div class="form-group col-md-6">--%>
                                    <%--<label for="inputCity">City</label>--%>
                                    <%--<input type="text" class="form-control" id="inputCity">--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group col-md-4">--%>
                                    <%--<label for="inputState">State</label>--%>
                                    <%--<select id="inputState" class="form-control">--%>
                                    <%--<option selected>Choose...</option>--%>
                                    <%--<option>...</option>--%>
                                    <%--</select>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group col-md-2">--%>
                                    <%--<label for="inputZip">Zip</label>--%>
                                    <%--<input type="text" class="form-control" id="inputZip">--%>
                                    <%--</div>--%>
                                    <%--</div>--%>
                                    <div class="form-group mb-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gridCheck">
                                            <label class="form-check-label" for="gridCheck">
                                                Check me out
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer text-right">
                                    <button class="btn btn-outline-primary">Update</button>
                                    <button class="btn btn-outline-dark">Cancel</button>
                                </div>
                            </div>

                        </div>
                    <div class="col-12 col-sm-6 col-lg-6">
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
                                            <button class="btn btn-tracking" >Submit</button>
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

        { "sTitle": "Customer", "mData": "orderID" }
        ,{ "sTitle": "Customer", "mData": "customer" }
        ,{ "sTitle": "Delivery", "mData": "delivery" }
        ,{ "sTitle": "Status", "mData": "status" }
        ,{   "sTitle":"date",
            "sClass": "text-center",
            "mData": null,
            "bSortable": false,
            "mRender": function(data) {
                return moment(data.date).format('YYYY-MM-DD')+'<br>'+moment(data.date).format('hh:mm:ss a');
            }
        },{   "sTitle":"Action",
            "sClass": "text-center",
            "mData": null,
            "bSortable": false,
            "mRender": function(data) {
                return '<a href="#" onclick="funtion()" class="btn btn-icon icon-left btn-outline-dark"><i class="fa fa-shopping-bag"></i> Detail</a>';
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