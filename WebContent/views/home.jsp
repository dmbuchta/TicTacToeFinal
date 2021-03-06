<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="models.Player" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<jsp:include page="/views/include.jsp" />
</head>
<body>
	<jsp:include page="/views/header.jsp" />
	<div class='innerContent'>
<%
ServletContext sc = this.getServletContext();
String path = sc.getContextPath();//This code get the path relative to the root web content directory of the project
		String msg = request.getParameter("msg");
		Player user = (Player) session.getAttribute("user");
		if(msg != null)
			out.print("<h1>"+msg+"</h1>");
		if(user == null) {
			out.print("You are not logged in. <a href='"+path+"/views/login.jsp'>Login</a>");
		}
		else {
			//User user = (User)session.getAttribute("user");
			Player player = (Player)session.getAttribute("user");
			out.print(
					"<h1>"+player.getName()+", you have played "+player.getNumOfGames()+" games:</h1>" +
					"<h3>"+player.wins+" wins, "+player.losses+" losses, and "+player.draws+" ties.</h3>"+
					"<a href='"+path+"/views/gameBoard.jsp'>Start a game</a>" 
					);
		}
		 %>		
		</div>
</body>
</html>