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

        <header id="home">
            <jsp:include page="include/header.jsp" />
        </header> 

        <section id="contact" class="offset container-fluid">
            
            <div class="container">

                <c:if test="${err!=null}">
                    <div class="d-flex justify-content-center">
                        <div class="alert alert-danger px-auto mt-1">
                            <strong>${err}</strong>
                        </div>
                    </div>
                </c:if>
            </div>
           
            <div class="contact-form">
                <div class="col-12 text-center">
                    <h3 class="heading text-left">Add Contact</h3>
                </div>
                        <t:url var="url_contact_save" value="/user/contact_save" />
                        <f:form class="form" action="${url_contact_save}" modelAttribute="command">
                    <div class="form-row">
                        <div class="form-group col-md-6 col-lg-6 co-sm-6">
                            <label for="inputName">Name</label>
                            <f:input type="text" path="name" class="form-control" placeholder="Enter Contact's Full Name" required="true" />
                        </div>
                        <div class="form-group col-md-6 col-lg-6 col-sm-6">
                            <label for="inputPhone">Phone</label>
                            <f:input type="text" path="phone" class="form-control" placeholder="Enter Contact's Phone No" required="true" />
                        </div>
                    </div>

                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                        <label for="inputEmail">Email</label>
                        <f:input type="email" path="email" class="form-control" placeholder="Enter Contact's Email Address" required="true" />
                    </div>

                    <div class="form-group col-md-12 col-lg-12 col-12 co-sm-12">
                        <label for="inputAddress">Address</label>
                        <f:textarea path="address" class="form-control" rows="2" placeholder="Type Contact's Address here" required="true" />
                    </div>

                    <div class="form-group col-md-12 col-lg-12 col-12 co-sm-12">
                        <label for="inputMessage">Remarks</label>
                        <f:textarea path="remark" class="form-control" rows="3" placeholder="Type Contact's Remarks here" required="true" />
                    </div>

                    <button type="submit" class="btn btn-primary">Save --->></button>
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
