project.tracks = {

    init: function () {
        project.tracks.dom.init();
    },

    dom: {
        trackImg: null,
        trackDetails: null,
        trackVideo: null,
        trackName: null,
        searchBox:null,

        init: function () {
            project.tracks.dom.trackImg = $(".trackImage");
            project.tracks.dom.trackDetails = $(".trackDetail");
            project.tracks.dom.trackVideo = $("#player");
            project.tracks.dom.searchBox = $(".search-div");
        }
    },

    controller: {
        searchVideo: function (event) {
            console.log("In controller");
            project.tracks.services.searchVideobyId(event);
        }
    },

    services: {
        searchVideobyId: function (songName) {
           console.log(songName);
            $.ajax({
                url: "https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + songName + "+song&type=video&key=AIzaSyD2Ch91UltfHph_oUONK0rumE5WDJdd8tM",
                success : project.tracks.renderer.playVideo
            });
        }
    },

    renderer: {
        trackDisplay: function (trackResponse) {
         //   project.tracks.dom.searchBox
            var img = $("<img>").attr("src", trackResponse.data.tracks.track[trackResponse.target.id].image[3]["#text"])
                                .css("height", "200px")
                                .css("width", "150px")
                                .appendTo(project.tracks.dom.trackImg);
            var tracktitle = $("<h1>").text(trackResponse.data.tracks.track[trackResponse.target.id].name)
                                 .css("margin", "0px");
            var pArtist = $("<p>").text("By : " + trackResponse.data.tracks.track[trackResponse.target.id].artist.name)
                                  .css("font-size", "20px");
            var duration = $("<p>").text("Duration : " + ((trackResponse.data.tracks.track[trackResponse.target.id].duration) / 60).toFixed(2) + " minutes");
            var playButton = $("<button>").addClass("btn btn-primary")
                                          .text("Play Online")
                                          .css("margin-right", "10px")
                                        .click(function (e) {
                                            project.tracks.controller.searchVideo(trackResponse.data.tracks.track[trackResponse.target.id].name + " " + trackResponse.data.tracks.track[trackResponse.target.id].artist.name);
                                        });
                                          //.click(project.tracks.controller.searchVideo(trackResponse.data.tracks.track[trackResponse.target.id].name + " " + trackResponse.data.tracks.track[trackResponse.target.id].artist.name));
            var playlistButton = $("<button>").addClass("btn btn-primary")
                                              .text("Add To Playlist");
            project.tracks.dom.trackDetails.append(tracktitle, "<br/>", pArtist, duration, "<br/>", "<br/>", playButton, playlistButton);
        },

        playVideo: function (videoResponse) {
            console.log("In playVideo");
            project.tracks.dom.trackVideo.css("display", "block");
            project.tracks.dom.trackName = videoResponse.items[0].id.videoId;
            var tag = document.createElement('script');
            tag.src = "https://www.youtube.com/iframe_api";
            var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
            var player;

            window.onYouTubeIframeAPIReady = function () {
                console.log(project.tracks.dom.trackName);
                player = new YT.Player('player', {
                    height: '390',
                    width: '550',
                    videoId: '' + project.tracks.dom.trackName,
                    events: {
                        'onReady': onPlayerReady
                    }
                });
            }

            window.onPlayerReady = function (event) {
                event.target.playVideo();
            }
        }
    },

    showPage: function (response) {
        project.showPage("trackDetails");
        project.tracks.renderer.trackDisplay(response);
    }
}