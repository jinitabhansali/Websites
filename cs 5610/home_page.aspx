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
    .search-box
    {
        border : 1px solid;
        border-radius : 25px;
    }
</style>
</head>
<body>
    <div class="container">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="max-height:50px;">
        <div class="navbar-header" style="width:50%;margin:0px;"><a class="navbar-brand" href="home_page.aspx">MusicMania</a></div>
        <div><div class="glyphicon glyphicon-search navbar-brand btn-search searchSpan" style="float:right; right:35px; position:fixed;"></div></div>
    </div>

        <!-- SEARCH BOX -->
        <div class="row search-div" style="padding-top:50px; display:none;">
            <div class="col-md-6"></div>
            <div class="col-md-2"></div>
            <div class="col-md-4 search-box page home results tracks searchResults trackDetails" style="background-color:black;margin:0px;display:block;">
                <select class="form-control dropDown" style="margin-top:10px;">
                    <option class="search-artist">By Artist</option>
                    <option class="search-track">By Track</option>
                    <option class="search-album">By Album</option>
                </select>
                <input type="text" class="form-control search-name" style="margin-top:10px;"/>
                <input type="button" class="form-control btn-primary search-click" value="Search" style="margin-top:10px; margin-bottom:10px;" />
            </div>
        </div>
        <!-- SEARCH BOX ENDS -->

        <!-- SEARCH RESULTS DISPLAY -->
        <div class="row page searchResults" style="padding-top:40px;">
            <div class="col-md-8">
                <h2 class="searchResultTitle"></h2>
                <ul class="search-results"></ul>
            </div>
        </div>
        <!-- SEARCH RESULTS DISPLAY -->

        <!-- HOME PAGE DISPLAY -->
        <div class="display-top page home">
        <p style="font-size:20px;margin:15px;" class="body-pad">Top Artists</p>
        <ul class="artist-display"></ul><br />
        <p style="font-size:20px;margin:15px;">Top Tracks</p>
        <ul class="track-display"></ul>
        </div>
        <!-- HOME PAGE DISPLAY ENDS -->
        </div>
    <!-- CONTAINER ENDS -->

    <!-- IMAGE CLICKED DISPLAY -->
    <div class="container">
        <div class="display-details page results" style="display:none">
            <div class="row" style="padding-top:100px;">
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-2 dis-image" ></div> 
                    <div class="col-md-6 dis-title" ></div>
                    <div class="col-md-2">
                    </div>
                </div>
                <br />
                <div class="row">
                    <h2 class="mayLike name" style="font-size:20px;"></h2>
                    <ul class="similarUl"></ul>
                </div>
                 <div class="row dis-reviews">
                        <h1>Reviews</h1>
                        <div class="col-md-9">
                        <ul class="review-list" style="padding:0px;"></ul>
                        </div>
                </div>
            </div>
                <div class="col-md-2">
                        <p class="sidebar" style="font-size:18px;"></p>
                        <div class="dis-top-tracks" style="overflow:auto;height:500px;">
                        </div>
                </div> 
        </div>
        </div>

            <div class ="page trackDetails">
                <div class="row" style="padding-top:100px;">
                    <div class="col-md-2 trackImage"></div>
                    <div class="col-md-4 trackDetail"></div>
                    <div id="player" style="display:none;"></div>
                </div>
            </div>
</div>

</body>

    <script src="javascript/project.js"></script>
    <script src="javascript/project.home.js"></script>
    <script src="javascript/project.results.js"></script>
    <script src="javascript/project.tracks.js"></script>
    <script src="javascript/project.searchResults.js"></script>
</html>
