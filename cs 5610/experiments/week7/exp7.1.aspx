
<script runat="server">

</script>

<!DOCTYPE html>

<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> 
<script src="bootstrap/js/bootstrap.js"></script>  
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css"/>
<meta charset='utf-8' />

<title>Login</title>

</head>
<body>
    <h3 style="font-family:Verdana;font-size:28px;">Login Experiment</h3>
    <h4><p>In this experiment, we will make our application secure by having most of the sensitive 
        information behind a login page.</p></h4>
    <p>Click on the link below to login. After you login , it will redirect you again to this page 
        and Login will be replaced by Logout.</p>

<form id="Form1" runat="server">
    <p>

<asp:LoginStatus
    ID="LoginStatus1"
    runat="server"
    LogoutAction="Redirect"
    LogoutPageUrl="exp7.1.aspx" />
</p>
</form>


<a href="../../fileview/Default.aspx?~/experiments/week7/exp7.1.aspx">  View Source </a>

</body>
    </html>