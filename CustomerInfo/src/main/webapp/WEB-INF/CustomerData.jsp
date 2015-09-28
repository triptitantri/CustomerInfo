<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>


<script type="text/javascript">
function processData(option)
{
	var name = document.getElementById('name').value;
	var email = document.getElementById('mail').value;
	var phone = document.getElementById('phone').value;
	
	//get the address details
	var street = document.getElementById('street').value;
	var city = document.getElementById('city').value;
	var state = document.getElementById('state').value;
	var zip = document.getElementById('zip').value;
	
	var custid = document.getElementById('custid').value;
	
	var address = street.concat(" ").concat(city).concat(" ").concat(state).concat(" ").concat(zip);
	
	switch (option) {
	case "add":
		// create JSON
		 var payload = {
		     "name": name,
		     "phone": phone,
		     "mail": email,
		    // "address":{"street":street,"city":city,"state":state,"zip":zip}
		     "address": address 
		     //}
		 };
		 if (name && phone && email && street && city && state && zip) {
			 postMessage(payload, "addCustomer").done(function(result){
					alert('Record added successfully');
					clearTextBox();
			 }).fail(function() {
				    // an error occurred
				});
		 }else{
			 alert('All fields are mandatory');
		 }
		
		break;
	case "search":
			
		if (name)
			{
			 var payload = {
				     "name": name,
				 };
		}else {
			alert('Please provide name for search');
			break;
		}
		
		$(document).ready(function() {
			   $("#myData").find("tr:gt(0)").remove();
			});
		var isSearchSuccess = false;
		postMessage(payload, "getCustomer").done(function(result){
			 $.each(result, function( index, value ) {
				 //alert(value.name);
                 var row = $("<tr><td>" + value.name + "</td><td>" + value.phone + "</td><td>" + value.mail + "</td><td>" + value.address + "</td></tr>");
                 $("#myData").append(row);
                 isSearchSuccess = true;
               });
			 if (( Boolean(isSearchSuccess))){
				 clearTextBox();
				 }
			 else{
				 alert('No record found.');
			 }
			}).fail(function() {
		    // an error occurred
		});
		
		break;
	}
	
		
		 
  }
  
function postMessage(payload,actiontype) {
	return $.ajax({
		 type: "POST",
		  url: actiontype,
		  data: JSON.stringify(payload),
		  contentType: 'application/json',
		   error: function (request, status, error) {
	        alert(request.responseText);
	    },
	    success:function(data){
	    }
	 });
}


function clearTextBox(){
	
	document.getElementById('name').value = "";
	document.getElementById('mail').value = "";
	document.getElementById('phone').value = "";
	document.getElementById('street').value = "";
	document.getElementById('city').value = "";
	document.getElementById('state').value = "";
	document.getElementById('zip').value = "";
	document.getElementById('custid').value = "";
	
	
}

var specialKeys = new Array();
specialKeys.push(8); //Backspace
function IsNumeric(e,box) {
    var keyCode = e.which ? e.which : e.keyCode
    var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
    if(box == 'phone'){
    document.getElementById("phnerror").style.display = ret ? "none" : "inline";
    }else if(box == 'zip'){
    	 document.getElementById("ziperror").style.display = ret ? "none" : "inline";
    }
    return ret;
}

</script>

 <h2 align="center">Customer Information Portal</h2>

 <input type='hidden' name = 'custid' id = "custid">
<table border="0" cellspacing="2" cellpadding="2"  align="center">
 
  <tr>
  
    <td><label>Name :</label></td>
    <td><input type="text" name="name" id="name"></td>
  </tr>
   <tr>
    <td>&nbsp;</td>
   
    </tr>
      <tr>
    <td><label>Phone :</label></td>
    <td><input type="text" name="phone" id="phone" onkeypress="return IsNumeric(event,'<%="phone" %>');" ondrop="return false;" onpaste="return false;">
    <span id="phnerror" style="color: Red; display: none">* Input digits (0 - 9)</span>
    </td>
  </tr>
   <tr>
    <td >&nbsp;</td>
    </tr>
    <tr>
    <td><label>Email :</label></td>
    <td><input type="text" name="mail" id="mail"></td>
  </tr>
    <tr>
    <td >&nbsp;</td>
   
    </tr>
   <tr>
    <td><label>Street :</label></td>
    <td><input type="text" name="street" id="street"></td>
  </tr>
   <tr>
    <td>&nbsp;</td>
   
    </tr>
   <tr>
    <td><label>City :</label></td>
    <td><input type="text" name="city" id="city"></td>
  </tr>
   <tr>
    <td >&nbsp;</td>
   
    </tr>
   <tr>
    <td><label>State :</label></td>
    <td><input type="text" name="state" id="state"></td>
  </tr>
   <tr>
    <td >&nbsp;</td>
 
    </tr>
   <tr>
    <td><label>Zip :</label></td>
    <td><input type="text" name="zip" id="zip" onkeypress="return IsNumeric(event,'<%="zip" %>');" ondrop="return false;" onpaste="return false;">
     <span id="ziperror" style="color: Red; display: none">* Input digits (0 - 9)</span>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="Add" value="Add" onclick="javascript:processData('<%="add" %>')"> 
  &nbsp;
    
    <input type="submit" name="Search" value="Search" onclick="javascript:processData('<%="search"%>')">
     
    </td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
</table>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<label>Search Results : </label>
	<table id="myData" border="1" style="width:100%" align="center">
   <tr>
    <th width="20%">Name</th>
    <th width="15%">Phone</th>
    <th width="15%">Mail</th>
    <th width="30%">Address</th>
  </tr>
 </table>
</body>
</html>