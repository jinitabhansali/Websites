<%@ Page Language="C#" %>

<script runat="server">
    <%-- This demo page has no server side script --%>
</script>

<!DOCTYPE html>

<html lang="en">

<head>
<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css"/>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../style1.css">
<link rel="stylesheet" type="text/css" href="../../responsive.css">
<meta charset='utf-8' />

<title>Clickable</title>

<style>
    .body-pad
    {
        padding-top:60px;
    }
</style>


</head>

<body class="body-pad">


<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<div class="container">
<div class="collapse navbar-collapse" role="navigation">
    <ul class="nav nav-pills">
        <li><a href="#">CS5610</a></li>
        <li><a href="#">Home</a></li>
        <li><a href="#">Experiments</a></li>
        <li class="dropdown">
         <a class="dropdown-toggle" data-toggle="dropdown" href="#">More <span class="caret"></span></a>
         <ul class="dropdown-menu" aria-labelledby="themes">
         <li><a href="sitestatistics/" target="_blank">SiteStatistics</a></li>
        <li><a  href="statistics/" target="_blank">Statistics</a></li>
        <li><a href="source/" target="_blank">Source</a></li>
        <li><a  href="search/" target="_blank">Search</a></li>
        <li><a  href="searchtree/" target="_blank">SearchTree</a></li>
        <li><a  href="textview/" target="_blank">TetView</a></li>
        <li><a  href="filelist.aspx" target="_blank">FileList</a></li>
        <li><a  href="autofile.aspx" target="_blank">AutoFile</a></li>
        <li><a  href="images/autoimage.aspx" target="_blank">Images</a></li>
        <li><a  href="blog/Default.aspx" target="_blank">Blog</a></li>
    </ul>
    </li>
    </ul>
</div>
</div>
    </div>

<div class="container">

<div class="row">
<div class="col-md-8">
<div id="image1" class="image"><img src="../../music.jpg" style="float : left; padding:10px;"/></div>
<div id="image2" class="image">  <img src="../../bg.jpg" style="padding:10px;"/></div>
</div>

<div class="col-md-3 well well-md" style="padding:10px">
<h3>Sources :</h3>
<ul>
<li><a href="../../fileview/Default.aspx?~/experiments/week3/exp3.2.aspx">ASPX Source</a></li>
 <li>CSS Source </li>
 </ul>
</div>
</div>



<div class="row" style="margin-top:20px">
    <div class="col-md-10">
In this experiment, i have tried to make my images link to other page. Also , the redirected page depends on 
which image is clicked. If the first image is clicked, then it is redirected to another page and if second image is
clicked then it is redirected to another page.

The script is almost same to the last experiment, the few changes are as follows :
        </div>
    
</div>

<div class="row-fluid" style="padding-top:10px;">
    <pre>

     if (id == &quot;image1&quot;) {
            var url = &quot;../../Default.aspx&quot;;
            $(location).attr(&apos;href&apos;, url);
        }
        else if (id == &quot;image2&quot;) {
            var url = &quot;../../experiments.aspx&quot;;
            $(location).attr(&apos;href&apos;, url);
        }
        </pre>
</div>

</div>




<script>
    $(function () {
        $(".image").click(handleClick);
    });

    function handleClick(event) {
        var element = event.currentTarget;
        var id = $(element).attr("id");

        if (id == "image1") {
            var url = "../../Default.aspx";
            $(location).attr('href', url) ;
        }
        else if (id == "image2") {
            var url = "../../experiments.aspx";
            $(location).attr('href', url);
        }
       
    }
</script>



</body>
</html>