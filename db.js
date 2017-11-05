var month;

function getDays() {
	document.getElementById("day").options.length=0; 
	var sel=document.getElementById("month");	//월별 분야 필드의 선택 값 가져옴
	var selectObl = sel.options[sel.selectedIndex].value;
	month=sel.options[sel.selectedIndex].text;
	if(selectObl=="apr"||selectObl=="june"||selectObl=="sep"||selectObl=="nob"){
		for(var i=1;i<=30;i++){
			$("#day").append("<option value='"+i+"'>"+i+"</option>");
		}
	}
	else if(selectObl=="feb"){
		for(var i=1;i<=28;i++){
			$("#day").append("<option value='"+i+"'>"+i+"</option>");
		}
	}
	else{
		for(var i=1;i<=31;i++){
			$("#day").append("<option value='"+i+"'>"+i+"</option>");
		}
	}
}

function getInfo(){	//가격 검색 가능 html
	//alert("hi");
	var bookName=document.getElementById("bookName").value;	//월별 분야 필드의 선택 값 가져옴
	var bookAuthor=document.getElementById("bookAuthor").value;	//월별 분야 필드의 선택 값 가져옴
	var bookCompany=document.getElementById("bookCompany").value;	//월별 분야 필드의 선택 값 가져옴
	var bookPrice=document.getElementById("bookPrice").value;	//월별 분야 필드의 선택 값 가져옴
	alert(bookName+bookAuthor+bookCompany+bookPrice);
}
function getInfo2(){	//가격 검색 가능X html
	//alert("hi");
	var bookName=document.getElementById("bookName").value;	//월별 분야 필드의 선택 값 가져옴
	var bookAuthor=document.getElementById("bookAuthor").value;	//월별 분야 필드의 선택 값 가져옴
	var bookCompany=document.getElementById("bookCompany").value;	//월별 분야 필드의 선택 값 가져옴

	alert(bookName+bookAuthor+bookCompany);
}
function getMember(){
	var memberId=document.getElementById("memberId").value;	//월별 분야 필드의 선택 값 가져옴
	var memberName=document.getElementById("memberName").value;	//월별 분야 필드의 선택 값 가져옴

	alert(memberId+memberName);
}
function getDate(){
	var sel=document.getElementById("day");	//월별 분야 필드의 선택 값 가져옴
	var day = sel.options[sel.selectedIndex].text;

	alert(month+day);
}
function post(){
	alert("등록되었습니다.");
}
function destroy(){
	//alert("폐기되었습니다.");
}