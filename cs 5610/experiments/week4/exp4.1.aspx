<%@ Page Language="C#" %>

<script runat="server">
    <%-- This demo page has no server side script --%>
</script>

<!DOCTYPE html>

<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> 
<script src="../../bootstrap/js/bootstrap.js"></script>  
<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="../../style1.css">
<link rel="stylesheet" type="text/css" href="../../responsive.css">
<meta charset='utf-8' />

<title>Login Form</title>

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
    <ul class="nav navbar-nav">
        <li><a class="navbar-brand"  href="#">CS5610</a></li>
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






<div class="row">
<div class="col-md-8">

</div>

<div class="col-md-4">
<form class="form-horizontal body-pad">
   <font style="padding: 70px 70px; font-family:'Times New Roman'; font-size:24px;"> Login : </font>
  <div class="form-group" style="margin-top:15px;">
    <label class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control email-name" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-default" id="submit-btn">Sign in</button>
    </div>
  </div>
</form>
</div>
</div>

<div class="row" style="padding:15px 15px; margin:60px;">
    In this experiment, I have created a login page for a user to login to the site. When the submit button is clicked, it grabs the data
    from the text-box of email and displays it within an alert box. This experiment is dont to learn about forms and hot to grab data from the 
    form elements. The main code used for this is as follows :
    <pre>
            $(function () {
        $(&quot;#submit-btn&quot;).click(handleClick);
    });

    function handleClick(event) {
        console.log(&quot;clicked&quot;);
        var name = $(&quot;.email-name&quot;).val();
        alert(&quot;Welcome &quot; + name );
    }
    </pre>
    <pre>
      <a href="../../fileview/Default.aspx?~/experiments/week4/exp4.1.aspx">  View ASPX Source </a>
    </pre>
</div>



<script>
    $(function () {
        $("#submit-btn").click(handleClick);
    });

    function handleClick(event) {
        console.log("clicked");
        var name = $(".email-name").val();
        alert("Welcome " + name );
    }
</script>

</body>
</html>