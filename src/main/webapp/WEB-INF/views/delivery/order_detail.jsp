<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" type="text/css" href="/assets/build/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" crossorigin="anonymous">
</head>
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
                                        <h4>#${order.orderCode}</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <label  class="col-sm-3 col-form-label">Customer Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" value="${order.customer.name}" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="phone" class="col-sm-3 col-form-label">Customer Phone</label>
                                            <div class="col-sm-9">
                                                <input type="text" value="${order.customer.phone}" class="form-control" id="phone" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label  class="col-sm-3 col-form-label">Customer Region</label>
                                            <div class="col-sm-9">
                                                <input type="text" value="${order.customer.regionCode}" class="form-control"  readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Customer Address</label>
                                            <textarea id="address"  class="form-control" name="description" placeholder="${order.customer.address}"  rows="2" readonly></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label for="remark">Customer Remark</label>
                                            <textarea id="remark"  class="form-control" name="description" placeholder="${order.customer.remark}" rows="2" readonly></textarea>
                                        </div>



                                    </div>

                                </div>

                            </div>
                            <div class="col-12 col-sm-5 col-lg-5">


                                <div class="activities">
                                    <c:forEach  items="${before}" var="status">
                                        <div class="activity">
                                            <div class="activity-icon bg-tracking text-white shadow-tracking">
                                                <i class="${status.code.codeIcon}"></i>
                                            </div>
                                            <div class="activity-detail">
                                                <div class="mb-2">
                                                    <span class="text-job" style="font-weight:900;font-size:15px">${status.code.codeName}</span>
                                                    <span class="bullet"></span>
                                                    <a class="text-job" href="#">${status.date}</a>

                                                </div>
                                                <p>${status.code.descriptioon}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <c:if test="${before.size()>0 &&before.size()<4}">

                                        <div class="activity">

                                        </div>
                                    </c:if>

                                </div>
                                <div class="nonactivities">
                                    <c:forEach items="${after}" var="status">
                                        <div class="activity">
                                            <div class="activity-icon bg-secondary text-white shadow-secondary">
                                                <i class="${status.code.codeIcon}"></i>
                                            </div>
                                            <div class="activity-detail">
                                                <div class="mb-2">
                                                    <span class="text-job" style="font-weight:900;font-size:15px;color:grey">${status.code.codeName}</span>


                                                </div>
                                                <p>${status.code.descriptioon}</p>
                                            </div>
                                        </div>

                                    </c:forEach>
                                    <c:if test="${complete!=null}">
                                    <div class="activity" >
                                        <form:form id="completeForm" action="${pageContext.request.contextPath}/delivery/order/update" modelAttribute="complete">
                                            <form:hidden path="id" value="${complete.id}"/>
                                            <div class="activity-icon bg-secondary text-white shadow-secondary">
                                            <i class="${complete.code.codeIcon}"></i>
                                        </div>
                                        <div class="activity-detail" style="  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">
                                            <div class="mb-2">
                                                <span class="text-job" style="font-weight:900;font-size:15px;color:grey">${complete.code.codeName}</span>


                                            </div>


                                            <div class="form-group">

                                                <form:input path="date"  class="form-control datetimepicker"/>
                                                <br>
                                                <div class="text-right">
                                                    <button type="submit" class="btn btn-tracking ">Submit</button>
                                                </div>


                                            </div>

                                        </div>
                                        </form:form>
                                    </div>
                                    </c:if>



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
<script src="/assets/modules/jquery-ui/jquery-ui.min.js"></script>

<!-- Page Specific JS File -->
<script src="/assets/js/page/components-table.js"></script>

<!-- Template JS File -->
<script src="/assets/js/scripts.js"></script>
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/util.js"></script>

<script src="/assets/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>


</body>
<script>
    jQuery(document).ready(function($) {
        if (window.jQuery().datetimepicker) {
            $('.datetimepicker').datetimepicker({
                // Formats
                // follow MomentJS docs: https://momentjs.com/docs/#/displaying/format/
                format: 'DD-MM-YYYY hh:mm A',

                // Your Icons
                // as Bootstrap 4 is not using Glyphicons anymore
                icons: {
                    time: 'fa fa-clock-o',
                    date: 'fa fa-calendar',
                    up: 'fa fa-chevron-up',
                    down: 'fa fa-chevron-down',
                    previous: 'fa fa-chevron-left',
                    next: 'fa fa-chevron-right',
                    today: 'fa fa-check',
                    clear: 'fa fa-trash',
                    close: 'fa fa-times'
                }
            });
        }
    });

</script>
</html>