<%@page import="com.devs.dbcon.DbOp"%>
<!DOCTYPE html>

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
    <title>Login to CERM</title>
</head>
  
<%
    String loginid = request.getParameter("loginid");
    String pwd = request.getParameter("pwd");
    Integer uid = new Integer(-1);
    Integer utype = new Integer(-1);
    DbOp loginobj = new DbOp();
    loginobj.dbcon();
    int loginstatus=0;
    if(loginobj.chkfldvalue("registration", "emailid", loginid)==true)
    {
        loginstatus = 1;
        uid = Integer.parseInt(loginobj.getFldValue("registration", "emailid", loginid,"uregid"));
        utype = Integer.parseInt(loginobj.getFldValue("registration", "emailid", loginid,"utype"));
    }
    else if(loginobj.chkfldvalue("registration", "phoneno",loginid )==true)
    {
         loginstatus = 1;
         uid = Integer.parseInt(loginobj.getFldValue("registration", "phoneno", loginid,"uregid"));
         utype = Integer.parseInt(loginobj.getFldValue("registration", "phoneno", loginid,"utype"));
    }
    if(loginstatus == 1)
    {
         if(loginobj.chkfldvalue("registration", "pswd", pwd)!=true)
         {
             loginstatus = 0;             
         }        
    }
    if(loginstatus == 1)
    {  
      session.setAttribute("userid",uid); 
      session.setAttribute("usertype",utype); 
    }   
%>
<!--start navigation-->
    <jsp:include page="topheader.jsp" />
<!--end navigation-->
<!--start vedio background-->

<div class="container-fluid remove-vid-marg">
  <div class="vid-parent">
  
    <img src="images\pic.jpg"  width="100%" height="100%">
  
  <div class="vid-content">
    <div class="box-content">
        <h2 class="my contet">
          <% 
              if(loginstatus == 1)
              {
                out.println("You r successfully logged in"); 
                RequestDispatcher rd = request.getRequestDispatcher("/user.jsp");
                rd.forward(request, response);
              } 
              else 
              {
                out.println("Your Login Details not matched");
              } 
          %>
        </h2> 
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


