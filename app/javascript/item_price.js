window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = document.getElementById("add-tax-price");
    tax.innerHTML = Math.floor(inputValue/10);
    const Profit = document.getElementById("profit");
    Profit.innerHTML = Math.floor(inputValue - tax.innerHTML);
   console.log(inputValue);
  })
});
