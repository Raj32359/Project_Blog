function addToCart(pId, pName,pPrice) {
	
	let cart = localStorage.getItem("cart");
	if(cart == null) {
		let products = [];
		let product = {
				productId: pId,
				productName: pName,
				productPrice: pPrice,
				productQuantity: 1
		}
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("product addes first time");
	}
	else {
		let pCart = JSON.parse(cart);
		let oldProduct = pCart.find((item) => item.productId == pId)
		if(oldProduct){
		oldProduct.productQuantity = oldProduct.productQuantity+1
		pCart.map((item) => {
			if(item.productQuantity == oldProduct.productQuantity ) {
				item.productQuantity = oldProduct.productQuantity;
			}
		})

		localStorage.setItem("cart", JSON.stringify(pCart));
		console.log("product updated");
		}
		else {
			let product = {
					productId: pId,
					productName: pName,
					productPrice: pPrice,
					productQuantity: 1
			}
			pCart.push(product);
			localStorage.setItem("cart", JSON.stringify(pCart));
			console.log("new product added");
		}
	}
	updateCart();
	confirmPay();
}


function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if(cart == null || cart.length == 0) {
		console.log("Empty Cart");
		$(".cart-items").html("0");
		$(".cart-body").html("<h4 class='text-muted text-center' > Empty Cart </h4>");
		$(".checkout-btn").attr('disabled',true);
	} else {
		console.log(cart);
		$(".cart-items").html(`${cart.length}`);
		let table = `
		<table class="table">
  <thead>
    <tr>
      <th scope="col">Product Name</th>
      <th scope="col">Product Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
		`;
		totalPrice = 0;
		cart.map((item) => {
			table+=`
			<tr>
			<td> ${item.productName} </td>
			<td> ${item.productPrice} </td>
			<td> ${item.productQuantity} </td>
			<td> ${item.productPrice * item.productQuantity} </td>
			<td> <button onclick='deleteFromCart(${item.productId})' class="btn btn-outline-danger" > <i class="far fa-trash-alt"></i> </button>  </td>
			</tr>	`
				totalPrice+=item.productPrice*item.productQuantity;
		})
		
		
		table = table+`
		<tr> <td colspan='5' class="text-right" > <b> Total Price : ${totalPrice} </b> </td> </tr>
		</table>`		
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);
	}
}


function confirmPay() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if(cart == null || cart.length == 0) {
		console.log("Empty Cart");
		//$(".cart-items").html("0");
		$(".cart-body1").html("<h4 class='text-muted text-center' > Empty Cart </h4>");
		//$(".checkout-btn").attr('disabled',true);
	} else {
		console.log(cart);
		$(".cart-items").html(`${cart.length}`);
		let table = `
		<form action="Checkout" method="post">
		<table class="table">
  <thead>
    <tr>
      <th scope="col">Product Name</th>
      <th scope="col">Product Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
		`;
		totalPrice = 0;
		cart.map((item) => {
			table+=`
			<tr>
			<td> ${item.productName} </td>
			<td> ${item.productPrice} </td>
			<td> ${item.productQuantity} </td>
			<td> ${item.productPrice * item.productQuantity} </td>
			<td> <button onclick='deleteFromCart(${item.productId})' class="btn btn-outline-danger" > <i class="far fa-trash-alt"></i> </button>  </td>
			</tr>	`
				totalPrice+=item.productPrice*item.productQuantity;
		})
		
		
		table = table+`
		<tr> <td colspan='5' class="text-right"  > <b> Total Price : ${totalPrice} </b> 
			<input type="hidden" name="totalPrice" value="${totalPrice}" >
		</td> </tr>
		<tr> <td colspan='5' class="text-right">   <button type="submit" class="btn btn-primary"> <i class="fas fa-lock"></i> Process Payment </button> </td></tr>
		</table>
		
		</form>`		
		$(".cart-body1").html(table);
		//$(".checkout-btn").attr('disabled',false);
	}
}


	function deleteFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newCart = cart.filter((item) => item.productId != pid)
	localStorage.setItem('cart', JSON.stringify(newCart))
	updateCart();
	}



$(document).ready(function () {
	updateCart();
	confirmPay();
})


function goToCheckout() {
	window.location = "checkout.jsp"
}




