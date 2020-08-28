function doLike(bid, uid){
	console.log(bid+" , "+uid);
	const d = {
			bid : bid,
			uid : uid,
			operation : 'like'	
	}
	
	$.ajax({
		url : "LikeServlet",
		data : d,
		success : function(data, textStatus, jqXHR){
			console.log(data)
			if(data.trim=="true") {
				let c = $(".like-counter").html()
				c++;
				$(".like-counter").html(c);
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(data)
		}
	})
}

console.log("rajkumar")