<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<link rel="stylesheet" type="text/css" href="styleSheet/all.css"/>
<link rel="stylesheet" type="text/css" href="styleSheet/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="styleSheet/MyStyleSheet.css"/>
<link rel="shortcut icon" href="favicon.ico">
<script type="text/javascript" src="javaScript/MyScript.js" > </script>
<script type="text/javascript" src="javaScript/jquery-3.5.1.min.js" ></script>
<style type="text/css">

.form-control:focus {
    box-shadow: 10px 0px 0px 0px #ffffff !important;
    border-color: #4ca746
}
</style>
</head>
<body>
<h1> </h1>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/3.0.0/jquery.payment.min.js"></script>
<div class="padding mt-5">
    <div class="row">
        <div class="container-fluid d-flex justify-content-center">
            <div class="col-sm-8 col-md-6">
                <div class="card" id="first">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-6"> <span> 	&#8377; <%= request.getAttribute("totalPrice").toString().toUpperCase() %></span> </div>
                            <div class="col-md-6 text-right" style="margin-top: -5px;"> <img src="https://img.icons8.com/color/36/000000/visa.png"> <img src="https://img.icons8.com/color/36/000000/mastercard.png"> <img src="https://img.icons8.com/color/36/000000/amex.png"> </div>
                        </div>
                    </div>
                    <div class="card-body" style="height: 350px">
                    <form action="" method="post" >
                     <div class="form-group"> <label for="cc-number" class="control-label">CARD NUMBER</label> <input id="cc-number" type="tel" class="input-lg form-control cc-number" autocomplete="cc-number" placeholder="---- ---- ---- ----" required> </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group"> <label for="cc-exp" class="control-label">CARD EXPIRY</label> <input id="cc-exp" type="tel" class="input-lg form-control cc-exp" autocomplete="cc-exp" placeholder="-- / --" required> </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group"> <label for="cc-cvc" class="control-label">CARD CVC</label> <input id="cc-cvc" type="password" class="input-lg form-control cc-cvc" autocomplete="off" placeholder="" required> </div>
                            </div>
                        </div>
                        <div class="form-group"> <label for="numeric" class="control-label">CARD HOLDER NAME</label> <input type="text" class="input-lg form-control"> </div>
                        <div class="form-group"> <input value="MAKE PAYMENT" type="button" id="btn-submit" class="btn btn-success btn-lg form-control" style="font-size: .8rem;"> </div>
                     </form>
                    
                     
                  </div>
                </div>

					<div class="card" id="second" style="display: none;">
						<div class="card-header">
							<div class="row">
								<div class="col-md-6">
									<span> <%
									 	Random random = new Random();
									 Integer rndm = random.nextInt(100000);
									 out.print("Transaction Id : " + rndm.toString());
									 %></span>
								</div>
							</div>
						</div>
						<div class="card-body" style="height: 350px">
							<form action="">
								<div class="bg-success">
									<h1 class="text-light text-center">Transaction successful</h1>
								</div>
							</form>
						</div>
					</div>
				</div>
	        </div>
	    </div>
</div>
</body>

<script>

	$(document).ready(function() {
		$("#btn-submit").click(function() {
			$("#first").hide();
			$("#second").show();
			var clear = localStorage.clear();
			$(this).text('Redirecting Please wait ....');

			var delay = 5000;

			var url = 'http://localhost:9001/Project_Shop/'

			setTimeout(function() {
				window.location = url;
			}, delay);
		});
	});
</script>

</html>