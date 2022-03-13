function searchSeries(series_name) {
    $.ajax({
        url: "series_list",
        data: {
            "series_name": series_name
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

function clear_search_bar(id){
    document.getElementById(id).value = ""
    searchSeries("")
}


window.onload = function () {
    clear_search_bar("form-series")
}
