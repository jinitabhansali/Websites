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
  <script src="../../bootstrap/js/bootstrap.js"></script> 


 

<meta charset='utf-8' />

<title>Clickable</title>

<style>
    .body-pad
    {
        padding-top:60px;
    }
</style>

<script>
    $(function () {
        $(".sortable").sortable();
    });
</script>

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

<div class="container" data-role="collapsible" id="please-work">
    <ul>
        <li>dyd ugu</li>
        <li>iuou o i oh</li>
    </ul>
</div>

<script>
    $("#please-work").trigger("collapse");
</script>








</body>
</html>