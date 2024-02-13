<%@page import="com.devs.folderoperations.ParentFolder"%>
<%@page import="com.devs.dbcon.DbOp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Bootstrap.css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--Font awesome.css-->
    <link rel="stylesheet" href="css/all.min.css">

<!--Google font-->   
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@700&display=swap" rel="stylesheet">
<!--Custom CSS-->
<link rel="stylesheet" href="css/style.css">
    <title>Document Store</title>
</head>
<body>  
    <!--start navigation-->
    <nav class="navbar navbar-expand-sm navbar-dark pl-5 fixed-top">
      <a class="navbar-brand" href="index.html">CERM</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <ul class="navbar-nav custom-nav pl-5">
         <li class ="nav-item custom-nav-item"><a href="index.html"class="nav-link">Home</a></li>
         <li class ="nav-item custom-nav-item"><a href="#"class="nav-link">Admin</a></li>
         <li class ="nav-item custom-nav-item"><a href="#"class="nav-link">Contact</a></li>
         <li class ="nav-item custom-nav-item"><a href="signup.html"class="nav-link">Register</a></li>
         <li class ="nav-item custom-nav-item"><a href="login1.html"class="nav-link">Login</a></li>
        </ul>
      </div>
    </nav>
<!--end navigation-->
<!--start vedio background-->
<%
    DbOp obj1 = new DbOp();
    obj1.dbcon();
    String msg ="";
    String insql = "";
    if(obj1.chkfldvalue("registration", "emailid",request.getParameter("email") )==true)
    {
        msg = "Email already Registered";
    }
    else if(obj1.chkfldvalue("registration", "phoneno",request.getParameter("tel") )==true)
    {
        msg = "Phone No. already Registered";
    }
    else
    {
    msg = "Thanks";
    insql= "INSERT INTO registration(username, emailid, phoneno, dob, pswd, utype, status) VALUES ('";
    insql = insql + request.getParameter("fname") + "', '";
    insql = insql + request.getParameter("email") + "', '";
    insql = insql + request.getParameter("tel") + "', '";
    insql = insql + request.getParameter("date") + "', '";
    insql = insql + request.getParameter("pswd") + "',2,1 )";
    }
%>
<div class="container-fluid remove-vid-marg">
  <div class="vid-parent">
  
    <img src="images\pic.jpg"  width="100%" height="100%">
  
  <div class="vid-content">
    <div class="box-content">
        <h2 class="my contet">Hi, <%= request.getParameter("fname")%>  </h2>
        <h2 class="my contet">
          <% 
              int userautoregid = obj1.insertGetAutoId(insql);
              if(userautoregid != -1 || userautoregid != -99) { %>
          <%= msg %>
          Your Registration successful, Please Login Once
          <%
          ParentFolder pfobj = new ParentFolder();
          String foldernm = new String(request.getParameter("fname"));
          foldernm = pfobj.CreateParentFolder(foldernm);
          insql = "INSERT INTO parentfolderdetails(uregid,parentfolderid) VALUES ( " + userautoregid + " , '"+foldernm + "' )" ;
          if(obj1.insertSubQuery(insql)) { System.out.println("Parent folder mapped"); }
           } else { %>
          <%= msg %>
          Your Registration Not Done
          <% } %>
        </h2> 
        <a href="login1.html" class="btn btn-danger">SIGN IN</a>
    </div>
  </div>
  </div>
<!--end vedio background-->
<!--Start text banner -->
<div class="container-fluid bg-danger txt-banner">
<div class="row bottom-banner">
<div class="col-sm">
<h5><i class="fas fa-book-open mr-3"></i>Easy upload & download documents</h5>
</div>
<div class="col-sm">
<h5><i class="fas fa-users mr-3"></i>Complete Security</h5>
</div>
<div class="col-sm">
<h5><i class="fas fa-keyboard mr-3"></i>Lifetime Access</h5>
</div>

</div>
</div>
<!--End text banner -->

<!--end !st card deck -->
<footer style="background: grey;" class="page-footer font-small blue">
  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2022 Copyright:
    <a href=""> Compucom</a>
  </div>
  <!-- Copyright -->
</footer>

<!--end popular course -->

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/all.min.js"></script>
</body>
</html>
