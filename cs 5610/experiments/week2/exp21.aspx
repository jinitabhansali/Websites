<%@ Page Language="C#" %>

<script runat="server">
    <%-- This demo page has no server side script --%>
</script>

<!DOCTYPE html>

<html lang="en">

<head>
    <link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css"/>
<meta charset='utf-8' />

<title>Bootstrap Sticky Header</title>

</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<div class="container">
        <div class="navbar-header">
        <a class="navbar-brand" href="#">CS5610</a>
        </div>
    <div class="collapse navbar-collapse" role="navigation">
    <ul class="nav navbar-nav">
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

     <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> 
    <script src="../../bootstrap/js/bootstrap.js"></script> 

</body>
</html>
