$(document).ready(function() {
	$("#btnIDcheck").click(function() {
		window.open("IDcheck.jsp", "", "width=500 height=300");
	})
	
	$("#btnUse").click(function() {
		if($("#userID").val()=="") {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		$.ajax({
			type: "get",
			url: "IDcheckProcess.jsp",
			data: {"userID" : $("#userID").val()},
			success: function(res) {
				if(res.trim()=="yes") {
					alert("사용 가능한 아이디입니다.");
					$(opener.document).find("#userID").val($("#userID").val());
					self.close();
				} else {
					alert("사용 불가능한 아이디입니다.");
					$("#userID").val("");
					$("#userID").focus();
				}
			},
			error: function(e) {
				alert(e+":error");
			}
		})
	})
})

