$(document).ready(function() {
  reviewListener();
  reviewSubmitListener();
});


var reviewListener = function(){
  $('#reviewButton').on('click', function(event){
    event.preventDefault();
    $('#rating').toggle();
  })
}

var reviewSubmitListener = function(){
  $('#rating').on('submit', function(event){
    event.preventDefault();
    $('#rating').toggle();
  })
}
