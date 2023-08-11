function collapse(id) {
    console.log(id);
    var el = document.getElementsByClassName('collapsible-property-' + id);
    el[0].classList.toggle("active");
    var elb = el[0];

    el = document.getElementsByClassName('content-'+id);
    // console.log(el);
    if (el.length > 0) {
        el0 = el[0];
        console.log(el0.style);
        console.log("Updating style")
        // console.log(el0.style.display)
        el0.style.display = (el0.style.display == 'none' ? 'block' : 'none');
        
        console.log(elb.style.borderBottomLeftRadius)
        elb.style.borderBottomLeftRadius  = (el0.style.display == 'none' ? '5px' : '0px');
        // elb.style.borderBottomLeftRadius = (el0.style.display == 'none' ? '0px' : '25px');
        console.log(elb.style.borderBottomLeftRadius)

        el = document.getElementsByClassName('plus-'+id);
        el[0].innerHTML = (el0.style.display == 'none' ? '+' : '-');

    }
}


// var coll = document.getElementsByClassName("collapsible-property");
// var i;

// for (i = 0; i < coll.length; i++) {
//   coll[i].addEventListener("click", function() {
//       console.log("CALLED");
//     this.classList.toggle("active");
//     var content = this.nextElementSibling;
//     console.log(content);
//     if (content.style.display === "block") {
//       content.style.display = "none";
//     } else {
//       content.style.display = "block";
//     }
//   });
// }