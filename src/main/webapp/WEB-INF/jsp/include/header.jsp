<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="t" %>


<t:url var="url_home" value="/index" />
<t:url var="url_logout" value="/logout" />

<h1> <center>CardHop</center> </h1>
<div class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="${url_home}"><div class="diary_logo"></div></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarresponsive">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarresponsive">
        <ul class="navbar-nav ml-auto">
            
            <c:if test="${sessionScope.userId==null}">
                <li class="nav-item">
                    <a class="nav-link" href="${url_home}">Home</a>
                </li>

                <li class="nav-item">
                    <t:url var="url_login_form" value="/login_form" />
                    <a class="nav-link" href="${url_login_form}">Login</a>
                </li>

                <li class="nav-item">
                    <t:url var="url_reg_form" value="/reg_form" />
                    <a class="nav-link" href="${url_reg_form}">Sign up for FREE</a>
                </li>
            </c:if>

            <t:url var="url_admin_home" value="/admin/dashboard" />
            <t:url var="url_ulist" value="/user/list"/>
            <c:if test="${sessionScope.userId!=null && sessionScope.role == 1}">

                <li class="nav-item">
                    <a href="${url_admin_home}" class="nav-link text-white"> Home </a>
                </li>
                <li class="nav-item">
                    <a href="${url_ulist}" class="nav-link text-white">Users List</a>
                </li>
                <li class="nav-item">
                    <a href="${url_logout}" class="nav-link text-white">Logout</a>
                </li>

            </c:if>

            <t:url var="url_user_home" value="/user/dashboard" />
            <t:url var="url_contact_form" value="/user/contact_form" />
            <t:url var="url_user_clist" value="/user/contact_list" />

            <c:if test="${sessionScope.userId!=null && sessionScope.role == 2}">

                <li class="nav-item">
                    <a class="nav-link" href="${url_user_home}"> Home </a>
                </li>
                <li class="nav-item">
                    <a href="${url_contact_form}" class="nav-link text-white">Add Contacts</a>
                </li>
                <li class="nav-item">
                    <a href="${url_user_clist}" class="nav-link text-white">List Contacts</a>
                </li>
                <li class="nav-item">
                    <a href="${url_logout}" class="nav-link text-white">Logout</a>
                </li>

            </c:if>
        </ul>
    </div>
</div>