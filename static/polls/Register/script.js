function validate(){
    if(document.getElementById('uname').value==""){
     $('#modal-body-content').text("Please enter a username.");
      $('#myModal').modal('toggle');
      return false; 
    }
    else if(!validateUName(document.getElementById('uname').value)){
     $('#modal-body-content').text("Please enter a valid username.");
      $('#myModal').modal('toggle');
      return false; 
    }
    else if(document.getElementById('fname').value==""){
     $('#modal-body-content').text("Please enter a First name.");
      $('#myModal').modal('toggle');
      return false; 
    }
    else if(!validateName(document.getElementById('fname').value)){
     $('#modal-body-content').text("Please enter a valid First Name.");
      $('#myModal').modal('toggle');
      return false; 
    }
    else if(document.getElementById('lname').value==""){
     $('#modal-body-content').text("Please enter a Last name.");
      $('#myModal').modal('toggle');
      return false; 
    }
    else if(!validateName(document.getElementById('lname').value)){
     $('#modal-body-content').text("Please enter a valid Last Name.");
      $('#myModal').modal('toggle');
      return false; 
    }
    else if(document.getElementById('email').value=="" || !validateemail()){
     $('#modal-body-content').text("Please enter a valid email.");
      $('#myModal').modal('toggle');
      return false; 
    }
    else if(document.getElementById('pwd').value==""){
     $('#modal-body-content').text("Please enter a password.");
      $('#myModal').modal('toggle');
      return false; 
    }
    else if(!validatePwdLen()){
      $('#modal-body-content').text("Password must be atleast 6 characters.");
      $('#myModal').modal('toggle');
      return false;
    }
    else if(document.getElementById('re-pwd').value==""){
     $('#modal-body-content').text("Please enter the password again.");
      $('#myModal').modal('toggle');
      return false; 
    }
    
    else if(!validatepwd()){
     $('#modal-body-content').text("Passwords do not match. Please Re-enter.");
      $('#myModal').modal('toggle');
      document.getElementById('pwd').value="";
      document.getElementById('re-pwd').value="";
      return false; 
    }
    
    else if(!document.getElementById('checkbox-1').checked){
      $('#modal-body-content').text("Please check the check box, to agree to the terms and conditions.");
      $('#myModal').modal('toggle');
      
      return false;
    }
    
    return true;
  }
  function validateemail()  
  {  
  var x=document.getElementById('email').value;  
  var atposition=x.indexOf("@");  
  var dotposition=x.lastIndexOf(".");  
  if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length)
  {  
    return false;  
  }
  return true;  
  }
  function validatepwd()
  {
    if(document.getElementById('pwd').value==document.getElementById('re-pwd').value)
    {
      return true;
    }
    return false;
  }
  function validatePwdLen()
  {
    var pwd=document.getElementById('pwd').value;
    if(pwd.length<6)
    {
      return false;
    }
    return true;
  }
  function validateUName(name)
  {
    var re=/^[a-zA-Z0-9- ]*$/;
    if(name.search(re)==-1){
      return false;
    }
    return true;
  }
  function validateName(name)
  {
    var re=/^[a-zA-Z- ]*$/;
    if(name.search(re)==-1){
      return false;
    }
    return true;
  }
