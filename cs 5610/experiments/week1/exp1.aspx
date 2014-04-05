<%@ Page Language="C#" %>

<script runat="server">
    <%-- This demo page has no server side script --%>
</script>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset='utf-8' />

<title>Menu Navbar</title>

<style type="text/css">
    #mastermenu ul 
    {
        padding:10px; 
        margin:0; 
        list-style:none;
        background-color: aqua;
        height: 40px;
    }
    #mastermenu li 
    {
        float:left;
        position:relative;
        display:block;
        padding:10px;
    }
    #mastermenu li ul 
    {
        display:none;
        position:absolute;
    }
    #mastermenu li:hover ul
    {
        color : red;
        display:block;
        height:auto; 
        width:8em;
        display : block;
    }
    #mastermenu li ul li
    {
        clear:both;
        border-style:none;
    }

    .largefont { 
  color: #0066FF; 
  font-family:arial; 
  font-size: 30px; 
}

    a
    {
        color: #08f;
        font-weight: bold;
        text-decoration: none;
    }

    a:visited
    {
        color: #88f;
    }

    a:hover
    {
        color: #f00;
    }

    p
    {
        text-align: justify;
    }

   
</style>

<style type="text/css" media="screen">
    body {
        width:900px;
        max-width: 100%;
        margin: 0;
        padding: 0;
    }

    .pad {
        padding: 10px;

    }
</style>

</head>

<body>

<div class="pad">

<form id="form1" runat="server">

<div id ="mastermenu">

<ul>
    <li><span class="largefont"> CS5610 </span></li>
    <li><a href="../Default.aspx">Home</a></li>
    <li> <a href ="#"> Experiments </a></li>
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

<p>
Here is a link to the
<a href="story/index.htm" target="_blank">Story Utility</a>
on this site so that you may explore this tool.
</p>

<p>
Here is a link to the
<a href="http://www.northeastern.edu/rasala/webstories.htm"
        target="_blank">Web Development Stories</a>
so that you may see a good collection of online documentation.
</p>

<p>
This provides a model for using stories for documentation and
for collections of experiments.
</p>

<hr />

<p>
None of the hints given above needs to be on your home page
downstream but it is convenient to have them here at startup.
</p>

<hr />

</div>

</form>


    <br /><br />
    <p>In this experiment, I have brought together all the links that were needed on the home page 
        and put them under a single tab named "More". This makes the site look more presentable. </p>
    <p>For doing it, i have used css and some of the code needed to do this is :</p>
    <b> #mastermenu li ul 
    {
        display:none;
        position:absolute;
    }
    <br />
 #mastermenu li ul li
    {
        clear:both;
        border-style:none;
    }</b>
    </div>
    <br /><br /><br />
    <footer>
       <center> <a href="../fileview/Default.aspx?~/experiments/week1/exp1.aspx">HTML SOURCE |</a> 
       <a href="../fileview/Default.aspx?~/style.css"> CSS </a> </center>
    </footer>

</body>
</html> 
