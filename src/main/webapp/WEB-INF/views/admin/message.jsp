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
    <link rel="stylesheet" href="/assets/jquery.highlighttextarea.css">
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
                    <li >
                        <a href="${pageContext.request.contextPath}/admin/customers" class="nav-link" ><i class="fas fa-user"></i><span>Customer List</span></a>
                    </li>

                    <li class="menu-header">Setting</li>

                    <li>
                        <a href="${pageContext.request.contextPath}/admin/setting" class="nav-link" ><i class="fas fa-file-code"></i>

                            <span>Code</span></a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/admin/message" class="nav-link" ><i class="fas fa-comment-alt"></i>
                            <span>Message</span></a>
                    </li>




                </ul>
            </aside>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-header">
                    <h1>Message</h1>
                    <div class="section-header-breadcrumb">
                        <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                        <div class="breadcrumb-item"><a href="#">Components</a></div>
                        <div class="breadcrumb-item">Chat Box</div>
                    </div>
                </div>

                <div class="section-body">

                    <div class="row align-items-center justify-content-center">
                        <div class="col-12 col-sm-6 col-lg-6">
                            <div class="card">

                                <div class="card-body">
                                    <form:form action="${pageContext.request.contextPath}/admin/savemessage" modelAttribute="message">
                                   <form:hidden path="id" value="${message.id}"/>
                                    <div class="form-group">
                                        <label>Message format</label>

                                        <form:textarea path="textMessage" id="textareaId" oninput="preview()" cssClass="form-control" value="${message.textMessage}"></form:textarea>

                                        <small id="passwordHelpBlock" class="form-text text-muted">
                                            Your text message must be 8-20 characters long, <mark>URL</mark> is required
                                        </small>
                                    </div>
                                    <div class="text-right">
                                        <button type="submit" class="btn btn-outline-primary">Create</button>
                                        <button class="btn btn-outline-dark">Cancel</button>
                                    </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-lg-6">
                            <div class="card chat-box" id="mychatbox" style="  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">
                                <div class="card-header">
                                <h4>Message Preview</h4>
                                </div>
                                <div class="card-body chat-content">
                                </div>
                                <div class="card-footer chat-form">
                                    <form id="chat-form">
                                        <input type="text" class="form-control" placeholder="Type a message">
                                        <button type="button" class="btn btn-tracking">
                                            <i class="far fa-paper-plane"></i>
                                        </button>
                                    </form>
                                </div>
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
<script src="/assets/modules/datatables/datatables.min.js"></script>
<script src="/assets/jquery.highlighttextarea.js" type="text/javascript"></script>
</body>
<script>
    $(document).ready(function () {
        preview();
    })
    var contextPath='${pageContext.request.contextPath}';



    function preview() {
        var text=$("#textareaId").val().replace('URL','<a href="#">http://www.121tracking.com/121tr</a>');
        $(".chat-content").empty();
        $.chatCtrl('#mychatbox', {
            text:text ,
            date: moment(new Date()).format('MM-DD hh:mm a'),
            position:'left',
            type: 'text'
        });
    }





    $('textarea').highlightTextarea({
        words: ['URL']
    });


</script>
</html>