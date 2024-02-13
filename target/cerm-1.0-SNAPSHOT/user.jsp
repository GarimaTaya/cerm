<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Bootstrap.css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--Font awesome.css-->
    <link rel="stylesheet" href="css/all.min.css">


    <!-- <title>Responsive Sidebar Menu</title> -->
    <!--Google font-->   
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@700&display=swap" rel="stylesheet">
<!--Custom CSS-->
<link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="user.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  </head>
  <style>
    body {
      background-image: url('images/pic-sign.jpg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
    }
    </style>
    
  <body>
    <nav class="navbar navbar-expand-sm navbar-dark pl-5 fixed-top">
        <a class="navbar-brand" href="index.html">CERM</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <!--start navigation-->
    <jsp:include page="topheader.jsp" />
<!--end navigation-->
      </nav>

      <br>
      <br>


    <input type="checkbox" id="check">
   
     <label for="check">
      <i class="fas fa-bars" id="btn"></i>
      <i class="fas fa-times" id="cancel"></i>
    </label>
    <div class="sidebar">
      <header>My Menu</header>
      <a href="#" class="active">
        <i class="fas fa-qrcode"></i>
        <span>Dashboard</span>
      </a>
      <a href="#">
        <i class="fas fa-stream"></i>
        <span>Add Folder</span>
      </a>
      <a href="#">
         <i class="fas fa-calendar"></i>
        <span>Events</span>
      </a>
      <a href="#">
        <i class="far fa-question-circle"></i>
        <span>About</span>
      </a>
      <a href="uploadfile.jsp">
        <i class="fas fa-sliders-h"></i>
        <span>Upload File</span>
      </a>
      <a href="#">
        <i class="far fa-envelope"></i>
        <span>Contact</span>
      </a>
    </div>
</body>
</html>