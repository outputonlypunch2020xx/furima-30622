window.addEventListener('turbolinks:load', () => {
  const Tax = 0.10;
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
  const inputValue = itemPrice.value;
  let total = inputValue * Tax;
  let totalPrice = Math.floor(total);
  
  const addTaxPrice = document.getElementById("add-tax-price");
  addTaxPrice.innerHTML = totalPrice;

  const profit = document.getElementById("profit");
  profit.innerHTML =  inputValue - totalPrice;
  })
});


