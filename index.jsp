<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


<meta charset="windows-1255">
<title>todo list new</title>
</head>
<body>

<%
//checking it a Linkedlist object is  already connected to the HttpSession object.. if not.. a new one will added
if(session.getAttribute("list")==null)
	session.setAttribute("list", new LinkedList<String>());
//making sure we have a reference for a linked list
LinkedList<String> list = (LinkedList<String>)session.getAttribute("list");
//checking if the request includes 'item' parameter... if it includes one
//then we need to extract its value... and add it to the linked list		
String temp = request.getParameter("item");
if(temp!=null && temp!="") {
	list.add(temp);
}
%>

<div class="jumbotron text-center">
  <h1>DevOps App Example</h1>
</div>

<form action="index.jsp" method="post">
  <div class="form-group text-center">
	<input name="item" class="form-control text-center" type="text" placeholder="Enter Item">
  </div>
  <button type="submit" class="btn btn-primary btn-block">Submit</button>
</form>

</body>
</html>

<%
//iterating the linked list in order to print out back to the client 
//all items
for(String text : list) {
	out.println("<p class='text-center'>"+ text + "</p>");
}
%>
