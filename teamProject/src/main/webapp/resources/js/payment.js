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

// 결제창 
function payment() {
	var buyer_name = paymentForm.name.value.trim()
	var phonenum2 = paymentForm.phonenum2.value.trim()
	var phonenum3 = paymentForm.phonenum3.value.trim()
	var phonenum4 = paymentForm.phonenum4.value.trim()
	var postcode = paymentForm.postcode.value.trim()
	var address1 = paymentForm.address1.value.trim()
	var address3 = paymentForm.address3.value.trim()
	var sellName = paymentForm.sellName.value
	var price = paymentForm.price.value
	
	if(buyer_name == ""){
		alert("이름을 입력 안하셨습니다.")
	}else if(phonenum2 == ""){
		alert("핸드폰 번호를 입력 안하셨습니다. 폰번호를 확인해주세요")
	}else if(phonenum3 == ""){
		alert("핸드폰 번호를 입력 안하셨습니다. 폰번호를 확인해주세요")
	}else if(phonenum4 == ""){
		alert("핸드폰 번호를 입력 안하셨습니다. 폰번호를 확인해주세요")
	}else if(postcode == ""){
		alert("우편번호를 입력 안하셨습니다. 우편번호를 확인해주세요")
	}else{
//		결제 API
		var IMP = window.IMP; // 생략가능
		IMP.init('imp97940170'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : sellName, 
		    amount : price,
		    buyer_name : buyer_name,
		    buyer_tel : phonenum2 + phonenum3 + phonenum4,
		    buyer_addr : address1 + address3,
		    buyer_postcode : postcode,
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = ' 결제가 완료되었습니다.';
		        alert("주문 상품 : " + sellName + " 가격 : " + price + msg);
		        paymentForm.submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alert(msg);
		    }
		});
	}
	
	
	
}
