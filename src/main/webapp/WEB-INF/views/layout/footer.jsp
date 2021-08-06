<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--footer-->
<div class="jumbotron text-center" style="margin-bottom: 0">
	<p>Footer</p>
</div>
<script>


function goPaymentAPI(){
	event.preventDefault()

	
	 let IMP = window.IMP;
    IMP.init("imp55496891");
    IMP.request_pay({
        pg: "html5_inicis",//ì´ëìì¤ ì¹íì¤ ê²°ì ì°½
        pay_method: "card",//ê²°ì ë°©ë²
        merchant_uid: "ORD20180131-000001",//ì£¼ë¬¸ë²í¸
        name: "ì²­ë°ì§",//ìíëª
        amount: 1,//ê°ê²©
        buyer_email: "ssar@gmail.com",//ì´ë©ì¼
        buyer_name: "ì´í¸ê²¸",//ì´ë¦
        buyer_tel: "010-4242-4242",//ì°ë½ì²
        buyer_addr: "ìì¸í¹ë³ì ê°ë¨êµ¬ ì ì¬ë",//ì£¼ì
        buyer_postcode: "01181"//ìíì½ë
    }, function (rsp) {
    	 if (rsp.success) { // ê²°ì  ì±ê³µ ì: ê²°ì  ì¹ì¸ ëë ê°ìê³ì¢ ë°ê¸ì ì±ê³µí ê²½ì°
    	      // jQueryë¡ HTTP ìì²­
    	      jQuery.ajax({
    	          url: "/payment", //í´ë¹ uriì íë¼ë¯¸í°ê°ì ë¬
    	          method: "POST",
    	          headers: { "Content-Type": "application/json" },
    	          data: {
    	              imp_uid: rsp.imp_uid,
    	              merchant_uid: rsp.merchant_uid
    	          }
    	      }).done(function (data) {
    	        // ê²°ì  ì±ê³µíìë ë¡ì§
    	        
    	      })
    	    } else {
    	      alert("ê²°ì ì ì¤í¨íììµëë¤. ìë¬ ë´ì©: " +  rsp.error_msg);
    	    }
    	  });
}



		// DBìì íë§¤ê°ë¥¼ ë³ìë¡ ë´ììì ìëê³¼ í©ê³ê° ë³íê° ë©ëë¤.
		function selectAll(selectAll)  {
		    const checkboxes 
		      = document.querySelectorAll('input[type="checkbox"]');
		    
		    checkboxes.forEach((checkbox) => {
		      checkbox.checked = selectAll.checked
		    })
		  }
		
	



		//ê²°ì  íì´ì§
		function goPayment(){
			alert("ê²°ì  íì´ì§ë¡ ì´ëíìê² ìµëê¹?")
			location.href = "/post/payment/${postEntity.id}";
		}
		
		//ì¥ë°êµ¬ë
		function goBucket() {
			
			alert("장바구니에 가시겠습니까?");
			
			
			
			location.href = "/bucket/${principal.id}";
		}
		
		async function inputBucket(productname,image,size,price) {
			
			console.log("나실행됨?");
			event.preventDefault();
			
			let postDto = {
					productname: productname,
					image: image,
					size: size,
					price: price
			};
			
			let response = await fetch("/bucket",{
				method: "post",
				body: JSON.stringify(postDto),
				headers: {
					"Content-Type": "application/json;charset=utf-8"
				}
			});
			
			let parseResponse = await response.text();
			
			console.log(parseResponse);
    		
    		if(parseResponse === "ok"){
    			
    			if(confirm("선택한 상품이 장바구니에 담겼습니다, 장바구니로 가시겠습니까?")== true) {
    				location.href = "/bucket/${principal.id}";
    				
    			} else {
    				return ;
    			}
    		}
    		
    		if(parseResponse === "no") {
    			
    			if(confirm("선택한 상품이 장바구니에 담겼습니다, 장바구니로 가시겠습니까?")== true) {
    				location.href = "/bucket/${principal.id}";
    				
    			} else {
    				return ;
    			}
    		}
			
			
			
			
			
		}

		function logout() {
			alert("ë¡ê·¸ììíìê² ìµëê¹Â?");
			location.href = "/auth/loginForm";
		}
		
		function goLoginCheck(){
			alert("ë¡ê·¸ì¸ì íìì¼ ì´ì©íì¤ì ìë íì´ì§ ìëë¤");
			location.href = "/auth/loginForm";
		}
		
		
		function goLogin(){
			location.href = "/auth/loginForm";
		}
		 
		async function acceptNumber(){
			alert("ì£¼ìì°¾ê¸°");
			
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
		
// 		const img = document.getElementById('img');
// 		  img.addEventListener('mouseover', (event)=> {
// 		    img.src="https://images.unsplash.com/photo-1583846717393-dc2412c95ed7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1575&q=80";
// 		  });
// 		  img.addEventListener('mouseout', (event) => {
// 		    img.src="https://images.unsplash.com/photo-1583846783214-7229a91b20ed?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80";
// 		  });
		  
// 		  const img1 = document.getElementById('img1');
// 		  img1.addEventListener('mouseover', (event)=> {
// 		    img1.src="https://images.unsplash.com/photo-1552027933-f034ba955d49?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80";
// 		  });
// 		  img1.addEventListener('mouseout', (event) => {
// 		    img1.src="https://images.unsplash.com/photo-1590400516695-36708d3f964a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80";
// 		  });

// 		  const img2 = document.getElementById('img2');
// 		  img2.addEventListener('mouseover', (event)=> {
// 		    img2.src="https://images.unsplash.com/photo-1561932850-4b65ce092609?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80";
// 		  });
// 		  img2.addEventListener('mouseout', (event) => {
// 		    img2.src="https://images.unsplash.com/photo-1561932850-f13404855e53?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=313&q=80";
// 		  });
		  
		  function selectAll(selectAll)  {
			    const checkboxes 
			      = document.querySelectorAll('input[type="checkbox"]');
			    
			    checkboxes.forEach((checkbox) => {
			      checkbox.checked = selectAll.checked
			    })
			  }
		  
		// DBÃ¬ÂÂÃ¬ÂÂ Ã­ÂÂÃ«Â§Â¤ÃªÂ°ÂÃ«Â¥Â¼ Ã«Â³ÂÃ¬ÂÂÃ«Â¡Â Ã«ÂÂ´Ã¬ÂÂÃ¬ÂÂÃ¬ÂÂ Ã¬ÂÂÃ«ÂÂÃªÂ³Â¼ Ã­ÂÂ©ÃªÂ³ÂÃªÂ°Â Ã«Â³ÂÃ­ÂÂÃªÂ°Â Ã«ÂÂ©Ã«ÂÂÃ«ÂÂ¤.

		

	</script>
</body>
</html>