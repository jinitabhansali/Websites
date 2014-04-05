
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


<asp:LoginView
    ID="LoginView1"
    Runat="server">
        
    <RoleGroups>
            
        <asp:RoleGroup Roles="Member">
            <ContentTemplate>
                <h4>You are logged in as a member</h4>
            </ContentTemplate>
        </asp:RoleGroup>
            
    </RoleGroups>
        
</asp:LoginView>

<asp:LoginView
    ID="LoginView2"
    Runat="server">
        
    <RoleGroups>
            
        <asp:RoleGroup Roles="Admin">
            <ContentTemplate>
                <h4>You are logged in as Admin.</h4>
                <h4>When you login as a admin , you will see the messages for both admin and member because
                    an admin is also a member.
                </h4>
                    
            </ContentTemplate>
        </asp:RoleGroup>
            
    </RoleGroups>
        
</asp:LoginView>
</form>

<a href="../../fileview/Default.aspx?~/experiments/week7/exp7.3.aspx">  View Source </a>

</body>
</html>