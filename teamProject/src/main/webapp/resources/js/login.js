function buyer() {
	var id = buyerForm.id.value.trim();
	var pw = buyerForm.pw.value.trim();
	
	if(id == ""){
		alert("id를 입력하지 않았습니다.")
	}else if(pw == ""){
		alert("pw를 입력하지 않았습니다.")
	}else{
		buyerForm.submit();
	}
	
}

function seller() {
	var id = sellerForm.id.value.trim();
	var pw = sellerForm.pw.value.trim();
	
	if(id == ""){
		alert("id를 입력하지 않았습니다.")
	}else if(pw == ""){
		alert("pw를 입력하지 않았습니다.")
	}else{
		sellerForm.submit();
	}
	
}

function sucBuyer(id) {
	alert(id + "님 환영합니다.")
	location.href = "mainpage";
}

function sucSeller(id) {
	alert(id + "님 환영합니다.")
	location.href = "seller";
}

function fail() {
	alert("로그인에 실패하셨습니다. 아이디와 비밀번호를 다시 확인해주세요.")
	location.href = "login"
}

function logout() {
	alert("로그아웃 하셨습니다.")
	location.href = "mainpage"
}
