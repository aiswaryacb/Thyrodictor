$(function(){
	$("#patient").validate({
		rules:{
			pname:{
				required: true,
			}
		},
		messages:{
			pname:{
				required: "Enter"
			}
		}
	})
})