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

// International Telephone Number with Flags and Country Dial Codes
import intlTelInput from 'intl-tel-input';

import { initKitchenOrderCable } from '../channels/kitchen_order_channel'

// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  //

 // International Telephone Number with Flags and Country Dial Codes
  const phone = document.getElementById("phone");

  if (phone) {
    intlTelInput(phone, {
    // allowExtensions: true,
    // autoFormat: false,
    // autoHideDialCode: false,
    // autoPlaceholder: false,
    // defaultCountry: "auto",
    // ipinfoToken: "yolo",
    // nationalMode: false,
    // numberType: "MOBILE",
    // //onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
    // //preferredCountries: ['cn', 'jp'],
    // preventInvalidNumbers: true,
    utilsScript: "utils.js"
    });
  }


  var flag = document.querySelector(".iti__flag")
  var arrow = document.querySelector(".iti__arrow")

  if (flag) {
    // flag.classList.add("scale-veronica", "position-veronica");
    arrow.classList.add("position-arrow");
  }

 // Channel method
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

  // var cardRotation = document.querySelector(".category-card")
  // if (cardRotation) {
  //   cardRotation.addEventListener('click', (e)=> {
  //     e.preventDefault();
  //     cardRotation.classList.add("rotate-card");
  //   });
  // }

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

});





