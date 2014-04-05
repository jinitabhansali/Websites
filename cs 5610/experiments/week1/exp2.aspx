﻿<%@ Page Language="C#" %>

<script runat="server">
    <%-- This demo page has no server side script --%>
</script>

<!DOCTYPE html>

<html lang="en">

<head>
    <link rel="stylesheet" type="text/css" href="../style.css">
     <link rel="stylesheet" type="text/css" href="../responsive.css">
<meta charset='utf-8' />

<title>Image and Text</title>

</head>

<body>

<div class="pad">

<form id="form1" runat="server">

<div id ="mastermenu">

<ul>
    <li><span class="largefont"> CS5610 </span></li>
    <li><a href="../Default.aspx">Home</a></li>
    <li> <a href ="../experiments.aspx" target="_blank"> Experiments </a></li>
   <li><a href="#"> More </font></a>
    <ul>
     <li><a href="sitestatistics/" target="_blank">SiteStatistics</a></li>
    <li><a href="statistics/" target="_blank">Statistics</a></li>
    <li><a href="source/" target="_blank">Source</a></li>
    <li><a href="search/" target="_blank">Search</a></li>
    <li><a href="searchtree/" target="_blank">SearchTree</a></li>
    <li><a href="textview/" target="_blank">TetView</a></li>
    <li><a href="filelist.aspx" target="_blank">FileList</a></li>
    <li><a href="autofile.aspx" target="_blank">AutoFile</a></li>
    <li><a href="images/autoimage.aspx" target="_blank">Images</a></li>
    <li><a href="blog/" target="_blank">Blog</a></li></ul>
       </li>
</ul>

<br />

</div>

</form>

</div>

<div class="wrapper">
    <div class="main"><img class="myimage" src="../photo.jpg" /></div>
    <div class="sidebar"><span class="largefont"> ABOUT ME </span>
    <br />
    Hi Everyone! My name is Jinita Bhansali.<br />
    I am a graduate student at Northeastern University pursuing my <br />
    Masters in the field of Computer Science. This website is being<br />
    developed as a part of the course CS5610 : Web Development that <br />
    that I have taken in my secon semester. <br />
    I have done some Web development and design work during my <br />
    undergraduate work but not in much detail. So am really looking <br />
    forward to learning a lot from this course.
<br /><br /><br /><br /><br />
</div>

    <footer>
       <center> <a href="../fileview/Default.aspx?~/experiments/week1/exp2.aspx">HTML SOURCE |</a> 
       <a href="../fileview/Default.aspx?~/style.css"> CSS </a> </center>
    </footer>
    
</div>
</body>
</html>
