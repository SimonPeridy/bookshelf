var authors = []
var series = []

function clear_search_bar(id) {
    document.getElementById(id).value = ""
    launch_search()
}

function launch_search() {
    search(document.getElementById("form-author").value, document.getElementById("form-book").value)
}

function search(author_name, book_name) {
    $.ajax({
        url: "",
        data: {
            "author_name": author_name,
            "book_name": book_name
        },
        type: "POST",
        success: [function (data) {
            document.getElementById("my-body").innerHTML = data
        }],
        error: [function (request, error) {
            console.log("error: " + error);
            console.log("req: " + request.url);
        }]
    });
}

function myautocomplete(search_string, field_type) {
    $.ajax({
        url: "",
        data: {
            "search_string": search_string,
            "field_type": field_type
        },
        type: "POST",
        success: [function (data) {
            document.getElementById("my-body").innerHTML = data
        }],
        error: [function (request, error) {
            console.log("error: " + error);
            console.log("req: " + request.url);
        }]
    });
}

window.onload = function () {
    autocomplete(document.getElementById("id_author"), authors);
    autocompleteSeries(document.getElementById("id_series"), series);
    // document.getElementById("id_series_number").addEventListener("keyup", function () {
    //     var value = parseInt(document.getElementById("id_series_number").value, 10)
    //     if ((isNaN(value)) || (value < 1)) {
    //         document.getElementById("id_series_number").setAttribute("class", "form-control is-invalid")
    //     } else {
    //         document.getElementById("id_series_number").setAttribute("class", "form-control")
    //     }
    // })
}

//autocomplete life
function autocomplete(inp, arr) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    var currentFocus;
    /*execute a function when someone writes in the text field:*/
    inp.addEventListener("input", function (e) {
        if (document.getElementById("id_author").value !== "") {
            console.log("Launching ajax request")
            $.ajax({
                url: "get_authors/",
                data: {
                    "author_name": document.getElementById("id_author").value,
                },
                type: "POST",
                async: false,
                success: function (data) {
                    // document.getElementById("hint").hidden = true
                    arr = data.author_list
                    console.log(arr)
                },
                error: function (request, error) {
                    console.log("error: " + error);
                }
            });
        }
        var a, b, i, val = this.value;
        /*close any already open lists of autocompleted values*/
        closeAllLists();
        if (!val) {
            return false;
        }
        currentFocus = -1;
        /*create a DIV element that will contain the items (values):*/
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-authors autocomplete-foreground list-group");
        /*append the DIV element as a child of the autocomplete container:*/
        this.parentNode.appendChild(a);
        /*for each item in the array...*/
        for (i = 0; i < arr.length; i++) {
            /*check if the item starts with the same letters as the text field value:*/
            // if (arr[i].substring(0, val.length).toUpperCase() == val.toUpperCase()) {
            /*create a DIV element for each matching element:*/
            b = document.createElement("button");

            b.setAttribute("class", "list-group-item list-group-item-action list-group-item-secondary")
            // trouver un moyen en js de mettre en gras seulement les lettres qui matchent ? ou aucune lettre ?
            /*make the matching letters bold:*/
            // b.innerHTML = "<strong>" + arr[i].substring(0, val.length) + "</strong>";
            // b.innerHTML += arr[i].substring(val.length);
            b.innerHTML = arr[i];
            /*insert a input field that will hold the current array item's value:*/
            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
            /*execute a function when someone clicks on the item value (DIV element):*/
            b.addEventListener("click", function (e) {
                /*insert the value for the autocomplete text field:*/
                inp.value = this.getElementsByTagName("input")[0].value;
                /*close the list of autocompleted values,
                (or any other open lists of autocompleted values:*/
                closeAllLists();
                // document.getElementById("hint").hidden = false
            });
            a.appendChild(b);
            // }
        }
    });
    /*execute a function presses a key on the keyboard:*/
    inp.addEventListener("keydown", function (e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("button");
        if (e.keyCode == 40) {
            /*If the arrow DOWN key is pressed,
            increase the currentFocus variable:*/
            currentFocus++;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 38) { //up
            /*If the arrow UP key is pressed,
            decrease the currentFocus variable:*/
            currentFocus--;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 13) {
            /*If the ENTER key is pressed, prevent the form from being submitted,*/
            e.preventDefault();
            if (currentFocus > -1) {
                /*and simulate a click on the "active" item:*/
                if (x) x[currentFocus].click();
            }
        }
    });

    function addActive(x) {
        /*a function to classify an item as "active":*/
        if (!x) return false;
        /*start by removing the "active" class on all items:*/
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        /*add class "autocomplete-active":*/
        x[currentFocus].classList.add("active");
    }

    function removeActive(x) {
        /*a function to remove the "active" class from all autocomplete items:*/
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("active");
        }
    }

    function closeAllLists(elmnt) {
        /*close all autocomplete lists in the document,
        except the one passed as an argument:*/
        var x = document.getElementsByClassName("autocomplete-authors");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }

    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}


//autocomplete for series
//autocompleteSeries(document.getElementById("series"), authors);

//autocomplete life
function autocompleteSeries(inp, arr) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    var currentFocus;
    /*execute a function when someone writes in the text field:*/
    inp.addEventListener("input", function (e) {
        if (document.getElementById("id_series").value !== "") {
            $.ajax({
                url: "get_series/",
                data: {
                    "series_name": document.getElementById("id_series").value
                },
                type: "POST",
                async: false,
                success: function (data) {
                    //                    document.getElementById("hint2").hidden = true
                    arr = data.series_list
                },
                error: function (request, error) {
                    console.log("error: " + error);
                }
            });
        }
        console.log("outside of req")
        var a, b, i, val = this.value;
        //var series_name, series_max_number;
        /*close any already open lists of autocompleted values*/
        closeAllLists();
        if (!val) {
            return false;
        }
        currentFocus = -1;
        /*create a DIV element that will contain the items (values):*/
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-series");
        /*append the DIV element as a child of the autocomplete container:*/
        this.parentNode.appendChild(a);
        /*for each item in the array...*/
        for (i = 0; i < arr.length; i++) {
            var series_name = arr[i].series;
            var series_max_number = arr[i].series_number__max;
            /*check if the item starts with the same letters as the text field value:*/
            if (series_name.substring(0, val.length).toUpperCase() == val.toUpperCase()) {
                /*create a DIV element for each matching element:*/
                b = document.createElement("button");

                b.setAttribute("class", "list-group-item list-group-item-action list-group-item-primary")

                /*make the matching letters bold:*/
                b.innerHTML = "<strong>" + series_name.substring(0, val.length) + "</strong>";
                b.innerHTML += series_name.substring(val.length);
                /*insert a input field that will hold the current array item's value:*/
                b.innerHTML += "<input type='hidden' value='" + series_name + "'>";
                b.innerHTML += "<input type='hidden' value='" + series_max_number + "'>";
                /*execute a function when someone clicks on the item value (DIV element):*/
                b.addEventListener("click", function (e) {
                    /*insert the value for the autocomplete text field:*/
                    inp.value = this.getElementsByTagName("input")[0].value;
                    document.getElementById("series_number").value = parseInt(this.getElementsByTagName("input")[1].value) + 1;
                    /*close the list of autocompleted values,
                    (or any other open lists of autocompleted values:*/
                    closeAllLists();
                    //                    document.getElementById("hint2").hidden = false
                });
                a.appendChild(b);
            }
        }
    });
    /*execute a function presses a key on the keyboard:*/
    inp.addEventListener("keydown", function (e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("button");
        if (e.keyCode == 40) {
            /*If the arrow DOWN key is pressed,
            increase the currentFocus variable:*/
            currentFocus++;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 38) { //up
            /*If the arrow UP key is pressed,
            decrease the currentFocus variable:*/
            currentFocus--;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 13) {
            /*If the ENTER key is pressed, prevent the form from being submitted,*/
            e.preventDefault();
            if (currentFocus > -1) {
                /*and simulate a click on the "active" item:*/
                if (x) x[currentFocus].click();
            }
        }
    });

    function addActive(x) {
        /*a function to classify an item as "active":*/
        if (!x) return false;
        /*start by removing the "active" class on all items:*/
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        /*add class "autocomplete-active":*/
        x[currentFocus].classList.add("active");
    }

    function removeActive(x) {
        /*a function to remove the "active" class from all autocomplete items:*/
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("active");
        }
    }

    function closeAllLists(elmnt) {
        /*close all autocomplete lists in the document,
        except the one passed as an argument:*/
        var x = document.getElementsByClassName("autocomplete-series");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }

    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}