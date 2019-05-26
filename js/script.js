window.onload = function() {
    var btn = getElementById("btn");
    btn.onclick = starA();
}

function starA() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            document.getElementById("do").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "/js/123.txt", true);
    xhttp.send();
}