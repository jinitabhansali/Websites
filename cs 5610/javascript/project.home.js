project.home = {

    init: function () {
        project.home.dom.init();
        project.home.services.init();
        project.home.controller.init();
    },

    dom: {
        artistDisplayul: null,
        trackDisplayul: null,
        searchSpanBtn: null,
        searchBox: null,
        searchBtn: null,
        queryName: null,
        dropDownValue: null,
        searchResultTitle: null,
        searchResultUl: null,
        searchDisplay:null,

        init: function () {
            project.home.dom.artistDisplayul = $(".artist-display");
            project.home.dom.trackDisplayul = $(".track-display");
            project.home.dom.searchSpanBtn = $(".searchSpan");
            project.home.dom.searchBox = $(".search-div");
            project.home.dom.searchBtn = $(".search-click");
            project.home.dom.queryName = $(".search-name");
            project.home.dom.dropDownValue = $(".dropDown");
            project.home.dom.searchDisplay = $(".search-box");
        }
    },

    controller: {
        init: function () {
            project.home.controller.searchClicked();
        },
        searchClicked: function () {
            project.home.dom.searchSpanBtn.click(project.home.renderer.displaySearchBox);
        },
        artist_clicked: function (artistResponse) {
            project.results.showPage(artistResponse);
        },
        track_clicked: function (trackResponse) {
            project.tracks.showPage(trackResponse);
        },
        searchForQuery: function () {
            project.home.dom.searchBox.css("display", "none");
            console.log(project.home.dom.dropDownValue.val());
            if (project.home.dom.dropDownValue.val() == 'By Artist') {
                project.home.services.searchByArtist();
            }
            else if (project.home.dom.dropDownValue.val() == 'By Track') {
                project.home.services.searchByTrack();
            }
            else if (project.home.dom.dropDownValue.val() == 'By Album') {
                project.home.services.searchByAlbum();
            }
        }
    },

    services: {
        init: function () {
            project.home.services.getTopArtist(project.home.renderer.displayTopArtist);
            project.home.services.getTopTrack(project.home.renderer.displayTopTrack);
        },
        getTopArtist: function (callback) {
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json",
                success: callback
            });
        },
        getTopTrack: function (callback) {
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json",
                success: callback
            });
        },
        searchByArtist: function () {
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?method=artist.search&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json&artist=" + project.home.dom.queryName.val(),
                success: function (response) {
                    project.searchResults.showPage(response,project.home.dom.queryName.val(),"artist")
                }
            });
        },
        searchByTrack: function () {
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?method=track.search&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json&track=" + project.home.dom.queryName.val(),
                success: function (response) {
                    project.searchResults.showPage(response,project.home.dom.queryName.val(),"track")
                }
            });
        },
        searchByAlbum: function () {
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?method=album.search&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json&album=" + project.home.dom.queryName.val(),
                success: function (response) {
                    project.searchResults.showPage(response,project.home.dom.queryName.val(),"album")
                }
            });
    }
},

    renderer: {
        displayTopArtist: function (response) {
            console.log(response);
            for (var i = 0 ; i < 7; i++) {
                var img = $("<img>").attr("src", response.artists.artist[i].image[3]["#text"])
                                    .css("height", "200px")
                                    .css("padding", "10px")
                                    .css("width", "150px")
                                    .attr("id", i)
                                    .on("click", response, project.home.controller.artist_clicked);
                $("<li>").addClass("display-left")
                         .css("list-style-type", "none")
                         .append(img)
                         .appendTo(project.home.dom.artistDisplayul);
            }
        },
        displayTopTrack: function (response) {
            for (var i = 0 ; i < 7; i++) {
                var img = $("<img>").attr("src", response.tracks.track[i].image[3]["#text"])
                                    .css("height", "200px")
                                    .css("padding", "10px")
                                    .css("width", "150px")
                                    .attr("id", i)
                                    .on("click", response, project.home.controller.track_clicked);
                $("<li>").addClass("display-left")
                         .css("list-style-type", "none")
                         .append(img)
                         .appendTo(project.home.dom.trackDisplayul);
            }
        },
        displaySearchBox: function () {
            if (project.home.dom.searchBox.css("display") == "block") {
                project.home.dom.searchBox.css("display", "none");
            }
            else {
                project.home.dom.searchBox.css("display","block")
            }
            project.home.dom.searchBtn.click(project.home.controller.searchForQuery);
        }
    }
}