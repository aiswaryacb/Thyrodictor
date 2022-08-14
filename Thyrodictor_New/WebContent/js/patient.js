function Patient(){
                if(document.getElementById("pname").value==="")
                {
                    alert("Name is required");
                    return false;
                }
                else if(document.getElementById("pdob").value==="")
                {
                    alert("DOB is required");
                    return false;
                }
                else if(document.getElementById("pgender").value==="")
                {
                    alert("gender is required");
                    return false;
                }
                else if(document.getElementById("pemail").value==="")
                {
                    alert("email is required");
                    return false;
                }
                else if(document.getElementById("pphn").value==="")
                {
                    alert("Phone is required");
                    return false;
                }
                else if(document.getElementById("pstate").value==="")
                {
                    alert("State is required");
                    return false;
                }
                else if(document.getElementById("pdistrict").value==="")
                {
                    alert("District is required");
                    return false;
                }
                else if(document.getElementById("pcity").value==="")
                {
                    alert("City is required");
                    return false;
                }
                else if(document.getElementById("ppassword").value==="")
                {
                    alert("Password is required");
                    return false;
                }
                return true;
            }