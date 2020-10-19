
function addPrice(){

  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  
  itemPrice.addEventListener('input', function() {

    let itemPriceValue = document.getElementById("item-price").value;


    let addTaxPriceValue = itemPriceValue * 0.1;
    let parseAddTaxValue = parseInt(addTaxPriceValue)
    
    addTaxPrice.innerHTML = parseAddTaxValue;


    let profitValue = itemPriceValue - addTaxPriceValue;
    let parseProfitValue = parseInt(profitValue);

    profit.innerHTML = parseProfitValue;
  })
}


window.addEventListener('load', addPrice)

  