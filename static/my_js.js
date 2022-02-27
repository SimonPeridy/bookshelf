function clear_search_bar(id){
    document.getElementById(id).value = ""
}

function authorsSearch(searchString) {
    $.ajax({
        url: "",
        data: {
            "author_name": searchString
        },
        type: "POST",
        success: [function (data) {
//            console.log("First diplaying the data")
//            console.log(data)
            document.getElementById("my-body").innerHTML = data
        }],
        error: [function (request, error) {
            console.log("error: " + error);
            console.log("req: " + request.url);
        }]
    });
}