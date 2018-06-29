<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "project.dao.Udao" %>
<!DOCTYPE html>
<% 
	request.setCharacterEncoding("euckr");
%>
<jsp:useBean id="u" class="project.dto.User"/> 
<jsp:setProperty name="u" property="*"/>
<% 
	Udao udao = new Udao();
	udao.uUpdate(u);
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>We are the animal</title>
		<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
	</head>
	
	<body>
		<div id="container">
			<div id="logo"> 
				<a href="<%=request.getContextPath() %>/main.jsp">
				<img src="<%=request.getContextPath() %>/images/ExLogo.jpg" alt="bog 1" border="0" /></a>
			</div>
			<div id="header">
				<ul>
					<li><a href="<%=request.getContextPath() %>/main.jsp">home</a></li>
					<li><a href="<%=request.getContextPath() %>/animalShelter/animalShelterList.jsp">��ȣ�� ����</a></li>
					<li><a href="<%=request.getContextPath() %>/missingAnimal/missingAnimalList.jsp">���� ����</a></li>
					<li><a href="<%=request.getContextPath() %>/animalAdoption/animalAdoptionList.jsp">�Ծ� ��û</a></li>
					<li><a href="<%=request.getContextPath() %>/community/communityList.jsp">Ŀ�´�Ƽ</a></li>
					<li><a href="<%=request.getContextPath() %>/customerService/customerServiceList.jsp" class="lastchild">������</a></li>
				</ul>
			</div>
			
			<div id="content">
				<h1>����������</h1>
				<div id="left">
					<div class="text">
						<h2>������ ���������� ó���Ǿ����ϴ�.</h2>
						<p><a href="<%= request.getContextPath()%>/main.jsp">Ȩ���� �̵�</a></p>
					</div>
					<div class="photos"> 
						<img src="<%=request.getContextPath() %>/images/dog1.jpg" alt="bog 1" border="0" /> 
						<img src="<%=request.getContextPath() %>/images/dog2.jpg" alt="bog 2" border="0" />
						<img src="<%=request.getContextPath() %>/images/dog3.jpg" alt="bog 3" border="0" />
						<img src="<%=request.getContextPath() %>/images/dog4.jpg" alt="bog 4" border="0" />
						<img src="<%=request.getContextPath() %>/images/dog5.jpg" alt="bog 5" border="0" />
					</div>
					<div class="clear"></div>
				</div>
				<div id="right">
					<h2>�α���</h2>
<%
	if(session.getAttribute("s_id") == null){
%>
					<form action="<%=request.getContextPath() %>/login/loginAction.jsp" method="post">
					<p><input type="text" name="id" size="15"></p>
					<p><input type="password" name="pw" size="15"></p>
					<p><button>�α���</button></p>
					</form>
					<span id="a"><a href="<%=request.getContextPath() %>/user/userInsertForm.jsp" id="link">ȸ������</a> | <a href="<%=request.getContextPath() %>/login/loginSelect.jsp" id="link">ID/PWã��</a></span>
<%
	}else{
%>
					<a><%=session.getAttribute("s_level") %> �� �α�����</a>
					<p><%=session.getAttribute("s_name") %>�� </p>
					<p>ȯ���մϴ� !!</p>
					<span id="a"><a href="<%=request.getContextPath() %>/user/userUpdateForm.jsp" id="link">����������</a> | <a href="<%=request.getContextPath() %>/login/logout.jsp" id="link">�α׾ƿ�</a></span>
<%
	}
%>	
				</div>
				<div id="right">
					<h2>�����ʸ޴�</h2>
					<a href="#">������</a>
					<p>����</p>
					<span><a>ĭ����</a></span>
					<span><a href="#">More</a></span>
				</div>
				<div class="clear"></div>
			</div>
			<div id="footer">
				���⵿����ȣ����Ʈ
				<a>We are the animal</a>
			</div>
		</div>
	</body>
	
</html>