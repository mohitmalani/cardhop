<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="t" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <t:url var="url_css" value="/static/css/index_style.css"></t:url>
        <link rel="stylesheet" href="${url_css}" type="text/css">

        <title>Login page</title>
    </head>
    
    <body>

        <div id="home">
            <jsp:include page="include/header.jsp" />
        </div>    

        <section class="section">
            <div class="container">

                <c:if test="${err!=null}">
                    <div class="d-flex justify-content-center">
                        <div class="alert alert-danger px-auto mt-1">
                            <strong>${err}</strong>
                        </div>
                    </div>
                </c:if>


                <div class="row">
                    <div class="col-md-4 offset-md-4 login_form  mt-3"">

                        <t:url var="url_login" value="/login" />
                        <f:form action="${url_login}" modelAttribute="command">
                            <div class="form-group mt-3">

                                <center class="pb-3 text-danger">User Login</center>

                                <label for="loginName">User Name :</label>
                                <f:input path="loginName" class="form-control" placeholder="Login Name" />
                            </div>

                            <div class="form-group">
                                <label for="password">Password :</label>
                                <f:password path="password" class="form-control" placeholder="Password" />
                                
                            </div>

                            <div class="form-group">
                                <input type="submit" class="btn btn-primary" value="Sign In" />

                            </div>
                        </f:form>
                    </div>
                </div>
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
