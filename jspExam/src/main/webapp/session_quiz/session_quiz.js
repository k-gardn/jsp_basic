function allCheck(){
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	userName = document.getElementById('userName');
	
	if(id.value == ""){
		alert('아이디는 필수 항목입니다.');
	}else if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else if(confirm.value == ""){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else if(userName.value == ""){
		alert('이름은 필수 항목입니다.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}

function pwCheck(){
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	label = document.getElementById('label');
	 if(pw.value == confirm.value){
		 label.innerHTML = '일치'
	 }else{
		 label.innerHTML = '불일치'
	 }
	// window.alert('pwCheck 호출')
}

function loginCheck(){
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	
	if(id.value == ""){
		alert('아이디는 필수 항목입니다.');
	}else if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}

function updateButton(){
	var id = document.getElementById('id');
			if(id.value == ''){
				alert('아이디는 필수로 입력 값이 있어야합니다.')
				return;
			}
			//alert('아이디 : ' + id.value);
			
			var pw = document.getElementById('pw');
			if(pw.value == ''){
				alert('비밀번호는 필수로 입력 값이 있어야합니다.')
				return;
			}
			var confirmPw = document.getElementById('confirmPw');
			if(pw.value != confirmPw.value){
				alert('두 비밀번호는 같은 비밀번호로 입력하세요.')
				return;
			}
			var formRef = document.getElementById('f');
			formRef.submit(); //submit 버튼을 누른효과를 얻을 수 있음.
}

	function cancelButton(){
			location.href='index.jsp';
		}

