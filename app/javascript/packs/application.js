// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// Internal imports, e.g:
import "bootstrap";
import "jquery";
import intlTelInput from 'intl-tel-input';
import { initKitchenOrderCable } from '../channels/kitchen_order_channel'

// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  // const input = document.querySelector("#phone");
  // intlTelInput(input, {
  //     // any initialisation options go here
  // });

 // Channal method
  initKitchenOrderCable()


// THIS CODE FOR ADD BUTTON that we r using on order summary and menu item index
  const decrement = (event) => {
    const btn = event.target.parentNode.parentElement.querySelector(
      'button[data-action="decrement"]'
    );
    const target = btn.nextElementSibling;
    let value = Number(target.value);
    if (value === 0){
      event.preventDefault();
    } else {
      value--;
      target.value = value;
    }
  }

  const increment = (event) => {
    const btn = event.target.parentNode.parentElement.querySelector(
      'button[data-action="decrement"]'
    );
    const target = btn.nextElementSibling;
    let value = Number(target.value);
    if (value === 10){
      event.preventDefault();
    } else {
      value++;
      target.value = value;
    }
  }

  const decrementButtons = document.querySelectorAll(
    `button[data-action="decrement"]`
  );

  const incrementButtons = document.querySelectorAll(
    `button[data-action="increment"]`
  );

  decrementButtons.forEach(btn => {
    btn.addEventListener("click", decrement);
  });

  incrementButtons.forEach(btn => {
    btn.addEventListener("click", increment);
  });

  var form = document.getElementById("modal-trigger")
  var modal = document.getElementById("sentNotification2")

  if (form) {
    form.addEventListener('submit', (e)=> {
    modal.classList.add("showSpecial");
    });
  }

  /// Clock function showen in kitchen view
  var tday=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
  var tmonth=["January","February","March","April","May","June","July","August","September","October","November","December"];

  function GetClock(){
  var d=new Date();
  var nday=d.getDay(),nmonth=d.getMonth(),ndate=d.getDate(),nyear=d.getFullYear();
  var nhour=d.getHours(),nmin=d.getMinutes(),nsec=d.getSeconds();
  if(nmin<=9) nmin="0"+nmin;
  if(nsec<=9) nsec="0"+nsec;

  var clocktext=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+"";
  const clock = document.getElementById('clockbox');
  if (clock){
    clock.innerHTML = clocktext
  }}

  GetClock();
  setInterval(GetClock,1000);



  /* dashboard icons */

  (function () {
    'use strict'

    feather.replace()
  })()


});





