// 소비자 회원가입
function infochange() {
	var name = infochangeOK.name.value.trim();
	var nickname = infochangeOK.nickname.value.trim();
	var hidden2 = infochangeOK.hidden2.value;
	var age = infochangeOK.age.value.trim();
	var email1 = infochangeOK.email1.value.trim();
	var email2 = infochangeOK.email2.value.trim();
	var phonenum = infochangeOK.phonenum.value.trim();
	var cardNum = infochangeOK.cardNum.value.trim()
	var address = infochangeOK.address1.value.trim();
	
	if(name == ""){
		alert("이름을 입력해주세요.")
	}else if(nickname == ""){
		alert("별명을 입력해주세요.")
	}else if(hidden2 == "unCheck"){
		alert("별명 중복체크를 해주세요.")
	}else if(!/^[가-힣]+[가-힣0-9]{3,8}$/g.test(nickname)){	
		alert("별명은 한글 또는 숫자를 포함하여 4 ~ 8글자까지만 가능합니다.")
	}else if(age == ""){
		alert("나이를 입력해주세요.")
	}else if(email1 == ""){
		alert("이메일을 입력해주세요.")
	}else if(!/[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(email2)){
		alert("이메일 도메인 부분을 다시 확인해주세요.")
	}else if(phonenum == ""){
		alert("휴대폰 번호를 입력해주세요.")
	}else if(!/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/.test(phonenum)){
		alert("휴대폰 번호 형식이 다릅니다. 다시 확인해주세요.")
	}else if(!/^[0-9]{16}$/g.test(cardNum)){	
		alert("카드 번호를 올바르게 입력해주세요.")
	}else{
		alert("업데이트 완료");
		infochangeOK.submit();
	}
}

//	별명 중복체크
function CheckNickname() {
	var nickname = infochangeOK.nickname.value.trim();
	if(nickname == ""){
		alert("닉네임을 입력해주세요.")
	}else if(!/^[가-힣]+[가-힣0-9]{3,8}$/g.test(nickname)){
		alert("별명은 한글 또는 숫자를 포함하여 4 ~ 8글자까지만 가능합니다.")
	}else{
		window.open("buyerCheckNickname?nickname=" + nickname, "닉네임 중복체크", "width=450 height=150 left=400 top=350");
	}
}
function CheckNickname2() {
	var nickname2 = document.getElementById("nickname").value.trim();
	if(nickname2 == ""){
		alert("닉네임을 입력해주세요.")
	}else if(!/^[가-힣]+[가-힣0-9]{3,8}$/g.test(nickname2)){
		alert("별명은 한글 또는 숫자를 포함하여 4 ~ 8글자까지만 가능합니다.")
	}else{
		location.href="buyerCheckNickname?nickname=" + nickname2;
	}
}

//	중복확인 후 close
function Nicknameok(snickname) {
	opener.document.infochangeOK.nickname.value = snickname;
	opener.document.infochangeOK.hidden2.value = snickname;
	opener.document.infochangeOK.nickname.readOnly=true;
	window.close()
}


//	email value값 변경
function emailChange() {
	var target = document.infochangeOK.email3.selectedIndex;
	var mail = document.infochangeOK.email3.options[target].value
	document.infochangeOK.email2.value = mail;
	if(mail == "직접입력"){
		infochangeOK.email2.readOnly=false;
	}else{
		infochangeOK.email2.readOnly=true;
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





