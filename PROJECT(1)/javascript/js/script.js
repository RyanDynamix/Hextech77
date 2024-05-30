// address form
const addressbtn = document.querySelector('#address-form');
const addressclose = document.querySelector('#address-close');
// console.log(addressbtn);
addressbtn.addEventListener("click", function(){//add event
    document.querySelector('.address-form').style.display = 'flex';
})
addressclose.addEventListener("click", function(){//add event
    document.querySelector('.address-form').style.display = 'none';
})
//login form
const loginbtn = document.querySelector('#login-form');
const loginclose = document.querySelector('#login-close');
// console.log(addressbtn);
loginbtn.addEventListener("click", function(){//add event
    document.querySelector('.login-form').style.display = 'flex';
})
loginclose.addEventListener("click", function(){//add event
    document.querySelector('.login-form').style.display = 'none';
})
//slider
let slideIndex = [1,1];
let slideId = ["mySlides1"];
showSlides(1, 0);

function plusSlides(n, no) {
    showSlides(slideIndex[no] += n, no);
}

function showSlides(n, no) {
    let i;
    let x = document.getElementsByClassName(slideId[no]);
    if (n > x.length) {slideIndex[no] = 1}
    if (n < 1) {slideIndex[no] = x.length}
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndex[no]-1].style.display = "block";
}

function autoSlides() {
    for (let i = 0; i < slideId.length; i++) {
        plusSlides(1, i);
    }
}

setInterval(autoSlides, 2000);