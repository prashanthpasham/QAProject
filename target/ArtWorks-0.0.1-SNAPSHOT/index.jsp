<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>"/>
         <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
    <style>
    legend.scheduler-border {
    width:inherit; /* Or auto */
    padding:0 10px; /* To give a bit of padding on the left and right */
    border-bottom:none;
}
    </style>
    </head>
    <body>
    
    <div class="row">
    <div class="col-md-12">
       <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Discussion Form</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       <!--  <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
       
      </ul>
    
      <ul class="nav navbar-nav navbar-right">
        <li>
          <a class="btn btn-danger" data-toggle="modal" data-target="#myModal" style="margin:5px;padding:10px;width:100px;color:white">LOGIN</a>
        </li>
         <li>
          <a class="btn btn-danger" data-toggle="modal" data-target="#myModal1" style="margin-top:5px;padding:10px;width:100px;color:white">REGISTER</a>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>
</div>
<div class="row" id="login">
<div class="col-md-12">
<div class="col-md-4"></div>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content ">
    <div class="modal-header">
    <h3>Login Here..
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </h3></div>
      <div class="modal-body jumbotron">
<!-- <div class="col-md-4 jumbotron"> -->
 
    ${error}
<form action="login.do" method="post" onsubmit="return logval()">
<div class="form-group">
  <input type="text" id="loguser" name="username" class="form-control" placeholder="username">
</div>
<div class="form-group">
  <input type="password" id="logpwd" name="password" class="form-control" placeholder="password">
</div>
<div class="form-group">
  <button type="submit" class="btn btn-primary" style="width:100px;padding:10px 10px;">LOGIN</button>
</div>
</form>
<!-- </div> -->
</div>
</div>
</div>
</div>
</div>
</div>
    
    <!-- register here -->
    <div class="row" id="register">
<div class="col-md-12">
<div class="col-md-4"></div>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal1">
  <div class="modal-dialog" role="document">
    <div class="modal-content ">
    <div class="modal-header">
    <h4 class="modal-title">Register Here..</h4>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="modal-body jumbotron">
<!-- <div class="col-md-4 jumbotron"> -->
<form action="register.do" method="post" onsubmit="return regval()">

<div class="form-group">
  <input type="text" id="reguser" name="username" class="form-control" placeholder="username">
</div>
<div class="form-group">
  <input type="password" id="regpwd" name="password" class="form-control" placeholder="password">
</div>
<div class="form-group">
  <button class="btn btn-primary" style="width:100px;padding:10px 10px;">REGISTER</button>
</div>
</form>
<!-- </div> -->
</div> 
</div>
</div>
</div>
</div>
</div>

<!-- comments -->
<div class="container">
<div class="col-md-12">
<div class="col-md-2"></div>
<div class="col-md-8">
<table>
  <c:forEach items="${posts}" var="item">
    <tr>
      <td><a href="question.do" ><c:out value="${item.postedQuestion}" /></a></td>
    </tr>
  </c:forEach>
</table>
</div>
</div>
</div>
<!-- post comment -->
<div class="container">
<div class="col-md-12">
<fieldset class="scheduler-border">
<legend class="scheduler-border">Join Discussion Form</legend>
<form  method="post" action="post/savepost.do" onsubmit="return ques()">
<c:if test="${message!=null}">
<div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>${message}</strong> 
</div>
</c:if>
<div class="form-group">
<textarea class="form-control" name="question" id="question" cols="5" rows="10" placeholder="Post a Question to Discussion"></textarea>
</div>
<div class="form-group">
<button type="submit"  class="btn btn-danger"   style="wisth:400px;padding:10px 10px;" >Post a Question</button>
</div>
</form>
</fieldset>
</div>
</div>
<script>
function logval(){
	
	if(document.getElementById("loguser").value==""||document.getElementById("loguser").value==undefined){
		alert("please enter a username");
		return false;
	}else if(document.getElementById("logpwd").value==""||document.getElementById("logpwd").value==undefined){
		alert("please enter a password");
		return false;
	}
		return true;
	
}
function regval(){
	if(document.getElementById("reguser").value==""||document.getElementById("reguser").value==undefined){
		alert("please enter a username");
		return false;
	}else if(document.getElementById("regpwd").value==""||document.getElementById("regpwd").value==undefined){
		alert("please enter a password");
		return false;
	}
		return true;
	
}
function ques(){
	//alert(document.getElementById("question").value);
	if(document.getElementById("question").value==""||document.getElementById("question").value==undefined){
		alert("please enter a question");
		return false;
	}else{
		return true;
	}
}
</script>
    </body>
</html>
