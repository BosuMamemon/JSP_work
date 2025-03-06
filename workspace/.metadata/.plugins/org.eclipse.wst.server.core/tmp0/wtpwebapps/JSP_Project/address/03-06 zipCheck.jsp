<%@page import="com.address.ZipCode"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>zipCheck</title>
	</head>
	
	<% 
		request.setCharacterEncoding("utf-8");
		String input = request.getParameter("input");
		AddressDAO dao = new AddressDAO();
		ArrayList<ZipCode> zipCodes = dao.zipCodeRead(input);
	%>
	
	<body>
		<h3>우편번호 찾기</h3>
		<form action="03-06 zipCheck.jsp" id="form">
			<table>
				<tr>
					<td>
						동이름 입력:
						<input type="text" id="input" name="input">
						<button type="button" onclick="dongCheck()">검색</button>
					</td>
				</tr>
				<tr>
					<%
						if(zipCodes.isEmpty()) {
							%><td>검색 결과가 없습니다.</td><%
						} else {
							%><td>* 검색 후 아래 우편번호를 클릭하면 자동 입력됩니다.</td><%
						}
					%>
				</tr>
				<%
					for(ZipCode zc: zipCodes) {
						%><tr>
							<td>
								<!-- href에서 자바스크립트 함수를 넣고 싶으면 javascript:함수명()이라고 적으면 됨 -->
								<a href="javascript:send('<%= zc.getZipcode() %>', '<%= zc.getSido() %>', '<%= zc.getGugun() %>', '<%= zc.getDong() %>', '<%= zc.getBunji() %>')" style="text-decoration:none; color:black; font-weight:bold">
									<%= zc.getZipcode() %> <%= zc.getSido() %> <%= zc.getGugun() %> <%= zc.getDong() %> <%= zc.getBunji() %>
								</a>
							</td>
						</tr><%
					}
				%>
		</form>
	</body>
	
	<script>
		function dongCheck() {
			if(document.getElementById("input").value == "") {
				alert("동 이름을 입력하세요.");
				document.querySelector("#input").focus();
				return;
			}
			document.querySelector("#form").submit()
		}
		
		function send(zipcode, sido, gugun, dong, bunji) {
			let address = sido + " " + gugun + " " + dong + " " + bunji;
			// opener = window.open()을 실행한 파일을 호출함
			opener.document.querySelector("#zipcode").value = zipcode;
			opener.document.querySelector("#address").value = address;
			self.close();
			
		}
	</script>
</html>