<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>

	<head>
		<title>Home</title>
		
		<!--Import materialize.css-->
      	<link type="text/css" rel="stylesheet" href="resources/css/materialize.min.css"  media="screen,projection"/>
	  	<link type="text/css" rel="stylesheet" href="resources/css/home.css"  media="screen,projection"/>
    	
    	<!-- Import scripts -->
      	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      	<script  type="text/javascript" src="resources/js/materialize.min.js"></script>
      	<script  type="text/javascript" src="resources/js/home-ads.js"></script>
      		<script type="text/javascript" src="resources/js/custom.js"></script>
    	
    	<!--Let browser know website is optimized for mobile-->
      	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	</head>
	<body>
	<!-- Vishnu edit styling -->
		<nav>
		<div class="nav-wrapper">

			<a href="#!" ><img id="logo_img" src= "resources/images/shopify-bag.png"></a>
			<span id= "nav_title" ><b >India-Cart</b></span>
			<ul id= "categories_drop" class="right hide-on-med-and-down">
				
				<li id= "search_bar"><form >
				<div class="li_no_hover arrange" ><a id ="drop_button"
					class='dropdown-button waves-effect btn-flat' data-beloworigin="true"
					href='#' data-activates='dropdown1'><b>Categories</b></a>
					<ul id='dropdown1' class='dropdown-content' >
						<li><a href="#!">one</a></li>
						<li><a href="#!">two</a></li>
						<li class="divider"></li>
						<li><a href="#!">three</a></li>
					</ul></div>
						<div class="input-field arrange">
							<input id="search" type="search" required>
							<label for="search"><i class="mdi-action-search"></i></label>
						</div>
					</form></li>
				<li><a href="mobile.html"><i
						class="mdi-action-add-shopping-cart"></i></a></li>
						
				<li><c:url value="/j_spring_security_logout" var="logoutUrl" />
					<form action="${logoutUrl}" method="post" id="logoutForm" style="margin-bottom: 0px;">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				<script>
					function formSubmit() {
						document.getElementById("logoutForm").submit();
					}
				</script>
					<c:if test="${pageContext.request.userPrincipal.name != null}">
				 <a class='dropdown-button' data-constrainwidth="false" data-beloworigin="true" href='#' data-activates='user-dropdown'>
				 	<i class="mdi-action-account-circle"></i>
				 </a>
				  						 <!-- Dropdown Structure -->
  							<ul id='user-dropdown' class='dropdown-content'>
    						<li><a href="#!">${pageContext.request.userPrincipal.name}</a></li>
    						<li><a href="javascript:formSubmit()">Logout</a></li>
 							 </ul>
				 </c:if>
				 <c:if test="${pageContext.request.userPrincipal.name == null}">
				 		<a href="login"><i class="mdi-action-account-circle"></i></a>
				 </c:if>

 							 
				</li>
				
			</ul>
		</div>
	</nav>


<div  class="container" >	

      		
      		<!-- MENU by Pattar --><!-- ADD MENU DIV HERE -->
      		
  		<ul class="pagination">
   			<li class="disabled"><a href="#!"><i class="mdi-navigation-chevron-left"></i></a></li>
    		<li class="active"><a href="#!">1</a></li>
    		<li class="waves-effect"><a href="#!">Women</a></li>
    		<li class="waves-effect"><a href="#!">Kids</a></li>
    		<li class="waves-effect"><a href="#!">4</a></li>
    		<li class="waves-effect"><a href="#!">5</a></li>
    		<li class="waves-effect"><a href="#!"><i class="mdi-navigation-chevron-right"></i></a></li>
  		</ul>
      		<!-- ADS by Pattar -->
      		
          	<div class="row" id="sponsored-ads">
          		<div class="slider">
    			<ul class="slides">
     				<li>
        				<img src="http://lorempixel.com/580/250/nature/1"> <!-- random image -->
        				<div class="caption center-align">
          				<h3>This is our big Tagline!</h3>
          				<h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        				</div>
      				</li>
      				<li>
                        <img src="http://lorempixel.com/580/250/nature/2"> <!-- random image -->
                        <div class="caption left-align">
                        <h3>Left Aligned Caption</h3>
                        <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                    	</div>
                    </li>
      				<li>
        				<img src="http://lorempixel.com/580/250/nature/3"> <!-- random image -->
				        <div class="caption right-align">
          				<h3>Right Aligned Caption</h3>
          				<h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        				</div>
      				</li>
      				<li>
        				<img src="http://lorempixel.com/580/250/nature/4"> <!-- random image -->
        				<div class="caption center-align">
          				<h3>This is our big Tagline!</h3>
          				<h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        				</div>
      				</li>
    			</ul>
  				</div>
			</div>
			
<!-- Men's and Women's section Arjun -->
<div id="collection-wrap">
 <div class="row" id="collection-panel-wrap">
          <div class="col l6 s12 m12">
          <div class="card small collection-panel" id="home-collection-men" >
            <div class="card-image collection-content" >
             <a href="#"> <img id="collection-men-image" src="resources/images/men.jpg">
             <span class="card-title collection-title" id="collection-men-title" >MEN</span>
             </a>
            
            </div>
             
          </div>
        </div>
        <div class="col l6 s12 m12">
          <div class="card small collection-panel" id="home-collection-women">
            <div class="card-image collection-content">
             <a href="#"> <img id="collection-women-image" src="resources/images/women.jpg" >
             <span class="card-title collection-title" id="collection-women-title" >WOMEN</span>
             </a>
            
            </div>
             
          </div>
        </div>
      </div>
          
          </div>  

</div>

	<footer class="page-footer">
		<div class="container">
			<div class="row">
				<div class="col l6 s12">
					<h5 class="white-text">IndiaCart</h5>
					<p class="grey-text text-lighten-4" id="about-text">IndiaCart
						provides a platform for vendors across the country to connect with
						millions of customers. Our online shopping platform has the widest
						assortment of products from thousands of brands across categories
						like Women's Apparel,and Men's Apparel. Grab your favorite
						products at best prices and save the one thing that matters most
						to you - "Your Money".
				</div>
				<div class="col l4 offset-l2 s12">
					<h5 class="white-text">Top Links</h5>
					<ul>
						<li><a class="grey-text text-lighten-3" href="#!">Contact
								us</a></li>
						<li><a class="grey-text text-lighten-3" href="#!">About
								us</a></li>
						<li><a class="grey-text text-lighten-3" href="#!">Terms
								of use</a></li>
						<li><a class="grey-text text-lighten-3" href="#!">FAQ</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container pull-right">© 2015 Copyright Text</div>
		</div>
	</footer>



</body>
</html>
