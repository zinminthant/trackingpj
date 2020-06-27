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
    /* Latest compiled and minified CSS included as External Resource*/

    /* Optional theme */

    /*@import url('//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css');*/

    .stepwizard-step p {
        margin-top: 0px;
        color:#666;
    }
    .stepwizard-row {
        display: table-row;
    }
    .stepwizard {
        display: table;
        width: 100%;
        position: relative;
    }
    .stepwizard-step button[disabled] {
        /*opacity: 1 !important;
        filter: alpha(opacity=100) !important;*/
    }
    .stepwizard .btn.disabled, .stepwizard .btn[disabled], .stepwizard fieldset[disabled] .btn {
        opacity:1 !important;
        color:#bbb;
    }
    .stepwizard-row:before {
        top: 14px;
        bottom: 0;
        position: absolute;
        content:" ";
        width: 100%;
        height: 1px;
        background-color: #ccc;
        z-index: 0;
    }
    .stepwizard-step {
        display: table-cell;
        text-align: center;
        position: relative;
    }
    .btn-circle {
        width: 30px;
        height: 30px;
        text-align: center;
        padding: 6px 0;
        font-size: 12px;
        line-height: 1.428571429;
        border-radius: 15px;
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
                        <div class="col-12">


                            <div class="container">
                                <div class="stepwizard">
                                    <div class="stepwizard-row setup-panel">
                                        <div class="stepwizard-step col-xs-3">
                                            <a href="#step-1" type="button" class="btn btn-tracking btn-circle"><i class="fa fa-shopping-bag" ></i>
                                            </a>
                                            <p><small>Order</small></p>
                                        </div>
                                        <div class="stepwizard-step col-xs-3">
                                            <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled"><i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            </a>
                                            <p><small>Status</small></p>
                                        </div>
                                        <%--<div class="stepwizard-step col-xs-3">--%>
                                            <%--<a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>--%>
                                            <%--<p><small>Schedule</small></p>--%>
                                        <%--</div>--%>
                                        <%--<div class="stepwizard-step col-xs-3">--%>
                                            <%--<a href="#step-4" type="button" class="btn btn-default btn-circle" disabled="disabled">4</a>--%>
                                            <%--<p><small>Cargo</small></p>--%>
                                        <%--</div>--%>
                                    </div>
                                </div>

                                <form role="form">
                                    <div class="panel panel-primary setup-content" id="step-1">
                                        <%--<div class="panel-heading">--%>
                                            <%--<h3 class="panel-title">Shipper</h3>--%>
                                        <%--</div>--%>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label class="control-label">First Name</label>
                                                <input maxlength="100" type="text" required="required" class="form-control" placeholder="Enter First Name" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Last Name</label>
                                                <input maxlength="100" type="text" required="required" class="form-control" placeholder="Enter Last Name" />
                                            </div>
                                            <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
                                        </div>
                                    </div>

                                    <div class="panel panel-primary setup-content" id="step-2">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Destination</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label class="control-label">Company Name</label>
                                                <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Name" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Company Address</label>
                                                <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Address" />
                                            </div>
                                            <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
                                        </div>
                                    </div>

                                    <div class="panel panel-primary setup-content" id="step-3">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Schedule</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label class="control-label">Company Name</label>
                                                <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Name" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Company Address</label>
                                                <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Address" />
                                            </div>
                                            <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
                                        </div>
                                    </div>

                                    <div class="panel panel-primary setup-content" id="step-4">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Cargo</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label class="control-label">Company Name</label>
                                                <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Name" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Company Address</label>
                                                <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Address" />
                                            </div>
                                            <button class="btn btn-success pull-right" type="submit">Finish!</button>
                                        </div>
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
    $(document).ready(function () {

        var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

        allWells.hide();

        navListItems.click(function (e) {
            e.preventDefault();
            var $target = $($(this).attr('href')),
                $item = $(this);

            if (!$item.hasClass('disabled')) {
                navListItems.removeClass('btn-tracking').addClass('btn-default');
                $item.addClass('btn-tracking');
                allWells.hide();
                $target.show();
                $target.find('input:eq(0)').focus();
            }
        });

        allNextBtn.click(function () {
            var curStep = $(this).closest(".setup-content"),
                curStepBtn = curStep.attr("id"),
                nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
                curInputs = curStep.find("input[type='text'],input[type='url']"),
                isValid = true;

            $(".form-group").removeClass("has-error");
            for (var i = 0; i < curInputs.length; i++) {
                if (!curInputs[i].validity.valid) {
                    isValid = false;
                    $(curInputs[i]).closest(".form-group").addClass("has-error");
                }
            }

            if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
        });

        $('div.setup-panel div a.btn-tracking').trigger('click');
    });
</script>
</html>