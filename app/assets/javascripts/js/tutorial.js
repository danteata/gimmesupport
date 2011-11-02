$(function() {
  $('.error').hide();
  $('input.text-input').css({backgroundColor:"#FFFFFF"});
  $('input.text-input').focus(function(){
    $(this).css({backgroundColor:"#FFDDAA"});
  });
  $('input.text-input').blur(function(){
    $(this).css({backgroundColor:"#FFFFFF"});
  });

  $(".button").click(function() {
		// validate and process form
		// first hide any error messages
    $('.error').hide();
		
	  var name = $("textarea#name").val();
		if (name == "") {
      alert('Please enter your question before you submit');
      $("input#name").focus();
      return false;
    }
		
		
		var dataString = 'name='+ name;
		//alert (dataString);return false;
		
		$.ajax({
      type: "POST",
      url: "phpwe/processw.phpw",
      data: dataString,
      success: function() {
       
      }
     });
    return false;
	});
});
runOnLoad(function(){
  $("input#name").select().focus();
});
