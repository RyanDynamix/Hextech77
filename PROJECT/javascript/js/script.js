const addressbtn = document.querySelector('#address-form');
const addressclose = document.querySelector('#address-close');
// console.log(addressbtn);
addressbtn.addEventListener("click", function(){//add event
    document.querySelector('.address-form').style.display = 'flex';
})
addressclose.addEventListener("click", function(){//add event
    document.querySelector('.address-form').style.display = 'none';
})