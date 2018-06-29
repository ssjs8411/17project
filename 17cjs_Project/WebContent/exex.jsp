<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
		    table, tr, td {
		        border:1px solid #000000 ;
		        border-collapse:collapse;
		    }
		    table {
		        width:100%;
		    }
		</style>
		<script>
			// 윈도우창 전체를 "load"하면 이벤트 발생
			window.addEventListener("load", function(){
				console.log("window load!");
				var signup = document.getElementById("signup");
				
				signup.addEventListener("click", function(){
					console.log("singup click");
					/*
						*Helper.innerHTML = "";
					*/
					
					var idVal = document.getElementById("id").value;
					var idHelper = document.getElementById("idHelper");
					var pwVal1 = document.getElementById("pw1").value;
					var pwVal2 = document.getElementById("pw2").value;
					var pw1Helper = document.getElementById("pw1Helper");
					var pw1He2per = document.getElementById("pw1Helper");
					var birthVal = document.getElementById("birth").value;
					
					// gender -> 배열
					// gender 선택-> genderFlag is true
					var gender = document.getElementsByClassName("gender");
					var genderFlag = false;
					for(var i=0; i<gender.length; i++){
						if(gender[i].checked){
							genderFlag = true;
						}
					}
					console.log("genderFlag:"+genderFlag);
					
					// hobby
					var hobby = document.getElementsByClassName("hobby");
					// hobby 2개 이상
					var hobbyCnt = 0;
					for(var j=0; j<hobby.length; j++){
						if(hobby[j].checked){
							hobbyCnt++;
						}
					}
					console.log("hobbyCnt:"+hobbyCnt);
					
					// 생일 공백
					
					
					// id 유효성 검사
					if(idVal.length<4){
						idHelper.innerHTML = "4자이상";
						return;
					// pw 유효성 검사
					}else if(pwVal1.length<4){
						pw1Helper.innerHTML= "4자이상";
						return;
					}else if(pwVal1!==pwVal2){
						pw2Helper.innerHTML= "PW확인";
						return;
					}else if(!genderFlag){
						genderHelper.innerHTML= "성별확인";
						return;
					}else if(hobbyCnt<2){
						hobbyHelper.innerHTML = "취미는 2개이상 선택";
						return;
					}else if(birthVal == ""){
						birthHelper.innerHTML = "생일 입력";
						return;
					}else{
						var birthYear = birtValue.substring(0,4);
						console.log("birthYear : "+birthYear);
						var today = new Date();
						var todayYear = today.getFullYear();
						console.log("todayYear:"+todayYear);
						document.getElementById("age").value = todayYear-birthYear;
						// form submit
					}
				});
				
			});
		</script>
	</head>
	<body>
		<form>
		    <fieldset>
		        <legend>회원가입</legend>
		        <table>
		            <tr>
		                <td>ID</td>
		                <td>
		                	<input type="text" id="id" name="id">
		                	<span id="idHelper"></span>
		                </td>
		            </tr>
		            <tr>
		                <td>PW<br>확인</td>
		                <td>
		                    <input type="password" id="pw1" name="pw1">
		                    <span id="pw1Helper"></span>
		                    <br>
		                    <input type="password" id="pw2" name="pw2">
		                    <span id="pw2Helper"></span>
		                </td>
		            </tr>
		            <tr>
		                <td>성별</td>
		                <td>
		                    <input class="gender" type="radio" value="male" name="gender">남
		                    <input class="gender" type="radio" value="female" name="gender">여
		                    <span id="genderHelper"></span>
		                </td>
		            </tr>
		            <tr>
		                <td>취미</td>
		                <td>
		                    <input class="hobby" type="checkbox" value="sport" name="hobby">운동
		                    <input class="hobby" type="checkbox" value="trip" name="hobby">여행
		                    <input class="hobby" type="checkbox" value="read" name="hobby">독서
		                    <span id="hobbyHelper"></span>
		                </td>
		            </tr>
		            <tr>
		                <td>생일</td>
		                <td>
		                	<input type="date" id="birth" name="birth">
		                	<span id="birthHelper"></span>	
		                </td>
		            </tr>
		            <tr>
		                <td>나이</td>
		                <td><input type="text" id="age" name="age"></td>
		            </tr>
		            <tr>
		                <td>이메일</td>
		                <td>
		                    <input type="text" id="email" name="email">
		                    @
		                    <select id="url">
		                        <option>naver.com</option>
		                        <option>daum.net</option>
		                        <option>nate.com</option>
		                    </select>
		                </td>
		            </tr>
		            <tr>
		                <td>메모</td>
		                <td><textarea id="memo" rows="3" cols="50"></textarea></td>
		            </tr>
		            <tr>
		                <td colspan="2">
		                    <input type="button" id="signup" value="signup">
		                    <input type="reset" value="reset">
		                </td>
		            </tr>
		        </table>
		    </fieldset>
		</form>
	</body>
</html>