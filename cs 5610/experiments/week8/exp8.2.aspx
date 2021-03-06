<script runat="server">
    
</script>
<html>
    <head>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>  
        <link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css"/>
        <title>YouTube Video</title>
    </head>
    <body>
        <div class="container">
        <div class="row" style="margin-top:30px;">
        <div class="col-md-4">
            <input type="text" class="query form-control" />
            <input type="button" class="search form-control btn btn-primary" style="margin-top:10px;" value="Search"/>
        </div>
            <div class="col-md-6">
                <div id="player" style="display:none;"><ul class="results-display"></ul></div>
            </div>
        </div>
        </div>
    </body>

    <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
    
    <script>

        $(".search").click(search);
        var trackName = null;

        function search() {
            var name = $(".query").val();
            $("#player").css("display", "block");
            $.ajax({
                url: "https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + name + "+song&type=video&key=AIzaSyD2Ch91UltfHph_oUONK0rumE5WDJdd8tM",
                success: function (response) {
                    console.log(response);
                    var ul = $(".results-display");
                    for (var i = 0 ; i < response.items.length ; i++) {
                        var img = $("<img>").attr("src", response.items[i].snippet.thumbnails.medium.url)
                                            .css("height", "150px")
                                            .css("width", "200px")
                                            .css("margin-bottom", "10px")
                                            .attr("id",i)
                                            .on("click",response,imageClicked);
                        $("<li>").css("list-style-type","none")
                                 .append(img)
                                 .appendTo(ul);
                    }
                }
            })
        }

        function imageClicked(response) {
           // console.log(response.data.items[response.target.id].id.videoId);
            trackName = response.data.items[response.target.id].id.videoId;
            console.log(response.data.items[response.target.id].id.videoId);
            var tag = document.createElement('script');
            tag.src = "https://www.youtube.com/iframe_api";
            var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
            var player;
        }


      function onYouTubeIframeAPIReady() {
            console.log(trackName);
            player = new YT.Player('player', {
                height: '390',
                width: '640',
                videoId: '' + trackName,
                events: {
                    'onReady': onPlayerReady
                }
            });
        }

        function onPlayerReady(event) {
            event.target.playVideo();
        } 
    </script>

</html>