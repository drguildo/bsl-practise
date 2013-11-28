<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.drguildo.bsl.BslLetter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>BSL Alphabet Practise</title>
</head>
<body>

  <%
    BslLetter letter = new BslLetter();

    if (BslLetter.checkParameter(request.getParameter("guess"))
        && BslLetter.checkParameter(request.getParameter("answer"))) {
      PrintWriter writer = response.getWriter();
      %>
      <div id="answer">
      <%
      BslLetter guess = new BslLetter(request.getParameter("guess"));
      BslLetter answer = new BslLetter(request.getParameter("answer"));
      %>
      <img src="<%= guess.getFilename() %>" />
      <%
      if (guess.equals(answer)) {
        %>
        <img class="imgoverlay" src="green.png" />
        </div>
        <%
      } else {
        %>
        <img class="imgoverlay" src="red.png" />
        </div>
        <div id="answer">
        <img src="<%= answer.getFilename() %>" />
        <img class="imgoverlay" src="green.png" />
        </div>
        <p id="correction">Correct answer: <%= answer.getLetter() %></p>
        <%
      }
    }
  %>

  <p>
    <img src="<%=letter.getFilename()%>" />
  </p>

  <form method="post" action="index.jsp">
    <p>
      <input type="hidden" name="answer" value="<%=letter.getLetter()%>" />
      <div id="buttons">
      <%
      for (int i = 'A'; i <= 'Z'; i++) {
        %><input type="submit" name="guess" value="<%= Character.toString((char) i) %>" id="letter"/><%
      }
      %>
      </div>
    </p>
  </form>
</body>
</html>
