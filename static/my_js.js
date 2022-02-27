function clear_search_bar(id){
    document.getElementById(id).value = ""
//    search(document.getElementById("form-author").value, document.getElementById("form-book").value)
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