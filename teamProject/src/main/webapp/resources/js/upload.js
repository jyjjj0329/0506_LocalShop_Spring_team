function upload() {
	var name = uploadForm.name.value.trim();
	var price = uploadForm.price.value.trim();
	var origin = uploadForm.origin.value.trim();
	var content = uploadForm.content.value.trim();
	var num = uploadForm.num.value.trim();
	
	if(name == ""){
		alert("물품 이름을 적어주세요.")
	}else if(price == ""){
		alert("물품 가격을 적어주세요.")
	}else if(isNaN(price)){
		alert("물품 가격은 숫자만 가능합니다.")
	}else if(isNaN(num)){
		alert("물품 수량은 숫자만 가능합니다.")
	}else if(origin == ""){
		alert("물품 원산지를 적어주세요.")
	}else if(content == ""){
		alert("물품 설명을 적어주세요.")
	}else{
		alert("물품 등록 완료")
		uploadForm.submit();
	}
}

function gdsUpdate(pw) {
	var pwCheck = prompt("비밀번호를 입력해주세요", "");
	if(pwCheck == null){
		return false;
	}else if(pw == pwCheck){
		alert("수정 완료했습니다.")
		gdsUpdateForm.submit()
	}else{
		alert("비밀번호가 틀리셨습니다. 다시 입력해주세요.")
	}
	
}

// 물품 삭제할때 비밀번호 확인
function gdsDelete(pw) {
	var pwCheck = prompt("비밀번호를 입력해주세요", "");
	var idx = gdsUpdateForm.idx.value.trim();
//	alert(pw)
//	alert(pwCheck);
	if(pw == pwCheck){
		location.href = "gdsDelete?idx=" + idx
	}else{
		alert("비밀번호가 틀리셨습니다. 다시 입력해주세요.")
	}
	
}