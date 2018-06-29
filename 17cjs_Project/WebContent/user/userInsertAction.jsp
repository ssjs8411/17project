<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "project.dao.Udao" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("euc-kr"); %>	<!-- 한글로 받아오는 코드 -->
<jsp:useBean id="u" class="project.dto.User"/>	<!-- project.dto패키지 내 User클래스의 주소값을 변수 u에 담는다 -->
<jsp:setProperty name="u" property="*"/>		<!-- u에 담긴 주소값을 따라가서  set메서드 갯수만큼 셋팅하고 호출 -->
<%
	String user_pw = request.getParameter("user_pw2");
	String user_level = request.getParameter("user_level");

	if(u.getUser_pw().equals(user_pw)){
		Udao ud = new Udao();
		ud.uinsert(u);
	}else{
		response.sendRedirect(request.getContextPath() + "/user/user_insert_form.jsp");
	}
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
					<li><a href="<%=request.getContextPath() %>/animalShelter/animalShelterList.jsp">보호소 동물</a></li>
					<li><a href="<%=request.getContextPath() %>/missingAnimal/missingAnimalList.jsp">실종 동물</a></li>
					<li><a href="<%=request.getContextPath() %>/animalAdoption/animalAdoptionList.jsp">입양 신청</a></li>
					<li><a href="<%=request.getContextPath() %>/community/communityList.jsp">커뮤니티</a></li>
					<li><a href="<%=request.getContextPath() %>/customerService/customerServiceList.jsp" class="lastchild">고객센터</a></li>
				</ul>
			</div>
			
			<div id="content">
				<h1>회원가입</h1>
				<div id="left">
					<div class="text">
						<h2>회원가입이 정상적으로 처리되었습니다.</h2>
						<p>환영합니다!</p>
						<p><a href="<%= request.getContextPath()%>/main.jsp">홈으로 이동</a></p>
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
					<h2>로그인</h2>
<%
	if(session.getAttribute("s_id") == null){
%>
					<form action="<%=request.getContextPath() %>/login/loginAction.jsp" method="post">
					<p><input type="text" name="id" size="15"></p>
					<p><input type="password" name="pw" size="15"></p>
					<p><button>로그인</button></p>
					</form>
					<span id="a"><a href="<%=request.getContextPath() %>/user/userInsertForm.jsp" id="link">회원가입</a> | <a href="<%=request.getContextPath() %>/login/loginSelect.jsp" id="link">ID/PW찾기</a></span>
<%
	}else{
%>
					<a><%=session.getAttribute("s_level") %> 로 로그인중</a>
					<p><%=session.getAttribute("s_name") %>님 </p>
					<p>환영합니다 !!</p>
					<span id="a"><a href="<%=request.getContextPath() %>/user/userUpdateForm.jsp" id="link">내정보수정</a> | <a href="<%=request.getContextPath() %>/login/logout.jsp" id="link">로그아웃</a></span>
<%
	}
%>	
				</div>
				<div id="right">
					<h2>오른쪽메뉴</h2>
					<a href="#">소제목</a>
					<p>내용</p>
					<span><a>칸막이</a></span>
					<span><a href="#">More</a></span>
				</div>
				<div class="clear"></div>
			</div>
			<div id="footer">
				유기동물보호사이트
				<a>We are the animal</a>
			</div>
		</div>
	</body>
	
</html>