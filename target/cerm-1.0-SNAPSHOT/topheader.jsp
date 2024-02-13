<%-- 
    Document   : topheader
    Created on : Dec 8, 2022, 2:30:28 AM
    Author     : Administrator
--%>

<!--start navigation-->

    <nav class="navbar navbar-expand-sm navbar-dark pl-5 fixed-top">
      <a class="navbar-brand" href="index.html">CERM</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <ul class="navbar-nav custom-nav pl-5">
         <li class ="nav-item custom-nav-item"><a href="index.html"class="nav-link">Home</a></li>         
         <%
             if((Integer)session.getAttribute("userid")!= -1 && (Integer)session.getAttribute("usertype")== 1 )
             {
         %>
         <li class ="nav-item custom-nav-item"><a href="#"class="nav-link">Admin Tasks</a></li>
         <li class ="nav-item custom-nav-item"><a href="department.html" class="nav-link">Department Tasks</a></li>
         <% } %>
         <li class ="nav-item custom-nav-item"><a href="#"class="nav-link">Contact</a></li>
         <li class ="nav-item custom-nav-item"><a href="signup.html"class="nav-link">Register</a></li>
         <%
             if((Integer)session.getAttribute("userid")!= -1)  
            {
         %>
         <li class ="nav-item custom-nav-item"><a href="logout.jsp" class="nav-link">Logout</a></li>
         <%
             }
             else
            {
          %>
         <li class ="nav-item custom-nav-item"><a href="login1.html"class="nav-link">Login</a></li>
         <% } %>
        </ul>
      </div>
    </nav>
<!--end navigation-->
