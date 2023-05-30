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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


        <u:url var="url_css" value="/static/css/index_style.css"></u:url>
        <link rel="stylesheet" href="${url_css}" type="text/css">

        <title>Users List</title>

        <script>
            function changeStatus(userId, loginStatus) {
                //alert(userId+" , "+loginStatus);
                $.ajax({
                    url: 'change_status',
                    data: {userId: userId, loginStatus: loginStatus},
                    success: function (data) {
                        alert(data);
                    }
                });
            }

        </script>
    </head>



    <body>

        <header id="home">
            <jsp:include page="include/header.jsp" />
        </header>    

        <section class="container-fluild  body_bg_img row section">

            <div class=" col-md-10 offset-md-1  login_form  mr-auto mt-3 mb-3">

                <h3 class="text-primary mt-3 mb-4" align="center">Users List</h3>

                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">User ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Address</th>
                            <th scope="col">Login Name</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>


                        <c:if test="${empty usersList}">
                            <tr>
                                <td colspan="8">
                                    <p class="error" align="center"> No Record Found ! </p>
                                </td>
                            </tr>
                        </c:if>


                        <c:forEach var="user" items="${usersList}" varStatus="st">
                            <tr>
                                <td>${st.count}</td>
                                <td>${user.userId}</td>
                                <td>${user.name}</td>
                                <td>${user.phone}</td>
                                <td>${user.email}</td>
                                <td>${user.address}</td>
                                <td>${user.loginName}</td>
                                <td>
                                    <select id="id_${user.userId}"  onchange="changeStatus(${user.userId}, $(this).val())">
                                        <option value="1">Active</option>
                                        <option value="2">Block</option>
                                    </select>  
                                    <script>
                                        $('#id_${user.userId}').val('${user.loginStatus}');
                                    </script>

                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
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