<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open House Invitation</title>
<style>
    body {
        background-image:url('raya.jfif');
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* Ensure body takes full height */
        }
        
        .form-container {
        width:40%;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* optional shadow for better appearance */
        background-color: rgba(255, 255, 255, 0.8);
        display: flex;
        flex-direction: column;
        line-height: 1.0; /* Adjust line spacing here */
        align-items: center;
        justify-content: center;
    }
    p {
        margin-bottom: 0px; /* Adjust the space between paragraphs */
        
    }
    h1,h4{
    	margin-bottom:-5px;
    	
    }
    .audio-container {
        display: flex;
        justify-content: center;
        margin-top: 20px; /* Optional margin for spacing */
    }
    .gif-container {
        display: flex;
        justify-content: center;
        margin-top: 20px; /* Optional margin for spacing */
        margin-right:-50px;
        margin-left:50px;
    }
    .gif-container img {
        width: 200px; /* Set your desired width */
        height: auto;  /* Maintain aspect ratio */
    }
</style>
</head>
<%
int age = Integer.parseInt(request.getParameter("age")); 
String[] colours = request.getParameterValues("colour");
%>

<body>
<div class="form-container">
<h1>Invitation to Open House</h1>
<h4>You are invited to our open house, <%= request.getParameter("name") %>!</h4>
<h4>Your information are as below </h4>
<p>Name :<%= request.getParameter("name") %></p>
<p>Age :<%= age %></p>
<p>Address : <%= request.getParameter("address") %></p>
<p>Gender : <%= request.getParameter("gender") %></p>
<p>Favourite Colour : <%
if(colours!=null){
	for(int i=0;i<colours.length;i++){
		out.print(colours[i]);
		if(i <colours.length-1)
			out.print(",");
	}
}else{
	out.print("None");
} %></p>
<%
String attendance = request.getParameter("status");
%>
<p>Attendance: <%= attendance %></p>
<% if (attendance != null && attendance.equalsIgnoreCase("Yes")) { %>
    <p>You should wear 
    <% 
    if (colours != null) {
        for (int i = 0; i < colours.length; i++) {
            out.print(colours[i]);
            if (i < colours.length - 1) {
                out.print(" or ");
            } else {
                out.print(", your favourite colour");
            }
        }
    } 
    %> if you can come to our open house.</p>
    <p>See you there dear!</p>
    <div class="audio-container">
        <audio controls autoplay>
            <source src="laguraya.mp3" type="audio/mpeg">
        </audio>
    </div>
<% } else { %>
    <p>We are sorry to hear that you couldn't come to our open house. See you next time dear!</p>
    <p>Selamat Hari Raya Aidilfitri, Maaf Zahir Batin!</p>
    <div class="audio-container">
        <audio controls autoplay>
            <source src="lagurayasedih.mp3" type="audio/mpeg">
        </audio>
    </div>
<% } %>
</div>
<div class="gif-container">
        <img src="giphy2.gif" alt="Invitation GIF">
    </div>
</body>
</html>