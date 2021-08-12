<%-- 
    Document   : search
    Created on : 24 thg 4, 2021, 15:35:04
    Author     : PC
--%>

<%@page import="hieunnm.dtos.UserErrDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>

        <style>
            img {
                height: 40px;
                width: 40px;
            }
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #299be4;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn {
                color: #566787;
                float: right;
                font-size: 13px;
                background: #fff;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn:hover, .table-title .btn:focus {
                color: #566787;
                background: #f2f2f2;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }	
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #2196F3;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }

            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }	
            .modal form label {
                font-weight: normal;
            }	
        </style>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                var hash = window.location.hash;

                if (hash.length > 0) {
                    hash = hash.substring(1);
                    $('li a[href$=' + hash + ']').parent().addClass('active');
                }

                $(window).on('hashchange', function () {
                    $('.active').removeClass('active');
                    var hash = window.location.hash
                    if (hash.length > 0) {
                        hash = hash.substring(1);
                        $('li a[href$=' + hash + ']').parent().addClass('active');
                    }
                });

            });

            var check = function () {
                if (document.getElementById('password').value ==
                        document.getElementById('confirmPassword').value) {
                    document.getElementById('messagePassword').style.color = 'green';
                    document.getElementById('messagePassword').innerHTML = '<i class="material-icons" style="color: green; font-size: 15px">done</i>Password and confirm password is matching';
                    document.getElementById('btnSubmitAddNew').disabled = false;
                } else {
                    document.getElementById('messagePassword').style.color = 'red';
                    document.getElementById('messagePassword').innerHTML = '<i class="material-icons" style="color: red; font-size: 15px">close</i>Password and confirm password do NOT matched!';
                    document.getElementById('btnSubmitAddNew').disabled = true;

                }
            }

        </script>
        <script>
            $(document).ready(function () {
                $(".nav-pills a").click(function () {
                    $(this).tab('show');
                });
            });
        </script>
        <script>
            function resetSearhForm() {
                document.getElementById("txtNameAll").reset();

            }
            function resetSearhUserForm() {
                document.getElementById("txtNameUser").reset();

            }
            function resetSearhAdminForm() {
                document.getElementById("txtNameAdmin").reset();

            }
        </script>
        <%
            UserErrDTO userError = (UserErrDTO) request.getAttribute("MSG_ERROR");
            if (userError == null) {
                userError = new UserErrDTO("");
            }

        %>

        <div class="container-xl">
            <c:if test="${not empty sessionScope.USER}">
                <h2>Welcome, <font color="red">${sessionScope.USER.fullName}
                    </font>(${sessionScope.USER.role.name})
                </h2>

            </c:if>
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2>User <b>Management</b></h2>
                            </div>
                            <div class="col-sm-7">
                                <c:if test="${empty sessionScope.USER}">
                                    <a href="login" class="btn btn-secondary"><i class="material-icons">login</i> <span>Login</span></a>

                                </c:if>
                                <c:if test="${sessionScope.USER.role.name eq 'admin'}">
                                    <a href="#addEmployeeModal" class="btn btn-secondary" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a>
                                </c:if>
                                <c:if test="${not empty sessionScope.USER}">
                                    <a href="logout" class="btn btn-secondary"><i class="material-icons">logout</i> <span>Logout</span></a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <ul class="nav nav-pills" id="myNav">
                        <li class="active"><a data-toggle="pill" href="#all" >All</a></li>
                        <li><a data-toggle="pill" href="#admin">Admin</a></li>
                        <li><a data-toggle="pill" href="#user" >User</a></li>

                    </ul>

                    <div class="tab-content">
                        <div id="all" class="tab-pane fade in active">
                            <br/>
                            <div class="container">
                                <form action="search" method="post" novalidate id="searchField">
                                    <div class="row" >
                                        <div class="col-lg-12"> 
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-12 p-0" >
                                                    <input type="text" class="form-control search-slt" placeholder="Enter name" name="txtNameAll" value="${param.txtNameAll}" pattern="[^'\x22]+">
                                                </div>

                                                <div class="col-lg-3 col-md-3 col-sm-12 p-0" >
                                                    <input type="submit" value="Search" class="btn btn-danger wrn-btn" class="form-control search-slt" />
                                                    <input type="reset" value="Reset" class="btn btn-primary wrn-btn" class="form-control search-slt"/>
                                                    <font color="red" ><%=userError.getUserIDError()%></font>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Gender</th>
                                        <th>Date Created</th>
                                        <th>Role</th>
                                        <th>Status</th>
                                            <c:if test="${sessionScope.USER.role.name eq 'admin'}"> 
                                            <th>Actions</th>
                                            </c:if>

                                    </tr>
                                </thead>

                                <tbody>

                                    <c:forEach var="dto" items="${requestScope.SEARCH_RESULT_ALL}" varStatus="Counter">
                                        <c:if test="${not empty sessionScope.USER and sessionScope.USER.role.name eq 'admin'}">

                                            <!--         Delete Modal HTML -->
                                        <div id="deleteAllModel${dto.id}" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="deleteAll" method="POST">
                                                        <input type="hidden" name="txtId" value="${dto.id}" />
                                                        <input type="hidden" name="txtNameAll" value="${param.txtNameAll}" />

                                                        <div class="modal-header">						
                                                            <h3 class="modal-title" style="color: red"><i class="material-icons">warning</i>Warning</h3>
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">					
                                                            <p>Are you sure you want to delete this user?</p> 
                                                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                            <input type="submit" class="btn btn-danger" value="Delete">
                                                        </div>

                                                    </form>
                                                </div>
                                            </div>
                                        </div> 

                                        <!-- Edit Modal HTML -->
                                        <div id="editEmployeeModal${dto.id}" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="editUser" method="POST">
                                                        <input type="hidden" name="txtId" value="${dto.id}" />
                                                        <input type="hidden" name="txtNameAll" value="${param.txtNameAll}" />
                                                        <div class="modal-header">						
                                                            <h4 class="modal-title" style="color: #079284">Edit Employee</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <p style="text-align: center; margin-top: 20px"><img src="${dto.image}" draggable="false" style="height: 150px; width: 150px;" /></p>
                                                        <div class="modal-body">

                                                            <div class="form-group">
                                                                <label for="fullNameEdit">Full Name</label>
                                                                <input type="text" id="fullNameEdit" name="txtFullNameEdit" class="form-control" required value="${dto.fullName}">
                                                                <p>Fullname must be 4-30 characters in length.</p>
                                                                <span id='messageFullName'></span>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="inlineRadio1">Gender</label>
                                                                <br/>
                                                                <c:if test="${dto.gender eq 'Male'}">
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioGenderOptionsEdit"  id="inlineRadio1" value="Male" checked="checked">
                                                                        <label class="form-check-label"  for="inlineRadio1">Male</label>
                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioGenderOptionsEdit" id="inlineRadio2" value="Female">
                                                                        <label class="form-check-label" for="inlineRadio2">Female</label>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${dto.gender eq 'Female'}">
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioGenderOptionsEdit" id="inlineRadio1" value="Male" >
                                                                        <label class="form-check-label"  for="inlineRadio1">Male</label>
                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioGenderOptionsEdit" id="inlineRadio2" value="Female" checked="checked">
                                                                        <label class="form-check-label" for="inlineRadio2">Female</label>
                                                                    </div>
                                                                </c:if>


                                                            </div>
                                                            <div class="form-group">
                                                                <label>Date Created</label>
                                                                <input type="text" class="form-control" value="${dto.createDate}" readonly>
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="inlineRadioRole1">Role</label>
                                                                <br/>
                                                                <c:if test="${dto.role.name eq 'admin'}">
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole1" value="Admin" checked="checked">
                                                                        <label class="form-check-label"  for="inlineRadioRole1"><span class="label label-success" for="inlineRadioRole1">Admin</span></label>

                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole2" value="User">
                                                                        <label class="form-check-label" for="inlineRadioRole2"><span class="label label-info" for="inlineRadioRole2">User</span></label>

                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${dto.role.name eq 'user'}">
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole1" value="Admin" >
                                                                        <label class="form-check-label"  for="inlineRadioRole1"><span class="label label-success" for="inlineRadioRole1">Admin</span></label>

                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole2" value="User" checked="checked">
                                                                        <label class="form-check-label" for="inlineRadioRole2"><span class="label label-info" for="inlineRadioRole2">User</span></label>

                                                                    </div>
                                                                </c:if>
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="inlineRadioStatus1">Status</label>
                                                                <br/>
                                                                <c:if test="${dto.status eq 'active'}">
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus1" value="active" checked="checked">
                                                                        <label class="form-check-label"  for="inlineRadioStatus1">Active</label>

                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus2" value="inactive">
                                                                        <label class="form-check-label" for="inlineRadioStatus2">Inactive</label>

                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${dto.status eq 'inactive'}">
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus1" value="active" >
                                                                        <label class="form-check-label"  for="inlineRadioStatus1">Active</label>

                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus2" value="inactive" checked="checked">
                                                                        <label class="form-check-label" for="inlineRadioStatus2">Inactive</label>

                                                                    </div>
                                                                </c:if>




                                                            </div>
                                                            <div class="form-group">
                                                                <label for="profileURLEdit">Profile URL</label>
                                                                <input type="text" id="profileURLEdit" name="profileURLEdit" required placeholder="http:// or https://" maxlength="200" pattern="(https?:\/\/.*\.(?:png|jpg|jpeg|PNG|JPG|JPEG))" class="form-control" value="${dto.image}">
                                                                <p>Profile URL must end with .png, .jpg or .jpeg.</p>
                                                            </div>

                                                        </div>

                                                        <div class="modal-footer">
                                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                            <input type="submit" class="btn btn-info" value="Save">
                                                        </div>
                                                </div>

                                                </form>
                                            </div>
                                        </div>
                                </div>


                                <tr>
                                    <td>
                                        ${Counter.count}
                                    </td>
                                    <td>
                                        <a href="" ><img src="${dto.image}" draggable="false" class="avatar" alt="Avatar"> 
                                            ${dto.fullName}
                                        </a>
                                    </td>
                                    <td>
                                        <c:if test="${dto.gender eq 'Male'}">
                                            <i class="fa fa-mars" style="font-size:24px;color:skyblue"></i>
                                        </c:if>
                                        <c:if test="${dto.gender eq 'Female'}">
                                            <i class="fa fa-venus" style="font-size:24px;color:red"></i>

                                        </c:if>
                                    </td>
                                    <td>
                                        ${dto.createDate}                                                
                                    </td>
                                    <td>
                                        <c:if test="${dto.role.name eq 'admin'}">
                                            <span class="label label-success">Admin</span>
                                        </c:if>
                                        <c:if test="${dto.role.name eq 'user'}">
                                            <span class="label label-info">User</span>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${dto.status eq 'active'}">
                                            <span class="status text-success">&bull;</span> Active 
                                        </c:if> 
                                        <c:if test="${dto.status eq 'inactive'}">
                                            <span class="status text-danger">&bull;</span> Inactive 
                                        </c:if>
                                    </td>
                                    <c:if test="${not empty sessionScope.USER and sessionScope.USER.role.name eq 'admin'}">
                                        <td>
                                            <a href="#editEmployeeModal${dto.id}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                            <a href="#deleteAllModel${dto.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>

                                        </td>
                                    </c:if>

                                </tr>


                            </c:if>

                            <c:if test="${not empty sessionScope.USER and sessionScope.USER.role.name eq 'user'}">
                                <tr>

                                    <td>
                                        ${Counter.count} 
                                    </td>
                                    <td>
                                        <a href="" ><img src="${dto.image}" draggable="false" class="avatar" alt="Avatar"> 
                                            ${dto.fullName}
                                        </a>

                                    </td>
                                    <td>
                                        <c:if test="${dto.gender eq 'Male'}">
                                            <i class="fa fa-mars" style="font-size:24px;color:skyblue"></i>
                                        </c:if>
                                        <c:if test="${dto.gender eq 'Female'}">
                                            <i class="fa fa-venus" style="font-size:24px;color:red"></i>

                                        </c:if>
                                    </td>
                                    <td>
                                        ${dto.createDate}                                                
                                    </td>

                                    <td>
                                        <c:if test="${dto.role.name eq 'admin'}">
                                            <span class="label label-success">Admin</span>
                                        </c:if>
                                        <c:if test="${dto.role.name eq 'user'}">
                                            <span class="label label-info">User</span>
                                        </c:if>
                                    </td>

                                    <td>
                                        <c:if test="${dto.status eq 'active'}">
                                            <span class="status text-success">&bull;</span> Active 
                                        </c:if> 
                                        <c:if test="${dto.status eq 'inactive'}">
                                            <span class="status text-danger">&bull;</span> Inactive 
                                        </c:if>

                                    </td>
                                </tr>
                            </c:if>  



                        </c:forEach>

                        </tbody>
                        </table> 
                        <c:if test="${empty requestScope.SEARCH_RESULT_ALL}">
                            <font color="red" style="text-align: center">
                            <h2>No Result</h2>
                            </font>
                        </c:if>


                        <c:if test="${not empty MSG_SUCCESS}">
                            <font color="green" style="text-align: center">
                            <h2>${MSG_SUCCESS}</h2>
                            </font>
                        </c:if>
                        <c:if test="${not empty MSG_SUCCESSS}">
                            <font color="red" style="text-align: center">
                            <h2>${MSG_SUCCESSS}</h2>
                            </font>
                            
                        </c:if>
                    </div>

                    <div id="admin" class="tab-pane fade"> 
                        <br/>
                        <div class="container">
                            <form action="searchAdmin" method="post" novalidate id="searchAdminForm">
                                <div class="row" >
                                    <div class="col-lg-12"> 
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-12 p-0" >
                                                <input type="text" class="form-control search-slt" placeholder="Enter name" pattern="[^'\x22]+" name="txtNameAdmin" value="${param.txtNameAdmin}"  >
                                            </div>

                                            <div class="col-lg-3 col-md-3 col-sm-12 p-0" >
                                                <input type="submit" value="Search" class="btn btn-danger wrn-btn" class="form-control search-slt" />
                                                <input type="reset" value="Reset" class="btn btn-primary wrn-btn" class="form-control search-slt"/>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Date Created</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                        <c:if test="${not empty sessionScope.USER and sessionScope.USER.role.name eq 'admin'}"> 
                                        <th>Actions</th>
                                        </c:if>

                                </tr>
                            </thead>

                            <tbody>

                                <c:forEach var="dto" items="${requestScope.SEARCH_RESULT_ADMIN}" varStatus="Counter">
                                    <c:if test="${not empty sessionScope.USER and sessionScope.USER.role.name eq 'admin'}">

                                        <!-- Edit Modal HTML -->
                                    <div id="editEmployeeModal${dto.id}" class="modal fade">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form action="editUser" method="POST">
                                                    <input type="hidden" name="txtId" value="${dto.id}" />
                                                    <input type="hidden" name="txtNameAll" value="${param.txtNameAll}" />
                                                    <div class="modal-header">						
                                                        <h4 class="modal-title" style="color: #079284">Edit Employee</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    </div>
                                                    <p style="text-align: center; margin-top: 20px"><img src="${dto.image}" draggable="false" style="height: 150px; width: 150px;" /></p>
                                                    <div class="modal-body">

                                                        <div class="form-group">
                                                            <label for="fullNameEdit">Full Name</label>
                                                            <input type="text" id="fullNameEdit" name="txtFullNameEdit" class="form-control" required value="${dto.fullName}">
                                                            <p>Fullname must be 4-30 characters in length.</p>
                                                            <span id='messageFullName'></span>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="inlineRadio1">Gender</label>
                                                            <br/>
                                                            <c:if test="${dto.gender eq 'Male'}">
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioGenderOptionsEdit"  id="inlineRadio1" value="Male" checked="checked">
                                                                    <label class="form-check-label"  for="inlineRadio1">Male</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioGenderOptionsEdit" id="inlineRadio2" value="Female">
                                                                    <label class="form-check-label" for="inlineRadio2">Female</label>
                                                                </div>
                                                            </c:if>

                                                            <c:if test="${dto.gender eq 'Female'}">
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioGenderOptionsEdit" id="inlineRadio1" value="Male" >
                                                                    <label class="form-check-label"  for="inlineRadio1">Male</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioGenderOptionsEdit" id="inlineRadio2" value="Female" checked="checked">
                                                                    <label class="form-check-label" for="inlineRadio2">Female</label>
                                                                </div>
                                                            </c:if>


                                                        </div>
                                                        <div class="form-group">
                                                            <label>Date Created</label>
                                                            <input type="text" class="form-control" value="${dto.createDate}" readonly>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="inlineRadioRole1">Role</label>
                                                            <br/>
                                                            <c:if test="${dto.role.name eq 'admin'}">
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole1" value="Admin" checked="checked">
                                                                    <label class="form-check-label"  for="inlineRadioRole1"><span class="label label-success" for="inlineRadioRole1">Admin</span></label>

                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole2" value="User">
                                                                    <label class="form-check-label" for="inlineRadioRole2"><span class="label label-info" for="inlineRadioRole2">User</span></label>

                                                                </div>
                                                            </c:if>

                                                            <c:if test="${dto.role.name eq 'user'}">
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole1" value="Admin" >
                                                                    <label class="form-check-label"  for="inlineRadioRole1"><span class="label label-success" for="inlineRadioRole1">Admin</span></label>

                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole2" value="User" checked="checked">
                                                                    <label class="form-check-label" for="inlineRadioRole2"><span class="label label-info" for="inlineRadioRole2">User</span></label>

                                                                </div>
                                                            </c:if>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="inlineRadioStatus1">Status</label>
                                                            <br/>
                                                            <c:if test="${dto.status eq 'active'}">
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus1" value="active" checked="checked">
                                                                    <label class="form-check-label"  for="inlineRadioStatus1">Active</label>

                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus2" value="inactive">
                                                                    <label class="form-check-label" for="inlineRadioStatus2">Inactive</label>

                                                                </div>
                                                            </c:if>

                                                            <c:if test="${dto.status eq 'inactive'}">
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus1" value="active" >
                                                                    <label class="form-check-label"  for="inlineRadioStatus1">Active</label>

                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus2" value="inactive" checked="checked">
                                                                    <label class="form-check-label" for="inlineRadioStatus2">Inactive</label>

                                                                </div>
                                                            </c:if>




                                                        </div>
                                                        <div class="form-group">
                                                            <label for="profileURLEdit">Profile URL</label>
                                                            <input type="text" id="profileURLEdit" name="profileURLEdit" required placeholder="http:// or https://" maxlength="200" pattern="(https?:\/\/.*\.(?:png|jpg|jpeg|PNG|JPG|JPEG))" class="form-control" value="${dto.image}">
                                                            <p>Profile URL must end with .png, .jpg or .jpeg.</p>
                                                        </div>

                                                    </div>

                                                    <div class="modal-footer">
                                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                        <input type="submit" class="btn btn-info" value="Save">
                                                    </div>
                                            </div>

                                            </form>
                                        </div>
                                    </div>
                            </div>

                            <!--         Delete Modal HTML -->
                            <div id="deleteAllModel${dto.id}" class="modal fade">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="deleteAll" method="POST">
                                            <input type="hidden" name="txtId" value="${dto.id}" />
                                            <input type="hidden" name="txtNameAll" value="${param.txtNameAll}" />

                                            <div class="modal-header">						
                                                <h3 class="modal-title" style="color: red"><i class="material-icons">warning</i>Warning</h3>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            </div>
                                            <div class="modal-body">					
                                                <p>Are you sure you want to delete this user?</p> 
                                                <p class="text-warning"><small>This action cannot be undone.</small></p>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                <input type="submit" class="btn btn-danger" value="Delete">
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>

                            <tr>

                                <td>
                                    ${Counter.count}
                                </td>
                                <td>
                                    <a href="" >
                                        <img alt="Avatar" src="${dto.image}" class="avatar"> 
                                        ${dto.fullName}
                                    </a>
                                </td>
                                <td>
                                    <c:if test="${dto.gender eq 'Male'}">
                                        <i class="fa fa-mars" style="font-size:24px;color:skyblue"></i>
                                    </c:if>
                                    <c:if test="${dto.gender eq 'Female'}">
                                        <i class="fa fa-venus" style="font-size:24px;color:red"></i>

                                    </c:if>
                                </td>
                                <td>
                                    ${dto.createDate}                                                
                                </td>

                                <td>
                                    <c:if test="${dto.role.name eq 'admin'}">
                                        <span class="label label-success">Admin</span>
                                    </c:if>
                                    <c:if test="${dto.role.name eq 'user'}">
                                        <span class="label label-info">User</span>
                                    </c:if>
                                </td>

                                <td>
                                    <c:if test="${dto.status eq 'active'}">
                                        <span class="status text-success">&bull;</span> Active 
                                    </c:if> 
                                    <c:if test="${dto.status eq 'inactive'}">
                                        <span class="status text-danger">&bull;</span> Inactive 
                                    </c:if>

                                </td>
                                <c:if test="${not empty sessionScope.USER and sessionScope.USER.role.name eq 'admin'}">
                                    <td>
                                        <a href="#editEmployeeModal${dto.id}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="#deleteAllModel${dto.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:if>
                        <c:if test="${not empty sessionScope.USER and sessionScope.USER.role.name eq 'user'}">
                            <tr>

                                <td>
                                    ${Counter.count}
                                </td>
                                <td>
                                    <a href="" >
                                        <img alt="Avatar" src="${dto.image}" class="avatar"> 
                                        ${dto.fullName}
                                    </a>
                                </td>
                                <td>
                                    <c:if test="${dto.gender eq 'Male'}">
                                        <i class="fa fa-mars" style="font-size:24px;color:skyblue"></i>
                                    </c:if>
                                    <c:if test="${dto.gender eq 'Female'}">
                                        <i class="fa fa-venus" style="font-size:24px;color:red"></i>

                                    </c:if>
                                </td>
                                <td>
                                    ${dto.createDate}                                                
                                </td>

                                <td>
                                    <c:if test="${dto.role.name eq 'admin'}">
                                        <span class="label label-success">Admin</span>
                                    </c:if>
                                    <c:if test="${dto.role.name eq 'user'}">
                                        <span class="label label-info">User</span>
                                    </c:if>
                                </td>

                                <td>
                                    <c:if test="${dto.status eq 'active'}">
                                        <span class="status text-success">&bull;</span> Active 
                                    </c:if> 
                                    <c:if test="${dto.status eq 'inactive'}">
                                        <span class="status text-danger">&bull;</span> Inactive 
                                    </c:if>

                                </td>

                            </tr>
                        </c:if>

                    </c:forEach>

                    </tbody>
                    </table> 
                    <c:if test="${empty requestScope.SEARCH_RESULT_ADMIN}">
                        <font color="red" style="text-align: center">
                        <h2>No Result</h2>
                        </font>
                    </c:if>
                </div> 
                <div id="user" class="tab-pane fade">  
                    <br/>
                    <div class="container">
                        <form action="searchUser" method="post" novalidate>
                            <div class="row" >
                                <div class="col-lg-12"> 
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-12 p-0" >
                                            <input type="text" class="form-control search-slt" placeholder="Enter name" pattern="[^'\x22]+"   name="txtNameUser" value="${param.txtNameUser}"  >
                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-12 p-0" >
                                            <input type="submit" value="Search" class="btn btn-danger wrn-btn" class="form-control search-slt" />
                                            <input type="reset" value="Reset" class="btn btn-primary wrn-btn" class="form-control search-slt"/>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>Date Created</th>
                                <th>Role</th>
                                <th>Status</th>
                                    <c:if test="${sessionScope.USER.role.name eq 'admin'}"> 
                                    <th>Actions</th>
                                    </c:if>

                            </tr>
                        </thead>

                        <tbody>


                            <c:forEach var="dto" items="${requestScope.SEARCH_RESULT_USER}" varStatus="Counter">
                                <c:if test="${not empty sessionScope.USER and sessionScope.USER.role.name eq 'admin'}">

                                    <!-- Edit Modal HTML -->
                                <div id="editEmployeeModal${dto.id}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="editUser" method="POST">
                                                <input type="hidden" name="txtId" value="${dto.id}" />
                                                <input type="hidden" name="txtNameAll" value="${param.txtNameAll}" />
                                                <div class="modal-header">						
                                                    <h4 class="modal-title" style="color: #079284">Edit Employee</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <p style="text-align: center; margin-top: 20px"><img src="${dto.image}" draggable="false" style="height: 150px; width: 150px;" /></p>
                                                <div class="modal-body">

                                                    <div class="form-group">
                                                        <label for="fullNameEdit">Full Name</label>
                                                        <input type="text" id="fullNameEdit" name="txtFullNameEdit" class="form-control" required value="${dto.fullName}">
                                                        <p>Fullname must be 4-30 characters in length.</p>
                                                        <span id='messageFullName'></span>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inlineRadio1">Gender</label>
                                                        <br/>
                                                        <c:if test="${dto.gender eq 'Male'}">
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioGenderOptionsEdit"  id="inlineRadio1" value="Male" checked="checked">
                                                                <label class="form-check-label"  for="inlineRadio1">Male</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioGenderOptionsEdit" id="inlineRadio2" value="Female">
                                                                <label class="form-check-label" for="inlineRadio2">Female</label>
                                                            </div>
                                                        </c:if>

                                                        <c:if test="${dto.gender eq 'Female'}">
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioGenderOptionsEdit" id="inlineRadio1" value="Male" >
                                                                <label class="form-check-label"  for="inlineRadio1">Male</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioGenderOptionsEdit" id="inlineRadio2" value="Female" checked="checked">
                                                                <label class="form-check-label" for="inlineRadio2">Female</label>
                                                            </div>
                                                        </c:if>


                                                    </div>
                                                    <div class="form-group">
                                                        <label>Date Created</label>
                                                        <input type="text" class="form-control" value="${dto.createDate}" readonly>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="inlineRadioRole1">Role</label>
                                                        <br/>
                                                        <c:if test="${dto.role.name eq 'admin'}">
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole1" value="Admin" checked="checked">
                                                                <label class="form-check-label"  for="inlineRadioRole1"><span class="label label-success" for="inlineRadioRole1">Admin</span></label>

                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole2" value="User">
                                                                <label class="form-check-label" for="inlineRadioRole2"><span class="label label-info" for="inlineRadioRole2">User</span></label>

                                                            </div>
                                                        </c:if>

                                                        <c:if test="${dto.role.name eq 'user'}">
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole1" value="Admin" >
                                                                <label class="form-check-label"  for="inlineRadioRole1"><span class="label label-success" for="inlineRadioRole1">Admin</span></label>

                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioRoleOptions" id="inlineRadioRole2" value="User" checked="checked">
                                                                <label class="form-check-label" for="inlineRadioRole2"><span class="label label-info" for="inlineRadioRole2">User</span></label>

                                                            </div>
                                                        </c:if>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="inlineRadioStatus1">Status</label>
                                                        <br/>
                                                        <c:if test="${dto.status eq 'active'}">
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus1" value="active" checked="checked">
                                                                <label class="form-check-label"  for="inlineRadioStatus1">Active</label>

                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus2" value="inactive">
                                                                <label class="form-check-label" for="inlineRadioStatus2">Inactive</label>

                                                            </div>
                                                        </c:if>

                                                        <c:if test="${dto.status eq 'inactive'}">
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus1" value="active" >
                                                                <label class="form-check-label"  for="inlineRadioStatus1">Active</label>

                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="radioStatusOptions" id="inlineRadioStatus2" value="inactive" checked="checked">
                                                                <label class="form-check-label" for="inlineRadioStatus2">Inactive</label>

                                                            </div>
                                                        </c:if>




                                                    </div>
                                                    <div class="form-group">
                                                        <label for="profileURLEdit">Profile URL</label>
                                                        <input type="text" id="profileURLEdit" name="profileURLEdit" required placeholder="http:// or https://" maxlength="200" pattern="(https?:\/\/.*\.(?:png|jpg|jpeg|PNG|JPG|JPEG))" class="form-control" value="${dto.image}">
                                                        <p>Profile URL must end with .png, .jpg or .jpeg.</p>
                                                    </div>

                                                </div>

                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                    <input type="submit" class="btn btn-info" value="Save">
                                                </div>
                                        </div>

                                        </form>
                                    </div>
                                </div>
                        </div> 

                        <!--         Delete Modal HTML -->
                        <div id="deleteAllModel${dto.id}" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="deleteAll" method="POST">
                                        <input type="hidden" name="txtId" value="${dto.id}" />
                                        <input type="hidden" name="txtNameAll" value="${param.txtNameAll}" />

                                        <div class="modal-header">						
                                            <h3 class="modal-title" style="color: red"><i class="material-icons">warning</i>Warning</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">					
                                            <p>Are you sure you want to delete this user?</p> 
                                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                            <input type="submit" class="btn btn-danger" value="Delete">
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                        <tr>
                            <td>
                                ${Counter.count}
                            </td>
                            <td>
                                <a href="" ><img src="${dto.image}" draggable="false" class="avatar" alt="Avatar"> 
                                    ${dto.fullName}
                                </a>

                            </td>
                            <td>
                                <c:if test="${dto.gender eq 'Male'}">
                                    <i class="fa fa-mars" style="font-size:24px;color:skyblue"></i>
                                </c:if>
                                <c:if test="${dto.gender eq 'Female'}">
                                    <i class="fa fa-venus" style="font-size:24px;color:red"></i>

                                </c:if>
                            </td>
                            <td>
                                ${dto.createDate}                                                
                            </td>

                            <td>
                                <c:if test="${dto.role.name eq 'admin'}">
                                    <span class="label label-success">Admin</span>
                                </c:if>
                                <c:if test="${dto.role.name eq 'user'}">
                                    <span class="label label-info">User</span>
                                </c:if>
                            </td>

                            <td>
                                <c:if test="${dto.status eq 'active'}">
                                    <span class="status text-success">&bull;</span> Active 
                                </c:if> 
                                <c:if test="${dto.status eq 'inactive'}">
                                    <span class="status text-danger">&bull;</span> Inactive 
                                </c:if>

                            </td>
                            <c:if test="${not empty sessionScope.USER and sessionScope.USER.role.name eq 'admin'}">
                                <td>
                                    <a href="#editEmployeeModal${dto.id}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="#deleteAllModel${dto.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </c:if>
                        </tr>
                    </c:if>
                    <c:if test="${not empty sessionScope.USER and sessionScope.USER.role.name eq 'user'}">
                        <tr>

                            <td>
                                ${Counter.count}
                            </td>
                            <td>
                                <a href="" ><img src="${dto.image}" draggable="false" class="avatar" alt="Avatar"> 
                                    ${dto.fullName}
                                </a>

                            </td>
                            <td>
                                <c:if test="${dto.gender eq 'Male'}">
                                    <i class="fa fa-mars" style="font-size:24px;color:skyblue"></i>
                                </c:if>
                                <c:if test="${dto.gender eq 'Female'}">
                                    <i class="fa fa-venus" style="font-size:24px;color:red"></i>

                                </c:if>
                            </td>
                            <td>
                                ${dto.createDate}                                                
                            </td>

                            <td>
                                <c:if test="${dto.role.name eq 'admin'}">
                                    <span class="label label-success">Admin</span>
                                </c:if>
                                <c:if test="${dto.role.name eq 'user'}">
                                    <span class="label label-info">User</span>
                                </c:if>
                            </td>

                            <td>
                                <c:if test="${dto.status eq 'active'}">
                                    <span class="status text-success">&bull;</span> Active 
                                </c:if> 
                                <c:if test="${dto.status eq 'inactive'}">
                                    <span class="status text-danger">&bull;</span> Inactive 
                                </c:if>

                            </td>

                        </tr>
                    </c:if>
                </c:forEach>


                </tbody>
                </table> 
                <c:if test="${empty requestScope.SEARCH_RESULT_USER}">
                    <font color="red" style="text-align: center">
                    <h2>No Result</h2>
                    </font>
                </c:if>
            </div>
        </div>

        <div class="clearfix">
            <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
            <ul class="pagination">
                <li class="page-item disabled"><a href="" class="page-link">Previous</a></li>
                <li class="page-item active"><a href="" class="page-link">1</a></li>
                <li class="page-item disabled"><a href="" class="page-link">2</a></li>
                <li class="page-item disabled"><a href="" class="page-link">3</a></li>
                <li class="page-item disabled"><a href="" class="page-link">4</a></li>
                <li class="page-item disabled"><a href="" class="page-link">5</a></li>
                <li class="page-item disabled"><a href="" class="page-link">Next</a></li>
            </ul>
        </div>
    </div>
</div>
</div> 


<!-- Add Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="addNewUser" method="POST">
                <div class="modal-header">						
                    <h4 class="modal-title" style="color: green">Add Employee</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userID">
                            UserID<i style="color: red">*</i>
                        </label>
                        <input type="text" id="userID" name="txtUserID" class="form-control" maxlength="50" pattern="[a-zA-Z]{2,50}" required >
                        <span class="invalid-feedback"></span>
                        <p>UserID must be 2-50 characters in length.</p>
                        <font color="red"><%=userError.getUserIDError()%></font>
                        <span id='messageUserID'></span>
                    </div>
                    <div class="form-group">
                        <label for="password">Password<i style="color: red">*</i></label>
                        <input type="password" id="password" name="txtPassword" class="form-control" onkeyup='check();' pattern="[a-zA-Z]{1,}" maxlength="64" required >
                        <p>Password must must contain 1 or more characters.</p>

                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm password<i style="color: red">*</i></label>
                        <input type="password" id="confirmPassword" name="txtConfirmPassword" class="form-control" onkeyup='check();' maxlength="64" required >
                        <span id='messagePassword'></span>


                    </div>
                    <div class="form-group">
                        <label for="fullName">
                            Full Name<i style="color: red">*</i>
                        </label>
                        <input type="text" id="fullName" name="txtFullName" class="form-control" maxlength="30" pattern="[a-zA-Z\s]{4,30}" required >
                        <span class="invalid-feedback"></span>
                        <p>Fullname must be 4-30 characters in length.</p>
                        <span id='messageFullName'></span>
                    </div>

                    <div class="form-group">
                        <label for="inlineRadio1">Gender<i style="color: red">*</i></label>
                        <br/>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="radioGenderOptions" id="inlineRadio1" value="Male" checked="checked">
                            <label class="form-check-label"  for="inlineRadio1">Male</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="radioGenderOptions" id="inlineRadio2" value="Female">
                            <label class="form-check-label" for="inlineRadio2">Female</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="profileURL">Profile URL</label>
                        <input type="url" id="profileURL" name="txtProfileURL" class="form-control" placeholder="http:// or https://" maxlength="200" pattern="(https?:\/\/.*\.(?:png|jpg|jpeg|PNG|JPG|JPEG))">
                        <p>Profile URL must end with .png, .jpg or .jpeg.</p>
                        <span id='messageProfileURL'></span>
                    </div>					
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add" id="btnSubmitAddNew" onkeyup='check();'>
                </div>
            </form>
        </div>
    </div>
</div>


<!--         Delete Modal HTML -->
<!--        <div id="deleteAllModel" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="deleteAll" method="POST">
                        <input type="hidden" name="txtId" value="${dto.id}" />
                        <input type="hidden" name="txtNameAll" value="${param.txtNameAll}" />

                        <div class="modal-header">						
                            <h3 class="modal-title" style="color: red"><i class="material-icons">warning</i>Warning</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete this user?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>-->

</body> 
</html>
