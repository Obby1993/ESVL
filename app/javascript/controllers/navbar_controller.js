// // navbar_controller.js
// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   static targets =["link"]

//   connect (){
//     console.log("connecté à navbar 1")
//     // this.resetActiveClass();
//     console.log(this.linkTargets);


//   }


//   setActive(event) {
//     console.log(event.currentTarget);


//     this.resetActiveClass();
//     // console.log(this.linkTarget);
//     event.target.classList.add("active");
//     console.log(this.linkTargets);

//   }

//   resetActiveClass() {
//     this.linkTargets.forEach((link) => {
//       link.classList.remove("active");
//       // console.log("remove");
//     });
//   }

// }
