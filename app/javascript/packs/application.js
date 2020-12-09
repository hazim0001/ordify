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
import NProgress from "nprogress";

// International Telephone Number with Flags and Country Dial Codes
import intlTelInput from 'intl-tel-input';

import { initKitchenOrderCable } from '../channels/kitchen_order_channel'



// ----------------------------------------------------------------
//Page Loader on Top

document.addEventListener('turbolinks:request-start', () => {
  NProgress.start();
});


document.addEventListener('turbolinks:request-end', () => {
  NProgress.done();
});

// ----------------------------------------------------------------

// import { initSelect2 } from '../components/init_select2';
document.addEventListener('turbolinks:load', () => {

  // International Telephone Number with Flags and Country Dial Codes
  const phone = document.getElementById("phone");

  if (phone) {
    intlTelInput(phone, {
    initialCountry: 'mx',
    // ipinfoToken: "yolo",
    // numberType: "MOBILE",
    formatOnDisplay: true,
    preferredCountries: ['mx', 'us', 'gb'],
    utilsScript: "/utils.js"
    });
  }

  // FLAGS INT-TEL-INPUT

  var flag = document.querySelector(".iti__flag")
  var arrow = document.querySelector(".iti__arrow")

  if (flag) {
    // flag.classList.add("scale-veronica", "position-veronica");
    arrow.classList.add("position-arrow");
  }

  // ----------------------------------------------------------------


  // Channel method
  initKitchenOrderCable()

  // ----------------------------------------------------------------

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

  // ----------------------------------------------------------------

  // MODAL FRYING PAN Trigger

  var form = document.getElementById("modal-trigger")
  var modal = document.getElementById("sentNotification2")

  if (form) {
    form.addEventListener('submit', (e)=> {
    modal.classList.add("showSpecial");
    });
  }

  // ----------------------------------------------------------------

  // MODAL PIZZA Trigger

  var btnTrigger = document.getElementById("modal-0line-items-trigger")
  var modalNoItems = document.getElementById("noItemsNotification")
  var closeBtn = document.getElementsByClassName("close")[0];

  if (btnTrigger) {
    btnTrigger.addEventListener('click', (e)=> {
      modalNoItems.classList.add("showSpecial");
    });
    closeBtn.addEventListener('click', (e)=> {
      modalNoItems.classList.remove("showSpecial");
    });
  }

  var btnTrigger2 = document.getElementById("modal-0line-items-trigger2")
  var modalNoItems2 = document.getElementById("noItemsNotification2")

  if (btnTrigger2) {
    btnTrigger2.addEventListener('click', (e)=> {
      modalNoItems2.classList.add("showSpecial");
    });
    closeBtn.addEventListener('click', (e)=> {
      modalNoItems2.classList.remove("showSpecial");
    });
  }

  // PIZZA Animation

  'use strict'

  let toRadians = (deg) => deg * Math.PI / 180
  let map = (val, a1, a2, b1, b2) => b1 + (val - a1) * (b2 - b1) / (a2 - a1)

  if (modalNoItems||modalNoItems2) {

    class Pizza {
      constructor(id) {
        this.canvas = document.getElementById(id)
        this.ctx = this.canvas.getContext('2d')

        this.sliceCount = 6
        this.sliceSize = 80

        this.width = this.height = this.canvas.height = this.canvas.width = this.sliceSize * 2 + 50
        this.center = this.height / 2 | 0

        this.sliceDegree = 360 / this.sliceCount
        this.sliceRadians = toRadians(this.sliceDegree)
        this.progress = 0
        this.cooldown = 10

      }

      update() {
        let ctx = this.ctx
        ctx.clearRect(0, 0, this.width, this.height)

        if (--this.cooldown < 0) this.progress += this.sliceRadians*0.01 + this.progress * 0.07

        ctx.save()
        ctx.translate(this.center, this.center)

        for (let i = this.sliceCount - 1; i > 0; i--) {

          let rad
          if (i === this.sliceCount - 1) {
            let ii = this.sliceCount - 1

            rad = this.sliceRadians * i + this.progress

            ctx.strokeStyle = '#FBC02D'
            cheese(ctx, rad, .9, ii, this.sliceSize, this.sliceDegree)
            cheese(ctx, rad, .6, ii, this.sliceSize, this.sliceDegree)
            cheese(ctx, rad, .5, ii, this.sliceSize, this.sliceDegree)
            cheese(ctx, rad, .3, ii, this.sliceSize, this.sliceDegree)

          } else rad = this.sliceRadians * i

          // border
          ctx.beginPath()
          ctx.lineCap = 'butt'
          ctx.lineWidth = 11
          ctx.arc(0, 0, this.sliceSize, rad, rad + this.sliceRadians)
          ctx.strokeStyle = '#F57F17'
          ctx.stroke()

          // slice
          let startX = this.sliceSize * Math.cos(rad)
          let startY = this.sliceSize * Math.sin(rad)
          let endX = this.sliceSize * Math.cos(rad + this.sliceRadians)
          let endY = this.sliceSize * Math.sin(rad + this.sliceRadians)
          let varriation = [0.9,0.7,1.1,1.2]
          ctx.fillStyle = '#FBC02D'
          ctx.beginPath()
          ctx.moveTo(0, 0)
          ctx.lineTo(startX, startY)
          ctx.arc(0, 0, this.sliceSize, rad, rad + this.sliceRadians)
          ctx.lineTo(0, 0)
          ctx.closePath()
          ctx.fill()
          ctx.lineWidth = .3
          ctx.stroke()

          // meat
          let x = this.sliceSize * .65 * Math.cos(rad + this.sliceRadians / 2)
          let y = this.sliceSize * .65 * Math.sin(rad + this.sliceRadians / 2)
          ctx.beginPath()
          ctx.arc(x, y, this.sliceDegree / 6, 0, 2 * Math.PI)
          ctx.fillStyle = '#D84315'
          ctx.fill()

        }

        ctx.restore()

        if (this.progress > this.sliceRadians) {
          ctx.translate(this.center, this.center)
          ctx.rotate(-this.sliceDegree * Math.PI / 180)
          ctx.translate(-this.center, -this.center)

          this.progress = 0
          this.cooldown = 20
        }

      }

    }

    function cheese(ctx, rad, multi, ii, sliceSize, sliceDegree) {
      let x1 = sliceSize * multi * Math.cos(toRadians(ii * sliceDegree) - .2)
      let y1 = sliceSize * multi * Math.sin(toRadians(ii * sliceDegree) - .2)
      let x2 = sliceSize * multi * Math.cos(rad + .2)
      let y2 = sliceSize * multi * Math.sin(rad + .2)

      let csx = sliceSize * Math.cos(rad)
      let csy = sliceSize * Math.sin(rad)

      var d = Math.sqrt((x1 - csx) * (x1 - csx) + (y1 - csy) * (y1 - csy))
      ctx.beginPath()
      ctx.lineCap = 'round'

      let percentage = map(d, 15, 70, 1.2, 0.2)

      let tx = x1 + (x2 - x1) * percentage
      let ty = y1 + (y2 - y1) * percentage
      ctx.moveTo(x1, y1)
      ctx.lineTo(tx, ty)

      tx = x2 + (x1 - x2) * percentage
      ty = y2 + (y1 - y2) * percentage
      ctx.moveTo(x2, y2)
      ctx.lineTo(tx, ty)

      ctx.lineWidth = map(d, 0, 100, 20, 2)
      ctx.stroke()
    }

    let pizza = new Pizza('pizza')

    ;(function update() {
      requestAnimationFrame(update)
      pizza.update()

    }())
  }

  // ----------------------------------------------------------------

  // var cardRotation = document.querySelector(".category-card")
  // if (cardRotation) {
  //   cardRotation.addEventListener('click', (e)=> {
  //     e.preventDefault();
  //     cardRotation.classList.add("rotate-card");
  //   });
  // }

  // ----------------------------------------------------------------
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


