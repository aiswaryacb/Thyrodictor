$(document).ready(function(){
	console.log("ready");
    $("#patient").validate({
        rules:{
            pname: {
                required: true,
                minlength: 3,
                maxlength:15
                
            },
            pdob:{
                required:true,
                lessThanToday:true
                
            },       
            pgender:{
                required:true
            },
           pemail:{
                required:true,
                email:true
            },
            pphn:{
            	required:true,
                number:true,
                minlength:10,
                maxlength:10
            },
            pstate:{
                required:true
            },
            pdistrict:{
                required:true
            },
            pcity:{
                required:true
            },
            ppassword:{
                required:true,
                minlength:6,
                maxlength:10
            }
        },
        messages:{
        	pname: {
                required: "Please give your name",
                minlength: "Too small name",
                maxlength: "Too large name"
                
            },
            pdob:{
                required:"Please give your date of birth",
                lessThanToday:"Please provide a valid date of birth"
                
            },       
            pgender:{
                required:"Gender is required"
            },
           pemail:{
                required:"Please give your email id",
                email:"Please give a valid email id"
            },
            pphn:{
            	required:"Please give your phone number",
                number:"Phone number should contain only numbers",
                minlength:"Enter a valid number",
                maxlength:"Enter a valid number"
            },
            pstate:{
                required:"Please select your state "
            },
            pdistrict:{
                required:"Please select your district"
            },
            pcity:{
                required:"Please select your city"
            },
            ppassword:{
                required:"Enter a password",
                minlength:"Too short (atleast 6 characters)",
                maxlength:"Too long (atmost 10 characters)"
            }
            
        },
        submitHandler: function(form) {
            form.submit();
        }
    });


jQuery.validator.addMethod("lessThanToday", 
function(value, element) {
    var today = new Date();
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10) {
        dd='0'+dd;
    } 

    if(mm<10) {
        mm='0'+mm;
    } 
    //yyyy=yyyy-24;
    //var date = new Date(dd,mm,yyyy);
    document.getElementById("today").value = today;

    if(!/Invalid|NaN/.test(new Date(value))){
        return (new Date(value) < today);
    }
    return (isNaN(value) && isNan(today) || (Number(value) < Number(today)));
},'Must be less than today date');
});