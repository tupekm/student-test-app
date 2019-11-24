<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Student tracker app</title>
<link type="text/css" rel = "stylesheet" href = "css/style.css" />
</head>

<%-- <%
	//get the students from request object (send by servlet)
	List<Student> theStudents = (List<Student>) request.getAttribute("STUDENT_LIST");
%> --%> 

<body>

	<div id ="wrapper">
	
		<div id = "header">
			<h2>FooBar University</h2>
			
		</div>
		
	</div>
	
	<div id = "container">
		<div id = "content">
		
			<!-- Add new button -->
			<input type = "button" value = "Add Student"
			onClick = "window.location.href ='add-student-form.jsp'; return false;"
			class = "add-student-button" />
	
			<table>
			
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
<%-- 				<% for (Student tempStudent: theStudents) {%>  REMOVE SCPRIPLET AND ADD JSTL TAG--%>

					<c:forEach var ="tempStudent" items ="${STUDENT_LIST }">
					<!-- Set up a link for each student -->
					<c:url var = "tempLink" value = "SudentControllerServlet">
						<c:param name="command" value = "LOAD"/>
						<c:param name = "studentId" value = "${tempStudent.id}" />
					</c:url>
					
					<!-- Set up a delete link for each student -->
					<c:url var = "deleteLink" value = "SudentControllerServlet">
						<c:param name="command" value = "DELETE"/>
						<c:param name = "studentId" value = "${tempStudent.id}" />
					</c:url>
					
					<tr>
						<td> ${tempStudent.firstName} </td>
						<td> ${tempStudent.lastName} </td>
						<td> ${tempStudent.email} </td>
						<td>
						 <a href="${tempLink}">Update</a>
						 |
						 <a href="${deleteLink}"
						 onClick = "if (!(confirm('Are you sure you want to delete this student?'))) return false">
						 Delete</a>
						</td>
					</tr>
					
			     	</c:forEach>
			</table>
		
		</div>
	</div>

</body>
</html>