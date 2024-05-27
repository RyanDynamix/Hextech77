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
// slider
// const rightbtn = document.querySelector('.fa-chevron-right');
// const leftbtn = document.querySelector('.fa-chevron-left');
// let index = 0;
// rightbtn.addEventListener("click", function(){
//     index = index+1;
//     document.querySelector('#slider-content-left-top').style.right = index*100+"%";
// })
// leftbtn.addEventListener("click", function(){
//     document.querySelector('.slider-content-left-top').style.right = "0%";
// })
const listImage = document.querySelector('.slider-content-left-top')
const imgs = document.getElementsByClassName(".imgs")
const btnLeft = document.querySelector('.btn-left')
const btnRight = document.querySelector('.btn-right')
const length = imgs.length
let current = 0

const handleChangeSlide = () => {
    if (current == length - 1) {
        current = 0
        let width = imgs[0].offsetWidth
        listImage.style.transform = `translateX(0px)`
        document.querySelector('.active').classList.remove('active')
        document.querySelector('.index-item-'+ current).classList.add('active')

    } else {
        current ++
        let width = imgs[0].offsetWidth
        listImage.style.transform = `translateX(${width * -1 * current}px)`
        document.querySelector('.active').classList.remove('active')
        document.querySelector('.index-item-'+ current).classList.add('active')
    }
}

let handleEventChangeSlide = setInterval(handleChangeSlide, 4000)

btnRight.addEventListener('click', () => {
    clearInterval(handleEventChangeSlide)
    handleChangeSlide()
    handleEventChangeSlide = setInterval(handleChangeSlide, 4000)
})

btnLeft.addEventListener('click', () => {
    clearInterval(handleEventChangeSlide)
    if (current == 0) {
        current = length - 1
        let width = imgs[0].offsetWidth
        listImage.style.transform = `translateX(${width * -1 * current}px)`
        document.querySelector('.active').classList.remove('active')
        document.querySelector('.index-item-'+ current).classList.add('active')
    } else {
        current --
        let width = imgs[0].offsetWidth
        listImage.style.transform = `translateX(${width * -1 * current}px)`
        document.querySelector('.active').classList.remove('active')
        document.querySelector('.index-item-'+ current).classList.add('active')
    }
    handleEventChangeSlide = setInterval(handleChangeSlide, 4000)
})