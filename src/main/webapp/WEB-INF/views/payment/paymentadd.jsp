
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8" />
    <title>Sample Payment</title>
<!-- jQuery -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<c:import url="../temp/bootstrap.jsp"></c:import>
<c:import url="../temp/header1.jsp"></c:import>
<c:import url="../temp/template.jsp"></c:import>

  </head>
  <body>
    		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-7">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">결제하기</h3>
							</div>
							<div class="form-group" id="member" data-email="${member.email}" data-name="${member.name}"
							data-phone="${member.phone}" data-address="${member.address}" data-code="${member.zipCode}">
								배송지
								<input class="input" type="text" name="first-name" placeholder="First Name">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="last-name" placeholder="배송시 요청사항">
							</div>
						</div>
						<!-- /Billing Details -->

						<!-- Shiping Details -->
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title">결제수단</h3>
							</div>
							
						</div>
						<!-- /Shiping Details -->

						<!-- Order notes -->
						<div class="order-notes">
							<textarea class="input" placeholder="Order Notes"></textarea>
						</div>
						<!-- /Order notes -->
					</div>

					<!-- Order Details -->
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title" id="order" data-name="${dto.proName}" data-price="100"
							>Your Order</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>PRODUCT</strong></div>
								<div><strong>TOTAL</strong></div>
							</div>
							<div class="order-products">
								<div class="order-col">
									<div>1x Product Name Goes Here</div>
									<div>$980.00</div>
								</div>
							</div>
							<div class="order-col">
								<div>Shiping</div>
								<div><strong>FREE</strong></div>
							</div>
							<div class="order-col">
								<div><strong>TOTAL</strong></div>
								<div><strong class="order-total">$2940.00</strong></div>
							</div>
						</div>
						
						<button type="button" href="#" id="btn" class="primary-btn order-submit">Place order</button>
					</div>
					<!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
<c:import url="../temp/footer1.jsp"></c:import>
    <script>

      let proName=$('#order').attr("data-name");
      console.log(proName);
   	  let proPrice=$('#order').attr('data-price');
   	  console.log(proPrice);
   	  let name=$('#member').attr('data-name');
   	  let phone=$('#member').attr('data-phone');
   	  
   	  $('#btn').click(function(){
   		requestPay();
   	  })

   	  function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    var uid = '';
    IMP.init('imp50730076');
    IMP.request_pay({
        pg: "html5_inicis.INIBillTst",
        pay_method: "card",
        merchant_uid: 3456+new Date().getTime(),//가맹점 주문번호
        name: proName,//상품명
        amount: proPrice,//가격

        buyer_name: name,//구매자
        buyer_tel: phone,//구매자 번호

      }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
        	//rsp는 success(결제 성공 여부), paid_amount(결제된 금액), imp_uid(아임포트 거래 고유 번호) 등을 담고 있는 객체
        	uid = rsp.imp_uid;
            
      		// 결제검증
            $.ajax({
                url: '/order/verify_iamport/' + rsp.imp_uid,
                type: 'post'
            }).done(function(data) {
                // 결제를 요청했던 금액과 실제 결제된 금액이 같으면 해당 주문건의 결제가 정상적으로 완료된 것으로 간주한다.
                if (cdPay.textContent == data.response.amount) {
                    // jQuery로 HTTP 요청
                    // 주문정보 생성 및 테이블에 저장 
		        	
                        // 데이터를 json으로 보내기 위해 바꿔준다.
                        data = JSON.stringify({
                           
                            "paymentNo" : rsp.merchant_uid,
                            "proName": proName,//상품명
                            "proPrice": rsp.paid_amount,//가격
                            "proName" : rsp.name,
                            "name": name,//구매자
                            "Phone": phone,//구매자 번호
                            "imp_uid" : rsp.imp_uid

                        });
					
                        $.ajax({
                            url: "/order/complete", 
                            type: "POST",
                            dataType: 'json',
                            contentType: 'application/json',
                            data : data
                        })
                        .done(function(res) {
                            if (res > 0) {
                                swal('주문정보 저장 성공')
                                createPayInfo(uid);
                            }
                            else {
                                swal('주문정보 저장 실패');
                            }
                        })
                }
                else {
                    alert('결제 실패');
                }
            })
            } else {
                swal("결제에 실패하였습니다.","에러 내용: " +  rsp.error_msg,"error");
            }
        });
}

    </script>
</body>
</html>
