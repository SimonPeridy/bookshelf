$('.basicAutoComplete').autoComplete(
    {
        resolverSettings: {
            fail: function () {
                console.log("FAIL, ABORT MISSION")
            }
        },
        events: {
            typed: function (nv, orig) {
                console.log("test ")
                console.log(nv)
                console.log("old ")
                console.log(orig)
            },
            search: function (q, nv, orig) {
                console.log("search testing ")
                console.log(q)
            }
        }
    }
);
//
// $('.basicAutoComplete').autoComplete(
//     {
//         resolverSettings: {
//             url: 'test.json'
//         }
//     }
// )
