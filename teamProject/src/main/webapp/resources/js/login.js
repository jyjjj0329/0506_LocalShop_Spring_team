
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