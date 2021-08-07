function goLogin(){
			location.href = "/auth/loginForm";
		}

function buy() {
			// 체크 박스 전체 겟수
//			$('input:checkbox[name="id"]').length

			//체크된 박스 겟수
//			$('input:checkbox[name="id"]:checked').length

			// 물건 넘기기!
			$('input:checkbox[name="id"]').each (
				async function checked(){
				if(this.checked){

					// 체크 된 것들 each로 각각의 value 값을 던져주게 만든다
		            alert(this.value); 
					let id = this.value;
					// fetch로 value에 담으면 될듯!
					let postDto = {
							id: id
					};
					
				// 저장만 하기 때문에 response로 String을 안받았음
				// 왜냐하면 여러개를 던져주기 때문에!
				await fetch("/bucket/buy", {
					method: "post",
					body: JSON.stringify(postDto),
					headers: {
						"Content-Type": "application/json;charset=utf-8"
					}
				});
				
				console.log(id+" : id 번째 물건 저장되었어요!");
		      }
				
			});
			// end forEach문
			
			
			//물건을 넘겨 줬으면 이제 View컨트롤러를 때릴 url
			location.href="/";
			
			
		}
		// end buy 함수
		
		
 function selectAll(selectAll)  {
			    const checkboxes 
			      = document.querySelectorAll('input[type="checkbox"]');
			    
			    checkboxes.forEach((checkbox) => {
			      checkbox.checked = selectAll.checked
			    })
			  }