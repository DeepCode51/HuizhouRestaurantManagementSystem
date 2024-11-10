/* Contact button, form, submit button */
var ct_btn = document.getElementById('contact-button');

var ct_form = document.getElementById('contact-form');

/* Button holders */
var btn_holders = document.querySelectorAll('#contact-form .button-holders');

/* The inputs */
var inputs = document.querySelectorAll('#contact-form .control input');

/* The form */
var form = document.getElementById('form');

/* Success message */
var success_msg = document.getElementById('success-msg');

/* h1 and submit button of the form */
var h1 = document.querySelectorAll('#form h1')[0];
var submit = document.getElementById('submit');

/* start animation on ct_btn click by adding the grow class */

ct_btn.onclick = function() {
  this.innerHTML = '';
  this.className = 'grow';
}

/* add transitionend event for the button to show form */
ct_btn.addEventListener('transitionend', function(){
  this.style.display = 'none';
  ct_form.style.display = 'flex';
});

/* Shrink the button holders on click and reveal the input behind it */
btn_holders.forEach(btn => {
  btn.addEventListener('click', function(){
    btn.innerHTML += ':';
    btn.style.width = '80px';
    btn.parentNode.childNodes[3].focus();
  })
});

/* Submit form */
form.addEventListener('submit', function(e){
  e.preventDefault();
  
  var allRight = true;
  
  // Go through all inputs
  inputs.forEach(input => {
    
    // If an input is empty, don't allow to continue
    if(input.value === ''){
      allRight = false;
    }
  });
  
  
  // Only continue if every input is filled
  if(allRight) {
    
    // hide title and button
    h1.style.display = 'none';
    submit.style.display = 'none';
    
    inputs.forEach(input => {
      input.style.display = 'none';
    });
    
    btn_holders.forEach(btn => {
      btn.innerHTML = '';
      btn.style.width = '40px';
      btn.className = 'loader';
    });
    
    // after 6 seconds show to complete message
    setTimeout(function(){
      success_msg.className = 'grow';
      form.style.display = 'none';
    }, 6000);
    
  } else {
    alert('Please make sure to fill all the inputs!');
  }
});