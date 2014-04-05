project.results = {

    init: function () {
        project.results.dom.init();
    },

    dom: {
        title: null,
        reviewDiv : null,
        reviewUl : null,
        sideBarTitle : null,
        divForTracks: null,
        disImage: null,
        similarTitle: null,
        similarDisplayUl: null,
        detailsDiv: null,
        detailsDivChild : null,

        init: function () {
            project.results.dom.title = $(".dis-title");
            project.results.dom.reviewDiv = $(".dis-reviews");
            project.results.dom.reviewUl = $(".review-list");
            project.results.dom.sideBarTitle = $(".sidebar");
            project.results.dom.divForTracks = $(".dis-top-tracks");
            project.results.dom.disImage = $(".dis-image");
            project.results.dom.similarTitle = $(".mayLike.name");
            project.results.dom.similarDisplayUl = $(".similarUl");
            project.results.dom.detailsDiv = $(".display-details");
            project.results.dom.detailsDivChild = $(".display-details div");
        }
    },

    controller: {
        similarArtistDisplay: function (response) {
            project.results.dom.disImage.empty();
            project.results.dom.title.empty();
            project.results.dom.reviewUl.empty();
            project.results.dom.similarDisplayUl.empty();
            project.results.dom.similarTitle.empty();
            project.results.dom.divForTracks.empty();
            project.results.renderer.similarArtistDisplayRender(response);
        },
        album_clicked: function (response) {
            project.results.dom.disImage.empty();
            project.results.dom.title.empty();
            project.results.dom.reviewUl.empty();
            project.results.dom.similarDisplayUl.empty();
            project.results.dom.similarTitle.empty();
            project.results.dom.divForTracks.empty();
            project.results.dom.similarTitle.empty();
            project.results.dom.sideBarTitle.empty();
            project.results.renderer.albumDisplay(response);
        }
    },

    services: {
        getArtistInfo: function (name) {
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?method=artist.getInfo&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json&artist=" + name,
                success: project.results.renderer.artistInfoDisplay
            });
        },
        getArtistReviews: function (name) {
            $.ajax({
                url: "http://developer.echonest.com/api/v4/artist/reviews?api_key=FZVLRKREHKVSXN86B&format=json&results=10&name=" + name,
                success : project.results.renderer.artistReviewDisplay
            });
        },
        getAlbumsForArtist: function (name) {
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json&artist=" + name,
                success : project.results.renderer.albumsForArtistDisplay
            });
        },
        getSimilarArtists: function (name) {
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?method=artist.getSimilar&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json&artist=" + name,
                success: project.results.renderer.similarArtists
            });
        },
        getAlbumInfo: function (albumName, artistName) {
            console.log(artistName);
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json &artist="+artistName+"&album="+albumName,
                success : project.results.renderer.albumInfoDisplay
            });
        }
     },

    renderer: {
        artistDisplay: function (response) {
            var img = $("<img>").attr("src", response.data.artists.artist[response.target.id].image[3]["#text"])
                            .css("height", "200px")
                            .css("width", "150px")
                            .css("display", "block")
                            .css("margin", "0 auto")
                            .css("float", "right")
                             .css("float", "right");
            var span = $("<span>").addClass("glyphicon glyphicon-music")
                              .html(response.data.artists.artist[response.target.id].listeners + " listeners");
            project.results.dom.disImage.append(img, span);
            var title = $("<h1>").text(response.data.artists.artist[response.target.id].name)
                                 .css("margin", "0px")
                                 .appendTo(project.results.dom.title);
            var ArtistName = response.data.artists.artist[response.target.id].name;
            project.results.services.getArtistInfo(ArtistName);
            project.results.services.getArtistReviews(ArtistName);
            project.results.services.getAlbumsForArtist(ArtistName);
            project.results.services.getSimilarArtists(ArtistName);
        },
        artistInfoDisplay: function (response) {
            var info = $("<p>").html(response.artist.bio.summary)
                                    .appendTo(project.results.dom.title);
        },
        artistReviewDisplay: function (reviewsResponse) {
            for (var i = 0 ; i < reviewsResponse.response.reviews.length ; i++) {
                var li = $("<li>").addClass("well well-lg")
                                  .css("list-style-type", "none")
                                  .text(reviewsResponse.response.reviews[i].summary)
                                  .appendTo(project.results.dom.reviewUl);
            }
        },
        albumsForArtistDisplay: function (albums) {
            project.results.dom.sideBarTitle.text("Top Albums");
            for (var i = 0 ; i < albums.topalbums.album.length ; i++) {
                if (albums.topalbums.album[i].image != null) {
                    var trackImg = $("<img>").attr("src", albums.topalbums.album[i].image[3]["#text"])
                                             .css("width", "100%")
                                             .css("padding-bottom", "10px")
                                             .css("height", "170px")
                                             .attr("id",i)
                                             .on("click",albums,project.results.controller.album_clicked)
                                             .appendTo(project.results.dom.divForTracks);
                }
            }
        },
        similarArtists : function (similarResponse) {
            project.results.dom.similarTitle.text("Artists You May Like");
            for (var i = 0 ; i < 5; i++) {
                var img = $("<img>").attr("src", similarResponse.similarartists.artist[i].image[3]["#text"])
                                    .css("height", "200px")
                                    .css("width", "150px")
                                    .attr("id",i)
                                    .on("click", similarResponse, project.results.controller.similarArtistDisplay)
                                    .css("padding-right", "15px");
                $("<li>").css("list-style-type", "none")
                        .append(img)
                        .addClass("display-left")
                        .appendTo(project.results.dom.similarDisplayUl);
            }
        },
        similarArtistDisplayRender: function (similarArtistResponse) {
            console.log(similarArtistResponse);
            var img = $("<img>").attr("src", similarArtistResponse.data.similarartists.artist[similarArtistResponse.target.id].image[3]["#text"])
                            .css("height", "200px")
                            .css("width", "150px")
                            .css("display", "block")
                            .css("margin", "0 auto")
                            .css("float", "right")
                             .css("float", "right")
                            .appendTo(project.results.dom.disImage);
            var artisttitle = $("<h1>").text(similarArtistResponse.data.similarartists.artist[similarArtistResponse.target.id].name)
                                 .css("margin", "0px")
                                 .appendTo(project.results.dom.title);
            var ArtistName = similarArtistResponse.data.similarartists.artist[similarArtistResponse.target.id].name;
           project.results.services.getArtistInfo(ArtistName);
           project.results.services.getArtistReviews(ArtistName);
           project.results.services.getAlbumsForArtist(ArtistName);
           project.results.services.getSimilarArtists(ArtistName);
        },
        albumDisplay: function (albumResponse) {
            console.log(albumResponse);
            var img = $("<img>").attr("src", albumResponse.data.topalbums.album[albumResponse.target.id].image[3]["#text"])
                            .css("height", "200px")
                            .css("width", "150px")
                            .css("display", "block")
                            .css("margin", "0 auto")
                            .css("float", "right")
                             .css("float", "right")
                            .appendTo(project.results.dom.disImage);
            var albumArtist = $("<h4>").text("By : " + albumResponse.data.topalbums.album[albumResponse.target.id].artist.name);
            var albumTitle = $("<h1>").text(albumResponse.data.topalbums.album[albumResponse.target.id].name)
                                 .css("margin", "0px")
                                 .append(albumArtist)
                                 .appendTo(project.results.dom.title);
            var albumName = albumResponse.data.topalbums.album[albumResponse.target.id].name;
            var albumArtistName = albumResponse.data.topalbums.album[albumResponse.target.id].name;
            project.results.services.getAlbumInfo(albumName,albumArtistName);
        },
        albumInfoDisplay: function (albumInfo) {
            console.log(albumInfo);
        },
        searchArtistDisplay: function (response) {
            console.log(response);
        }
    },

    showPage: function (response) {
        project.showPage("results");
        project.results.renderer.artistDisplay(response);
    }
}