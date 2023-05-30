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

        <title>Contacts List</title>
    </head>




    <body>

        <header id="home">
            <jsp:include page="include/header.jsp" />
        </header>    

        <section id="list" class="offset container-fluid">

            <div class="container">
                        <c:if test="${param.act eq 'csv'}">
                    <div class="d-flex justify-content-center">
                        <div class="alert alert-success px-auto mt-0">
                            <strong>Contact Saved Successfully! </strong>
                        </div>
                    </div>
                </c:if>
                        
                        <c:if test="${param.act eq 'del'}">
                    <div class="d-flex justify-content-center">
                        <div class="alert alert-success px-auto mt-1">
                            <strong>Contact Deleted Successfully! </strong>
                        </div>
                    </div>
                </c:if>
                        
                        <c:if test="${param.act eq 'ed'}">
                    <div class="d-flex justify-content-center">
                        <div class="alert alert-success px-auto mt-1">
                            <strong>Contact Edited Successfully! </strong>
                        </div>
                    </div>
                </c:if>
            </div>

            <div class="list-view">
                <div class="list_heading">
                    <h3>Contacts List</h3>
                </div>

                <form action="<t:url value="/user/contact_search" />">
                        <div class="form-row">
                        <div class="from-group col-md-10">
                            <input type="text" class="form-control" name="freeText" value="${param.freeText}" placeholder="Enter text to Search" />
                     </div>
                        <div class="form-group col-md-2">
                            <button type="button" class="btn btn-danger"><i class="fa fa-search"></i></button>
                        </div>

                    </div>
                </form>
                      
                <form action="<t:url value="/user/bulk_contact_delete" />">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th><button><i class="fa fa-trash"></i></button></th>
                                <th>CID</th>
                                <th>NAME</th>
                                <th>PHONE</th>
                                <th>EMAIL</th>
                                <th>ADDRESS</th>
                                <th>REMARK</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:if test="${empty contactList}">
                                <tr>
                                    <td colspan="8">
                                        <p class="error" align="center"> No Record Found ! </p>
                                    </td>
                                </tr>
                            </c:if>

                            <c:forEach var="contact" items="${contactList}" varStatus="st">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="cid" value="${contact.contactId}" />
                                    </td>
                                    <td>${contact.contactId}</td>
                                    <td>${contact.name}</td>
                                    <td>${contact.phone}</td>
                                    <td>${contact.email}</td>
                                    <td>${contact.address}</td>
                                    <td>${contact.remark}</td>

                                    <t:url var="url_del" value="/user/del_contact">
                                        <t:param name="cid" value="${contact.contactId}" />
                                    </t:url>
                                    <t:url var="url_edit" value="/user/edit_contact">
                                        <t:param name="cid" value="${contact.contactId}"/>
                                    </t:url>

                                    <td>
                                        <a href="${url_edit}"> <i class="fa fa-edit"></i> </a>  <span>|</span> 
                                        <a href="${url_del}"> <i class="fa fa-trash"></i> </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>


                    </table>
                </form>
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
