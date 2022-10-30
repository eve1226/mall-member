/**
 * 
 */

function ch(){
	let f =document.frm;
	if(f.custname.value == ""){
		alert("이름이 입력되지 않았습니다");
		f.custname.focus();
		return false;
	}
	if(f.phone.value == ""){
		alert("전화번호가 입력되지 않았습니다");
		f.phone.focus();
		return false;
	}
	if(f.address.value == ""){
		alert("주소가 입력되지 않았습니다");
		f.address.focus();
		return false;
	}
	if(f.joindate.value == ""){
		alert("가입일자가 입력되지 않았습니다");
		f.joindate.focus();
		return false;
	}
	if(f.grade.value == ""){
		alert("고객등급이 입력되지 않았습니다");
		f.grade.focus();
		return false;
	}
	if(f.city[0].checked == false && f.city[1].checked == false && f.city[2].checked == false){
		alert("도시코드가 선택되지 않았습니다");
		return false;
	}
	
	alert("회원등록이 완료되었습니다");
	return true;
}

function ch2(){
	alert("회원정보수정이 완료 되었습니다");
}