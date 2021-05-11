// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//
// $(document).ready(function(){
//     PopUpHide();
// });
// function PopUpShow(){
//     $("#popup1").toggle();
// }
// function PopUpHide(){
//     $("#popup1").hide();
// }

document.addEventListener('DOMContentLoaded', () => {
  var popupTrigger = document.querySelectorAll(".pop"),
  popupModel = document.querySelector("#popup1"),
  popupClose = document.querySelector("#pop2");

  popupTrigger.forEach(item => {
    console.log(item);
    item.addEventListener("click", ( ) => {
      popupModel.style.display = "block";
    });
  });

  popupClose.addEventListener("click", ( ) => {
    if (popupModel.style.display == "block") {
      popupModel.style.display = "";
    }
  });

});



/*
$( document ).ready(function(){
	  $( "#pop1" ).click(
      function(){ // задаем функцию при нажатиии на элемент <pop1>
	    $( ".dropdown-content" ).click(); // вызываем событие click на элементе <dc>
	  });
	  $( ".dropdown-content" ).click(
      function(){ // задаем функцию при нажатиии на элемент <div>
	    $( ".dropdown-content" ).toggle(); // отображаем, или скрываем элемент
	  });
});
*/
