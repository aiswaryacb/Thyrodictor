$(document).ready(function(){
    $('#doctor').validate({
        rules:{
            dname: {
                required: true,
                minlength: 3,
                maxlength:15
                
            },
            preg:{
                required:true,
                lessThanToday:true
                
            },       
            dgender:{
                required:true
            },
           demail:{
                required:true,
                email:true
            },
            dphn:{
            	required:true,
                number:true,
                minlength:10,
                maxlength:10
            },
            dstate:{
                required:true
            },
            ddistrict:{
                required:true
            },
            
            dpassword:{
                required:true,
                minlength:6,
                maxlength:10
            }
        },
        messages:{
        	dname: {
                required: "Please give your name",
                minlength: "Too small name",
                maxlength: "Too large name"
                
            },
            dreg:{
                required:"Please give your register number",
                
                
            },       
            dgender:{
                required:"Gender is required"
            },
           demail:{
                required:"Please give your email id",
                email:"Please give a valid email id"
            },
            dphn:{
            	required:"Please give your phone number",
                number:"Phone number should contain only numbers",
                minlength:"Enter a valid number",
                maxlength:"Enter a valid number"
            },
            dstate:{
                required:"Please select your state "
            },
            ddistrict:{
                required:"Please select your district"
            },
            
            dpassword:{
                required:"Enter a password",
                minlength:"Too short (atleast 6 characters)",
                maxlength:"Too long (atmost 10 characters)"
            }
            
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
});