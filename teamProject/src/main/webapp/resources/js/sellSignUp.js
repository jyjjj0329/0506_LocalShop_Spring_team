// 회원가입
function sellSignUp() {
	var id = sellerSignUp.id.value.trim();
	var hidden = sellerSignUp.hidden.value;
	var pw = sellerSignUp.pw.value.trim();
	var pwCheck = sellerSignUp.pwCheck.value.trim();
	var name = sellerSignUp.name.value.trim();
	var gender = sellerSignUp.gender.value;
	var age = sellerSignUp.age.value.trim();
	var email1 = sellerSignUp.email1.value.trim();
	var email2 = sellerSignUp.email2.value.trim();
	var phonenum = sellerSignUp.phonenum.value.trim();
	var regnum = sellerSignUp.regnum.value.trim();
	var store = sellerSignUp.store.value.trim();
	var address = sellerSignUp.address1.value.trim();
	
	if(id == ""){
		alert("ID를 입력해주세요.")
	}else if(hidden == "unCheck"){
		alert("ID 중복체크를 해주세요.")
	}else if(!/^[a-z]+[a-z0-9]{6,12}$/g.test(id)){
		alert("ID는 영소문자로 시작하여 영소문자, 숫자를 포함한 6 ~ 12자리까지만 가능합니다.")
	}else if(pw == ""){
		alert("비밀번호를 입력해주세요.")
	}else if(!/^[A-Za-z0-9]{6,12}$/.test(pw)){
		alert("비밀번호는 영대,소문자, 숫자를 포함한 6 ~ 12자사이만 가능합니다.")
	}else if(!pw == pwCheck){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.")
	}else if(name == ""){
		alert("이름을 입력해주세요.")
	}else if(gender == ""){
		alert("성별을 선택해주세요.")
	}else if(age == ""){
		alert("나이를 입력해주세요.")
	}else if(email1 == ""){
		alert("이메일을 입력해주세요.")
	}else if(!/[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(email2)){
		alert("이메일 도메인 부분을 다시 확인해주세요.")
	}else if(phonenum == ""){
		alert("폰번호를 입력해주세요.")
	}else if(!/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/.test(phonenum)){
		alert("폰번호 형식이 다릅니다. 다시 확인해주세요")
	}else if(regnum == ""){
		alert("사업자 등록번호를 입력해주세요.")
	}else if(!/^[0-9]{5,19}$/g.test(regnum)){
		alert("사업자 등록번호는 숫자만 입력 가능합니다.")
	}else if(store == ""){
		alert("가게 상호명을 입력해주세요.")
	}else if(address == ""){
		alert("가게 주소를 적어주세요.")
	}else{
		alert("회원가입 완료");
		sellerSignUp.submit();
	}
}

//	ID 중복체크
function CheckID() {
	var id = sellerSignUp.id.value.trim();
	if(id == ""){
		alert("ID를 입력해주세요.")
	}else if(!/^[a-z]+[a-z0-9]{6,12}$/g.test(id)){
		alert("ID는 영소문자로 시작하여 영소문자, 숫자를 포함한 6 ~ 12자리까지만 가능합니다.")
	}else{
		window.open("sellerCheckID?id=" + id, "ID중복체크", "width=450 height=150 left=400 top=350");
	}
}
function CheckID2() {
	var id2 = document.getElementById("id").value.trim();
	if(id2 == ""){
		alert("ID를 입력해주세요.")
	}else if(!/^[a-z]+[a-z0-9]{6,12}$/g.test(id2)){
		alert("ID는 영소문자로 시작하여 영소문자, 숫자를 포함한 6 ~ 12자리까지만 가능합니다.")
	}else{
		window.open("sellerCheckID?id=" + id2, "ID중복체크", "width=450 height=150 left=400 top=350");
	}
}

//	중복확인 후 close
function IDok(sid) {
	alert(sid)
	opener.document.sellerSignUp.id.value = sid;
	opener.document.sellerSignUp.hidden.value = sid;
	opener.document.sellerSignUp.id.readOnly=true;
	window.close()
}
function IDok2(sid) {
	alert(sid)
	opener.document.getElementById("id").value = sid;
	opener.document.getElementById("hidden").value = sid;
	opener.document.getElementById("id").readOnly=true;
	window.close()
} 

//	email value값 변경
function emailChange() {
	var target = document.sellerSignUp.email3.selectedIndex;
	var mail = document.sellerSignUp.email3.options[target].value
	document.sellerSignUp.email2.value = mail;
	if(mail == "직접입력"){
		sellerSignUp.email2.readOnly=false;
	}else{
		sellerSignUp.email2.readOnly=true;
	}
}

var count = 0;
function addInput() {
	if(count < 9){
		count++;
		document.getElementById('addImg').innerHTML += 
			"<input type='file' name='storeImg[]'><br/>";
	}else{
		alert("사진은 10개까지만 가능합니다.")
	}
}


//	주소 api
function addressAPI() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address1").value = roadAddr;
            document.getElementById("address2").value = data.jibunAddress;
            
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}





