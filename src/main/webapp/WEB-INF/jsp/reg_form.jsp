<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="u" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

    <head>        

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <u:url var="url_css" value="/static/css/index_style.css"></u:url>
        <link rel="stylesheet" href="${url_css}" type="text/css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <title>Registration page</title>
        
        <script>
            $(document).ready(function () {

                $("#id_check_avail").click(function () {
                    $.ajax({
                        url: 'check_avail',
                        data: {loginName: $("#id_loginName").val()},
                        success: function (data) {
                            $("#id_valid_msg").html(data);
                        }

                    });

                });
            });
        </script>
    </head>
   
    <body>

        <header id="home">
            <jsp:include page="include/header.jsp" />
        </header>      

    <section class="section">
                    
        <div class="container">
            <c:if test="${err!=null}">
                <div class="d-flex justify-content-center">
                    <div class="alert alert-danger px-auto mt-1">
                        <strong>${err}</strong>
                    </div>
                </div>
            </c:if>

            <div class=" col-md-8 offset-md-2  login_form  mr-auto mt-3 mb-3">

                <h3 class="text-primary mt-3 mb-4"><center>User Registration</center></h3>

                <u:url var="url_reg" value="/register" />
                <f:form action="register"  modelAttribute="command">
                    <div class="form-group">
                        <f:input path="user.name" class="form-control" placeholder="Enter Full Name" required="true"/>
                        <div class="validation-feedback"></div>
                    </div>  

                    <div class="form-group">
                        <f:input path="user.phone" class="form-control" placeholder="Enter Phone No." required="true"/>
                        <div class="validation-feedback"></div>
                    </div>

                    <div class="from-group">
                        <f:input path="user.email" class="form-control" placeholder="Enter Email Address" required="true"/>
                        <div class="validation-feedback"></div>
                    </div>

                    <div class="from-group">
                        <f:textarea path="user.address" class="form-control mt-3" placeholder="Enter your Full Address" required="true"/>
                        <div class="validation-feedback"></div>
                    </div>
                    <div class="form-group">
                        <div class="from-group">
                            <f:input path="user.loginName" id="id_loginName" class="form-control" placeholder="Enter your Login Name" required="true"/>
                            <div class="validation-feedback" id="id_valid_msg"></div>
                        </div>

                    </div>

                    <div class="form-group">
                        <f:input path="user.password" class="form-control" placeholder="Enter your Password" required="true"/>
                        <div class="validation-feedback"></div>
                    </div>
                    <div class="form-group form-check">
                        <input class="form-check-input" type="checkbox" name="remember" required="true"><p class="text-danger"> I agree that I have filled all my information fields honestly & correctly.</p>
                        <div class="validation-feedback"></div>

                    </div>  

                        <button type="submit" class="btn btn-primary" align=center">Submit</button>
                </div>
            </f:form>
        </div>
    </section>

        <footer id="footer" class="offset">
            <jsp:include page="include/footer.jsp" />
        </footer>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


    </body>
</html>
