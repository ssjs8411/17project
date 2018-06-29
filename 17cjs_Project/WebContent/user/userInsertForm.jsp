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
						pwHelper.innerHTML = "��й�ȣȮ��";
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
					<li><a href="<%=request.getContextPath() %>/animalShelter/animalShelterList.jsp">��ȣ�� ����</a></li>
					<li><a href="<%=request.getContextPath() %>/missingAnimal/missingAnimalList.jsp">���� ����</a></li>
					<li><a href="<%=request.getContextPath() %>/animalAdoption/animalAdoptionList.jsp">�Ծ� ��û</a></li>
					<li><a href="<%=request.getContextPath() %>/community/communityList.jsp">Ŀ�´�Ƽ</a></li>
					<li><a href="<%=request.getContextPath() %>/customerService/customerServiceList.jsp" class="lastchild">������</a></li>
				</ul>
			</div>
			
			<div id="content">
				<h1>ȸ������</h1>
				<div id="left">
					<div class="text">
<%
	request.setCharacterEncoding("euc-kr");
%>

						<form action = "<%= request.getContextPath() %>/user/userInsertAction.jsp" method = "post" id="insertForm">
							
							<h2> �α�������  </h2>
								<table>
									<tr>
										<td><p>��������</p></td>
										<td><p>
											<input type="radio" name=user_level value="��ü����">��ü����
											<input type="radio" name=user_level value="�Ծ���">�Ծ���
										</p></td>
									</tr>
									<tr>
										<td><p>���̵�</p></td>
										<td><p><input type ="text" name="user_id" ><p></td>
									</tr>
									<tr>
										<td><p>��й�ȣ</p></td>
										<td><p><input type ="password" name="user_pw" id="pw1"><span id="pwHelper"></span></p></td>
									</tr>
									<tr>
										<td><p>��й�ȣȮ��</p></td>
										<td><p><input type ="password" name="user_pw2" id="pw2"></p></td>
									</tr>
								</table>
							<br>
							<h2> �������� </h2>
								<table>
									<tr>
										<td><p>�̸�</p></td>
										<td><p><input type ="text" name="user_name" ></p></td>
									</tr>
									<tr>
										<td><p>����</p></td>
										<td>
											<p>
												<input type ="radio" name = user_gender value = "��">����
												<input type ="radio" name = user_gender value = "��">����
											</p>
										</td>
									</tr>
									<tr>
										<td><p>�̸���</p></td>
										<td><p><input type ="text" name="user_email" ></p></td>
									</tr>
									<tr>
										<td><p>�ּ�</p></td>
										<td><p><input type ="text" name="user_home" ></p></td>
									</tr>
									<tr>
										<td><p>�޴�����ȣ</p></td>
										<td><p><input type ="text" name="user_phone" placeholder=" - ���� ���ڸ� �Է�"></p></td>
									</tr>
									<tr>
										<td><p>��������</p></td>
										<td>
											<p>
												<select name="user_addr">
													<option value="" >===�����ϼ���===</option>
													<option value="����">����</option>
													<option value="�λ�">�λ�</option>
													<option value="�뱸">�뱸</option>
													<option value="��õ">��õ</option>
													<option value="����">����</option>
													<option value="����">����</option>
													<option value="���">���</option>
													<option value="���">���</option>
													<option value="����">����</option>
													<option value="���">���</option>
													<option value="�泲">�泲</option>
													<option value="����">����</option>
													<option value="����">����</option>
													<option value="���">���</option>
													<option value="�泲">�泲</option>
													<option value="����">����</option>
												</select>
											</p>
										</td>
									</tr>
								</table>
							<br>
									     		
							<p><input type="button" id="btn" value="ȸ������"><p>
									     		
						</form>

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