<%@ Page Language="C#" %>

<script runat="server">
    <%-- This demo page has no server side script --%>
</script>

<!DOCTYPE html>

<html lang="en">

<head>
    <link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../style.css"/>
<meta charset='utf-8' />

<title>Using Wells</title>

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
        <div class="row-fluid">
            <div class="col-md-4">
               <img class="myimage" src="../../photo.jpg" style="margin-top:70px;"/>
            </div>
            <div class="col-md-4" style="margin-top:70px;">
                
                 Hi Everyone! My name is Jinita Bhansali.
        I am a graduate student at Northeastern University pursuing my 
    Masters in the field of Computer Science. This website is being
    developed as a part of the course CS5610 : Web Development that 
    that I have taken in my secon semester. 
    I have done some Web development and design work during my 
    undergraduate work but not in much detail. So am really looking
    forward to learning a lot from this course.
            </div>
                
            <div class="col-md-4" style="margin-top:70px;">
                <div class="well well-lg">
                <h3>Sources :</h3>
                <ul>
                    <li><a href="../../fileview/Default.aspx?~/experiments/week2/exp2.3.aspx"> Source<</a></li>
                    <li>CSS Source </li>
                </ul>
            </div>
                </div>
        </div>
       </div>

     <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> 
    <script src="../../bootstrap/js/bootstrap.js"></script>   
</body>
</html>
