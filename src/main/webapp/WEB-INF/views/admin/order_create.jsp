<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" type="text/css" href="/assets/build/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" crossorigin="anonymous">
</head>
<style>

    .datepicker table tr td.active:active, .datepicker table tr td.active.highlighted:active, .datepicker table tr td.active.active, .datepicker table tr td.active.highlighted.active, .open > .dropdown-toggle.datepicker table tr td.active, .open > .dropdown-toggle.datepicker table tr td.active.highlighted {
        background-color: #00642e;
        border-color: #00642e;
        color: #ffffff;
    }
    .btn[data-action="togglePeriod"], .btn-primary[data-action="togglePeriod"] { background: #00642e;color: #ffffff; border:none; }

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
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/admin/createorder" class="nav-link" ><i class="fa fa-shopping-bag"></i><span>Create Order</span></a>
                    </li>

                    <li class="menu-header">Customer</li>
                    <li >
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

                    <h1>Create Order</h1>
                    <div class="section-header-breadcrumb">
                        <div class="breadcrumb-item active"><a href="#">Order</a></div>
                        <div class="breadcrumb-item"><a href="#">List</a></div>

                    </div>
                </div>

                <div class="section-body">
                    <form:form id="orderForm" action="${pageContext.request.contextPath}/admin/createorder" modelAttribute="order" method="post">

                    <div class="row">
                        <div class="col-12">



                            <div class="card"  style="  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">

                                <div class="card-body">
                                    <div class="row">

                                    <div class="col-12 col-sm-7 col-lg-7">
                                    <h4 style="font-weight: bold"> #${orderId}</h4>
                                    <br>
                                    <div class="sep">Customer Info</div>
                                    <br>
                                    <div class="form-row">

                                            <form:hidden path="orderCode" value="${orderId}" cssClass="form-control" />




                                        <form:hidden path="customer.id" id="customer_id"/>

                                        <div class="form-group col-md-6">
                                            <label for="customer_name">Name</label>
                                            <div class="input-group">
                                                <form:input path="customer.name" cssClass="form-control" id="customer_name"/>
                                                <div class="input-group-append">
                                                    <div class="input-group-text">
                                                        <a href="#" data-toggle="modal" onclick="customerList()" data-target="#exampleModal">
                                                            <i class="fas fa-user"></i>
                                                        </a>

                                                    </div>
                                                </div>
                                            </div>
                                            <small id="passwordHelpBlock" class="form-text text-muted">
                                                click user icon to select existing customer
                                            </small>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="customer_phone">Phone</label>
                                            <form:input path="customer.phone" cssClass="form-control" id="customer_phone"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="customer_region">Region</label>
                                        <form:select path="customer.regionCode" id="customer_region" cssClass="form-control" title="select region">
                                            <c:forEach items="${regionList}" var="region">
                                                <form:option value="${region.codeID}">${region.codeName}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                    <div class="form-group">
                                        <label for="customer_address">Address</label>
                                        <form:textarea path="customer.address" cssClass="form-control" id="customer_address" placeholder="No(),Street" rows="3"/>

                                    </div>

                                    <div class="form-group">
                                        <label for="customer_remark">Remark</label>
                                        <form:textarea path="remark" cssClass="form-control" id="customer_remark" placeholder="remark" rows="3"/>

                                    </div>

                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customerCheck">
                                            <label class="custom-control-label" for="customerCheck">Please check if customer is new</label>
                                        </div>


                                        <br>
                                    <div class="sep">Delivery Info</div>
                                    <br>
                                    <div class="form-row">


                                        <div class="form-group col-md-12">
                                            <label for="delivery">Delivery</label>
                                            <form:select path="delivery" id="delivery" cssClass="form-control" title="select delivery guy">
                                                <c:forEach items="${deliveryList}" var="delivery">
                                                    <form:option value="${delivery.id}">${delivery.name}</form:option>
                                                </c:forEach>
                                            </form:select>

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
                                </div>

                                <div class="col-12 col-sm-5 col-lg-5">
                                    <div style="height: 50px"></div>
                                    <div class="create_activities">
                                        <div class="activity">
                                            <div class="activity-icon bg-secondary text-white shadow-secondary">
                                                <i class="fas fa-wine-bottle"></i>
                                            </div>
                                            <div class="activity-detail">
                                                <div class="mb-2">
                                                    <span class="text-job" style="font-weight:900;font-size:15px">Order Confirmed</span>

                                                </div>


                                                <div class="form-group">
                                                    <label>Date Time Picker</label>
                                                    <form:input path="statusSet[0].date" cssClass="form-control datetimepicker"/>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="activity">
                                            <div class="activity-icon bg-secondary text-white shadow-secondary">
                                                <i class="fas fa-shopping-bag"></i>
                                            </div>
                                            <div class="activity-detail">
                                                <div class="mb-2">
                                                    <span class="text-job" style="font-weight:900;font-size:15px">Ready To Ship</span>


                                                </div>


                                                <div class="form-group">
                                                    <label>Date Time Picker</label>
                                                    <form:input path="statusSet[1].date" cssClass="form-control datetimepicker"/>

                                                </div>



                                            </div>
                                        </div>
                                        <div class="activity">
                                            <div class="activity-icon bg-secondary text-white shadow-secondary">
                                                <i class="fas fa-truck"></i>
                                            </div>
                                            <div class="activity-detail">
                                                <div class="mb-2">
                                                    <span class="text-job" style="font-weight:900;font-size:15px;">Shipping</span>
                                                </div>

                                                <div class="form-group">
                                                    <label>Date Time Picker</label>
                                                    <form:input path="statusSet[2].date" type="datetime"  cssClass="form-control datetimepicker"/>

                                                </div>






                                            </div>
                                        </div>


                                    </div>

                                </div>

                                </div>




                                </div>
                                <div class="card-footer text-center">
                                    <button type="submit" class="btn btn-outline-primary btn-lg">Create</button>
                                    <button type="button" class="btn btn-outline-dark btn-lg">Cancel</button>
                                </div>
                            </div>


                    </div>

                    </div>

                    </form:form>
                </div>

            </section>


        </div>
        <%@include file="/WEB-INF/views/common/footer.jsp"%>

    </div>
    <div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title">Customers</h5>--%>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="search_form">
                        <div class="row">

                            <div class="col-md-12" >
                                <div class="row">

                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3" style="color:#000000">Customer</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="search_name" id="search_customer" class="form-control" >
                                        <span id="customerHelp" style="font-size: small;color: #6777ef"></span>
                                    </div>
                                </div>


                            </div>






                        </div>
                    </form><div style="height: 20px"></div>

                    <div class="table-responsive table-striped">
                        <table class="table" id="resultTableId">

                        </table>
                    </div>

                </div>
                <%--<div class="modal-footer bg-whitesmoke br">--%>
                    <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                    <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                <%--</div>--%>
            </div>
        </div>
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
<script src="/assets/modules/datatables/datatables.min.js"></script>


<!-- Template JS File -->
<script src="/assets/js/scripts.js"></script>
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/util.js"></script>

<script src="/assets/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.1.62/jquery.inputmask.bundle.js"></script>
</body>
<script type="text/javascript">
    var phones = [{ "mask": "##-###-######"}, { "mask": "##-###-##############"}];

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
            console.log(data)
                return '<a href="#" onclick="selectCustomer('+data.id+',\''+data.name+'\',\''+data.phone+'\',\''+data.regionCode+'\')" class="btn btn-icon icon-left btn-outline-primary"><i class="fa fa-hand-pointer-o"></i> Select</a>';
            }
        }];


    jQuery(document).ready(function($) {
        $('#customer_phone').inputmask({
            mask: phones,
            greedy: false,
            definitions: { '#': { validator: "[0-9]", cardinality: 1}} });
        if (window.jQuery().datetimepicker) {
            $('.datetimepicker').datetimepicker({
                // Formats
                // follow MomentJS docs: https://momentjs.com/docs/#/displaying/format/
                format: 'YYYY-MM-DD hh:mm A',

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


    function customerList(){


        oTable = ajaxDataTable($('#resultTableId'), columns, '/rest/customers',$("#search_form").serialize(), 5, true, true);



    }

    function selectCustomer(id,name,phone,region) {

        $('#exampleModal').modal('toggle');
        console.log(id+name+phone+region);

        $("#customer_name").val(name);
        $("#customer_phone").val(phone);
        $("#customer_region").val(region);
        $("#customer_id").val(id);
    }



</script>
</html>