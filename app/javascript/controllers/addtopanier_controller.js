// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   static targets = ["quantityInput"];

//   connect() {
//     console.log("AddToPanierController connected")
//   }

//   addToPanier() {
//     console.log("methode called")
//     const quantity = this.quantityInputTarget.value;
//     const articleId = this.data.get("articleId");
//     console.log(quantity)

//     // Rails.ajax({
//     //   type: "POST",
//     //   url: this.data.get("url"),
//     //   data: `article[id]=${articleId}&article[quantity]=${quantity}`,
//     //   success: (data) => {
//     //     console.log("Article ajouté au panier avec succès");
//     //     // Mettre à jour le panier ou effectuer d'autres actions après l'ajout au panier
//     //   },
//     //   error: (error) => {
//     //     console.error("Une erreur s'est produite lors de l'ajout au panier", error);
//     //   },
//     // });
//   }
// }


// $(document).on('turbolinks:load', function() {
//   $('#add-to-cart-form').on('submit', function(e) {
//     e.preventDefault();

//     var form = $(this);
//     var quantity = $('#quantity-input').val();

//     $.ajax({
//       url: form.attr('action'),
//       method: form.attr('method'),
//       data: { article: { id: form.data('article-id'), quantity: quantity } },
//       dataType: 'script',
//       success: function() {
//         // Mettre à jour le panier ou effectuer d'autres actions après l'ajout au panier
//       }
//     });
//   });
// });
