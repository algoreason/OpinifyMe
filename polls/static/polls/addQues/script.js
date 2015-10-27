function validate(){
	console.log("Here")
	if(document.getElementById('opt1').value=="" ||
		document.getElementById('opt2').value=="" ||
		document.getElementById('opt3').value=="" ||
		document.getElementById('opt4').value==""){
	$('#modal-body-content').text("Please enter all the Options!");
      $('#myModal').modal('toggle');
      return false; 
	}
	return true;
}