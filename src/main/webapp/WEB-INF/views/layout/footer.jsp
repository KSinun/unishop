<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--footer-->
<div class="jumbotron text-center" style="margin-bottom: 0">
	<p>Footer</p>
</div>
<script>


function goPaymentAPI(productname,price,email,name,phonenumber,id){
	
	event.preventDefault();
console.log(productname);
	console.log(price);
	console.log(email);
	
	let IMP = window.IMP;
    IMP.init("imp55496891");
    IMP.request_pay({
        pg: "html5_inicis",//이니시스 웹표준 결제창
        pay_method: "card",//결제방법
        merchant_uid: "11",//주문번호
        name: productname,//상품명
        amount: price,//가격
        buyer_email: email,//이메일
        buyer_name: name,//이름
        buyer_tel: phonenumber,//연락처
//         buyer_addr: "서울특별시 강남구 신사동",//주소
        buyer_postcode: id//상품코드
    }, async function (rsp) {
//         console.log(rsp);
        if (rsp.success) {
        	alert("결제가 완료되었습니다.");
        	console.log(rsp);
        	let response =await fetch("/payment",{
        		method:"post",
        		body:JSON.stringify(rsp),
        		headers:{
        			"Content-Type":"application/json; charset=utf-8"
        		}
        	});
        	
        	let parseResponse =await response.text();
        	console.log(parseResponse);
        	if(parseResponse === "ok"){
        		location.href="/paymentList";
        	}
        	
        	
//             msg += '고유ID : ' + rsp.imp_uid;//아임포트 거래고유번호
//             msg += '상점 거래ID : ' + rsp.merchant_uid;//주문번호
//             msg += '결제 금액 : ' + rsp.paid_amount;//결제금액
//             msg += '카드 승인번호 : ' + rsp.apply_num;
        } else {
        	alert("결제가 실패하였습니다.");
            msg += '에러내용 : ' + rsp.error_msg;
        }
        
    });


}



		// DBÃ¬ÂÂÃ¬ÂÂ Ã­ÂÂÃ«Â§Â¤ÃªÂ°ÂÃ«Â¥Â¼ Ã«Â³ÂÃ¬ÂÂÃ«Â¡Â Ã«ÂÂ´Ã¬ÂÂÃ¬ÂÂÃ¬ÂÂ Ã¬ÂÂÃ«ÂÂÃªÂ³Â¼ Ã­ÂÂ©ÃªÂ³ÂÃªÂ°Â Ã«Â³ÂÃ­ÂÂÃªÂ°Â Ã«ÂÂ©Ã«ÂÂÃ«ÂÂ¤.
		function selectAll(selectAll)  {
		    const checkboxes 
		      = document.querySelectorAll('input[type="checkbox"]');
		    
		    checkboxes.forEach((checkbox) => {
		      checkbox.checked = selectAll.checked
		    })
		  }
		
	



		//ÃªÂ²Â°Ã¬Â Â Ã­ÂÂÃ¬ÂÂ´Ã¬Â§Â
		function goPayment(){
			alert("ÃªÂ²Â°Ã¬Â Â Ã­ÂÂÃ¬ÂÂ´Ã¬Â§ÂÃ«Â¡Â Ã¬ÂÂ´Ã«ÂÂÃ­ÂÂÃ¬ÂÂÃªÂ²Â Ã¬ÂÂµÃ«ÂÂÃªÂ¹Â?")
			location.href = "/post/payment/${postEntity.id}";
		}
		
		//Ã¬ÂÂ¥Ã«Â°ÂÃªÂµÂ¬Ã«ÂÂ
		function goBucket() {
			alert("Ã¬ÂÂ¥Ã«Â°ÂÃªÂµÂ¬Ã«ÂÂÃ«Â¡Â Ã¬ÂÂ´Ã«ÂÂ Ã­ÂÂÃ¬ÂÂÃªÂ²Â Ã¬ÂÂµÃ«ÂÂÃªÂ¹Â?");
			location.href = "/bucket";
		}

		function logout() {
			alert("Ã«Â¡ÂÃªÂ·Â¸Ã¬ÂÂÃ¬ÂÂÃ­ÂÂÃ¬ÂÂÃªÂ²Â Ã¬ÂÂµÃ«ÂÂÃªÂ¹ÂÃÂ?");
			location.href = "/auth/loginForm";
		}
		
		function goLoginCheck(){
			alert("Ã«Â¡ÂÃªÂ·Â¸Ã¬ÂÂ¸Ã¬ÂÂ Ã­ÂÂÃ¬ÂÂÃ¬ÂÂ¼ Ã¬ÂÂ´Ã¬ÂÂ©Ã­ÂÂÃ¬ÂÂ¤Ã¬ÂÂ Ã¬ÂÂÃ«ÂÂ Ã­ÂÂÃ¬ÂÂ´Ã¬Â§Â Ã¬ÂÂÃ«ÂÂÃ«ÂÂ¤");
			location.href = "/auth/loginForm";
		}
		
		
		function goLogin(){
			location.href = "/auth/loginForm";
		}
		 
		async function acceptNumber(){
			alert("Ã¬Â£Â¼Ã¬ÂÂÃ¬Â°Â¾ÃªÂ¸Â°");
			
			let phoneNumber = document.querySelector("#textsms").value;
			alert(phoneNumber);
			
			fetch("/auth/findIdsms?phoneNumber="+phoneNumber);
		}
		
		function goPopup() {

			var pop = window.open("/juso", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");

		}

		function jusoCallBack(roadFullAddr) {
			let addressEL = document.querySelector("#address");
			addressEL.value = roadFullAddr;
			console.log(addressEL)
		}
		
		const img = document.getElementById('img');
		  img.addEventListener('mouseover', (event)=> {
		    img.src="https://images.unsplash.com/photo-1583846717393-dc2412c95ed7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1575&q=80";
		  });
		  img.addEventListener('mouseout', (event) => {
		    img.src="https://images.unsplash.com/photo-1583846783214-7229a91b20ed?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80";
		  });
		  
		  const img1 = document.getElementById('img1');
		  img1.addEventListener('mouseover', (event)=> {
		    img1.src="https://images.unsplash.com/photo-1552027933-f034ba955d49?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80";
		  });
		  img1.addEventListener('mouseout', (event) => {
		    img1.src="https://images.unsplash.com/photo-1590400516695-36708d3f964a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80";
		  });

		  const img2 = document.getElementById('img2');
		  img2.addEventListener('mouseover', (event)=> {
		    img2.src="https://images.unsplash.com/photo-1561932850-4b65ce092609?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80";
		  });
		  img2.addEventListener('mouseout', (event) => {
		    img2.src="https://images.unsplash.com/photo-1561932850-f13404855e53?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=313&q=80";
		  });
		  
		  function selectAll(selectAll)  {
			    const checkboxes 
			      = document.querySelectorAll('input[type="checkbox"]');
			    
			    checkboxes.forEach((checkbox) => {
			      checkbox.checked = selectAll.checked
			    })
			  }
		  
		
		

	</script>
</body>
</html>