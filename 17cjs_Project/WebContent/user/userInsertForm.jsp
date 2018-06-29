<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>We are the animal</title>
		<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
		<script>
			window.addEventListener("load", function(){
				console.log("window load!");
				var btn = document.getElementById("btn");
				
				btn.addEventListener("click", function(){
					console.log("btn click!");
					
				var pwHelper = document.getElementById("pwHelper");
				
					if(document.getElementById("pw1").value !== document.getElementById("pw2").value){
						pwHelper.innerHTML = "비밀번호확인";
						return;
					}else{
						document.getElementById("insertForm").submit();
					}
				});
				
			});
		</script>
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
<%
	request.setCharacterEncoding("euc-kr");
%>

						<form action = "<%= request.getContextPath() %>/user/userInsertAction.jsp" method = "post" id="insertForm">
							
							<h2> 로그인정보  </h2>
								<table>
									<tr>
										<td><p>가입유형</p></td>
										<td><p>
											<input type="radio" name=user_level value="업체직원">업체직원
											<input type="radio" name=user_level value="입양자">입양자
										</p></td>
									</tr>
									<tr>
										<td><p>아이디</p></td>
										<td><p><input type ="text" name="user_id" ><p></td>
									</tr>
									<tr>
										<td><p>비밀번호</p></td>
										<td><p><input type ="password" name="user_pw" id="pw1"><span id="pwHelper"></span></p></td>
									</tr>
									<tr>
										<td><p>비밀번호확인</p></td>
										<td><p><input type ="password" name="user_pw2" id="pw2"></p></td>
									</tr>
								</table>
							<br>
							<h2> 개인정보 </h2>
								<table>
									<tr>
										<td><p>이름</p></td>
										<td><p><input type ="text" name="user_name" ></p></td>
									</tr>
									<tr>
										<td><p>성별</p></td>
										<td>
											<p>
												<input type ="radio" name = user_gender value = "남">남자
												<input type ="radio" name = user_gender value = "여">여자
											</p>
										</td>
									</tr>
									<tr>
										<td><p>이메일</p></td>
										<td><p><input type ="text" name="user_email" ></p></td>
									</tr>
									<tr>
										<td><p>주소</p></td>
										<td><p><input type ="text" name="user_home" ></p></td>
									</tr>
									<tr>
										<td><p>휴대폰번호</p></td>
										<td><p><input type ="text" name="user_phone" placeholder=" - 없이 숫자만 입력"></p></td>
									</tr>
									<tr>
										<td><p>관심지역</p></td>
										<td>
											<p>
												<select name="user_addr">
													<option value="" >===선택하세요===</option>
													<option value="서울">서울</option>
													<option value="부산">부산</option>
													<option value="대구">대구</option>
													<option value="인천">인천</option>
													<option value="광주">광주</option>
													<option value="대전">대전</option>
													<option value="울산">울산</option>
													<option value="경기">경기</option>
													<option value="강원">강원</option>
													<option value="충북">충북</option>
													<option value="충남">충남</option>
													<option value="전북">전북</option>
													<option value="전남">전남</option>
													<option value="경북">경북</option>
													<option value="경남">경남</option>
													<option value="제주">제주</option>
												</select>
											</p>
										</td>
									</tr>
								</table>
							<br>
									     		
							<p><input type="button" id="btn" value="회원가입"><p>
									     		
						</form>

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