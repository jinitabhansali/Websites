project.searchResults = {

    init: function () {
        project.searchResults.dom.init();
    },

    dom: {
        searchResultTitle: null,
        searchResultUl: null,
        searchBox: null,

        init: function () {
            project.searchResults.dom.searchResultTitle = $(".searchResultTitle");
            project.searchResults.dom.searchResultUl = $(".search-results");
            project.searchResults.dom.searchBox = $(".search-div");
        }
    },

    controller: {
    },

    services: {
    },

    renderer: {
        displaySearchAristResults: function (queryName, response) {
            console.log(response);
            project.searchResults.dom.searchResultTitle.text("Results For : " + queryName);
            for (var i = 0 ; i < 10 ; i++) {
                var resulttitle = $("<h2>").html(response.results.artistmatches.artist[i].name).css('display','inline');
                var img = $("<img>").attr("src", response.results.artistmatches.artist[i].image[1]["#text"])
                                    .css("height", "200px")
                                    .css("width", "150px")
                                    .css("padding-top", "10px");
                var hr = $("<hr>").css("border", "1px solid")
                                  .css("background-color", "black");
                var views = $("<h3>").text(response.results.artistmatches.artist[i].listeners + " views")
                                     .css("display","inline");
                $("<li>").css("list-style-type", "none")
                        .append(img,resulttitle,views)
                        .appendTo(project.searchResults.dom.searchResultUl);
            }
        },
        displaySearchTrackResults: function (queryName, trackSearchResponse) {
            console.log(trackSearchResponse);
            project.searchResults.dom.searchResultTitle.text("Results For : " + queryName);
            for (var i = 0 ; i < 10 ; i++) {
                var trackImage = $("<img>").attr("src", trackSearchResponse.results.trackmatches.track[i].image[2]["#text"])
                                          .css("height", "104px")
                                        .css("width", "185px")
                                        .css("padding-top", "10px");
                var trackTitle = $("<h4>").text(trackSearchResponse.results.trackmatches.track[i].name)
                                          .appendTo(trackImage);
                $("<li>").css("list-style-type", "none")
                         .append(trackImage)
                         .appendTo(project.searchResults.dom.searchResultUl);
            }
        }
    },

    showPage: function (response, queryName, type) {
        project.showPage("searchResults");
        if (type == "artist") {
            project.searchResults.renderer.displaySearchAristResults(queryName, response);
        } else if (type == "track") {
            console.log("in Else if of track");
            project.searchResults.renderer.displaySearchTrackResults(queryName, response);
        } else if (type == "album") {
            project.searchResults.renderer.displaySearchAlbumResults(queryName, response);
        }
    }
}