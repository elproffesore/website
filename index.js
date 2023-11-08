function showMenu(){
    document.getElementById("burgerOpen").style.visibility = "hidden"
    document.getElementById("burgerClose").style.visibility = "visible"
    document.getElementsByClassName("menu")[0].style.visibility = "visible"
}
function closeMenu(){
    document.getElementById("burgerClose").style.visibility = "hidden"
    document.getElementById("burgerOpen").style.visibility = "visible"
    document.getElementsByClassName("menu")[0].style.visibility = "hidden"
}