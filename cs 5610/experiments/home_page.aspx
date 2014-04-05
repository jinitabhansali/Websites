 <%@ Page Language="C#" %>

<script runat="server">

</script>

<!DOCTYPE html>

<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> 
<script src="bootstrap/js/bootstrap.js"></script>  
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css"/>
<meta charset='utf-8' />

<title>MusicMania</title>

<style>
    .body-pad
    {
        padding-top:60px;
    }
    .display-left
    {
        display:inline;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
        <a class="navbar-brand" href="home_page.aspx">MusicMania</a></div>
</div>
        <div class="display-top">
        <p style="font-size:20px;margin:15px;" class="body-pad">Top Artists</p>
        <ul class="artist-display"></ul><br />
        <p style="font-size:20px;margin:15px;">Top Tracks</p>
        <ul class="album-display"></ul>
        </div>
        </div>
    <div class="container">
        <div class="display-details" style="display:none">
            <div class="row" style="padding-top:100px;">
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-2 dis-image" ></div> 
                    <div class="col-md-6 dis-title" ></div>
                    <div class="col-md-2"></div>
                </div>
                <div class="row dis-reviews">
                </div> 
            </div>
                <div class="col-md-2 dis-top-tracks" style="overflow:auto; height:500px;"></div> 
        </div>
            <div class="row">
                <div class="col-md-9 dis-reviews">
                    iofhirwgo hzovidhosi
                </div> 
            </div>
    </div>
</div>

</body>

<script>
    // top artist
    $(function () {
        $.ajax({
            url: "http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json",
            success: function (response) {
                var ul = $(".artist-display");
                for (var i = 0 ; i < 7; i++) {
                    var img = $("<img>").attr("src", response.artists.artist[i].image[3]["#text"])
                                        .css("height", "200px")
                                        .css("padding","10px")
                                        .css("width", "150px")
                                        .attr("id", i)
                                        .on("click",response,image_clicked);
                    $("<li>").addClass("display-left")
                             .css("list-style-type","none")
                             .append(img)
                             .appendTo(ul);
                }
            }
        })
        // top tracks
        $.ajax({
            url: "http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json",
            success: function (response) {
                var ul = $(".album-display");
                for (var i = 0 ; i < 7; i++) {
                    var img = $("<img>").attr("src", response.tracks.track[i].image[3]["#text"])
                                        .css("height", "200px")
                                        .css("padding", "10px")
                                        .css("width", "150px")
                                        .attr("id",i)
                                        .on("click", response, track_clicked);
                    $("<li>").addClass("display-left")
                             .css("list-style-type", "none")
                             .append(img)
                             .appendTo(ul);
                }
                }
        })
    });

    // artist details
    function image_clicked(response) {
        var artist = response.data.artists.artist[response.target.id].name;
        $(".display-top").css("display", "none");
        $(".display-details").css("display", "block");
        var dis_image = $(".dis-image");
        var dis_title = $(".dis-title");
        var img = $("<img>").attr("src",response.data.artists.artist[response.target.id].image[3]["#text"])
                            .css("height", "200px")
                            .css("width", "150px")
                            .css("display", "block")
                            .css("margin", "0 auto")
                            .css("float", "right")
                             .css("float", "right")
                            .appendTo(dis_image);
        var span = $("<span>").addClass("glyphicon glyphicon-music")
                          .html(response.data.artists.artist[response.target.id].listeners+ " listeners")
                          .appendTo(dis_image);
        var title = $("<h1>").text(response.data.artists.artist[response.target.id].name)
                             .css("margin", "0px")
                             .appendTo(dis_title);
        $.ajax({
            url: "http://ws.audioscrobbler.com/2.0/?method=artist.getInfo&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json&artist=" + artist,
            success: function (dataInfo) {
                var info = $("<p>").html(dataInfo.artist.bio.summary)
                                    .appendTo(dis_title);
            }
        })
        // TO DISPLAY TOP TRACKS OF EACH ARTIST
        $.ajax({
        url: "http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json&artist=" + artist,
        success: function (trackInfo) {
            var divForTracks = $(".dis-top-tracks");
            for (var i = 0 ; i < trackInfo.topalbums.album.length ; i++) {
                if (trackInfo.topalbums.album[i].image != null) {
                    var trackImg = $("<img>").attr("src", trackInfo.topalbums.album[i].image[3]["#text"])
                                             .css("width", "100%")
                                             .css("padding-bottom","10px")
                                             .css("height", "170px")
                                             .appendTo(divForTracks);
                }
            }
         }
        })
    }

    // track details
    function track_clicked(response) {
        console.log(response);
        var mbid = response.data.tracks.track[response.target.id].mbid;

        $(".display-top").css("display", "none");
        $(".display-details").css("display", "block");
        var dis_image = $(".dis-image");
        var dis_title = $(".dis-title");
        var img = $("<img>").attr("src", response.data.tracks.track[response.target.id].image[3]["#text"])
                            .css("height", "200px")
                            .css("width", "150px")
                            .css("display", "block")
                            .css("margin", "0 auto")
                             .css("float", "right")
                            .appendTo(dis_image);
        var title = $("<h1>").text(response.data.tracks.track[response.target.id].name)
                             .css("margin","0px")
                             .appendTo(dis_title);
        $.ajax({
            url: "http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=9bc813cb16b15d5f0f7a9e87459e8f16&format=json&mbid=" + mbid,
            success: function (dataInfo) {
                //var info = $("<p>").text(dataInfo.album.bio.summary)
                  //               .appendTo(dis_title);

                console.log(dataInfo);
            }
        })
    }

</script> 
</html>
