<!DOCTYPE HTML>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<title>Plugins</title>
<link rel="stylesheet" type="text/css" href="style.css" media="all" />
<link rel="stylesheet" media="all" href="style/type/puritan.css" />
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="style/css/ie7.css" media="all" />
<![endif]-->
<script type="text/javascript" src="style/js/jquery-1.5.min.js"></script>
<script type="text/javascript" src="style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="style/js/scripts.js"></script>


<script type="text/javascript">
	$(document).ready(
			function() { // When the HTML DOM is ready loading, then execute the following function...
				//$('#somebutton').click(function() {                        // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
				$.get('cardeckplatform_details', function(responseJson) { // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
					var $table = $('<table></table>').appendTo($('#tab1')); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
					$('<tr>').appendTo($table) // Create HTML <tr> element, set its text content with currently iterated item and append it to the <ul>.
					.append($('<td>').text('Details:')) // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
					.append($('<td>').text('Rank :'))
					.append($('<td>').text('Link :'))
					.append($('<td>').text('Date :'));
					i=0;
					$.each(responseJson, function(index, product) { // Iterate over the JSON array.
						var element=document.createElement("input");
						element.setAttribute("type", "radio");
					    element.setAttribute("value", "radio");
					    element.setAttribute("name", "radio"+i++);
					    element.setAttribute("class", "star {split:2}");
					    function makeRadio(container,checkedIndex,i)
					    {
					    	for (j=0;j<10;j=j+1)
						    {
						    	var e=document.createElement("input");
						    	e.setAttribute("type", "radio");
						    	e.setAttribute("value", "radio");
						    	e.setAttribute("disabled", "disabled");
						    	e.setAttribute("name"+i, "radio"+i++);
						    	e.setAttribute("class", "star {split:2}");
						    	if(j==checkedIndex)
						    		e.setAttribute("checked", "checked");
						    	container.append(e);
						    }
					    	
					    	return container;
					    }
					    
					    
					    
						$('<tr>').appendTo($table) // Create HTML <tr> element, set its text content with currently iterated item and append it to the <ul>.
						.append($('<td>').text(product.detail)) // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
						.append(makeRadio($('<td/>'),product.rank,i))
						.append($('<td/>').append($('<a/>',{"href":product.address}).text('Download')))
						.append($('<td>').text(product.date)); // Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
						i=i+1;
						$('input[type=radio].star').rating();
					});
				});
				
				//});
			});
</script>

<script type="text/javascript">
var hash = {
		  '.jar'  : 1,
		  
		};

		function check_extension(filename) {
				var submitId="submit";
		      var re = /\..+$/;
		      var ext = filename.match(re);
		      var submitEl = document.getElementById(submitId);
		      if (hash[ext]) {
		        submitEl.disabled = false;
		        return true;
		      } else {
		        alert("Invalid filename, please select another file");
		        submitEl.disabled = true;

		        return false;
		      }
		}




</script>
<!-- STARS SCRIPTS -->
<!--// documentation resources //-->
	<script src='jquery.js' type="text/javascript"></script>
	<script src='documentation/documentation.js' type="text/javascript"></script>
 <link href='documentation/documentation.css' type="text/css" rel="stylesheet"/>
 <!--// code-highlighting //-->
	<script type="text/javaScript" src="documentation/chili/jquery.chili-2.0.js"></script> 
	<!--//documentation/chili-toolbar/jquery.chili-toolbar.pack.js//-->
 <script type="text/javascript">try{ChiliBook.recipeFolder="documentation/chili/"}catch(e){}</script>
 <!--// plugin-specific resources //-->
	<script src='jquery.MetaData.js' type="text/javascript" language="javascript"></script>
 <script src='jquery.rating.js' type="text/javascript" language="javascript"></script>
 <link href='jquery.rating.css' type="text/css" rel="stylesheet"/>
 <!-- END OF STARS SCRIPTS -->
</head>
<body>
	<div id="container">
		<!-- Begin Header Wrapper -->
		<div id="page-top">
			<div id="header-wrapper">
				<!-- Begin Header -->
				<div id="header">
                <div class="google-play">
      <a href="https://play.google.com/store/apps/details?id=carddeckplatform.game&feature=search_result#?t=W251bGwsMSwxLDEsImNhcmRkZWNrcGxhdGZvcm0uZ2FtZSJd"><img src="get_it_on_play_logo_large.png" /></a>
      </div>
					<div id="logo">
						<a href="index.html"><img src="style/images/logo.png"
							alt="Delphic" /></a>
					</div>
					<!-- Logo -->
					<!-- Begin Menu -->
					<div id="menu-wrapper">
						<div id="smoothmenu1" class="ddsmoothmenu">
							<ul>
            <li><a href="index.html"  >Home</a>
              <!-- <ul>
                <li><a href="index.html">Home with Cycle</a></li>
                <li><a href="index-2.html">Home with Columns</a></li>
                <li><a href="index-3.html">Home with Services</a></li>
                <li><a href="index-4.html">Home with Piecemaker</a></li>
              </ul>
              -->
            </li>
            <li><a href="plugins.jsp" class="selected">Market</a></li>
            <li><a href="Developer.html" >Developer</a></li>
            <li><a href="services.html">Services</a></li>
            <li><a href="downloads.html">Downloads</a>
                <!--
              <ul>
                <li><a href="index.html">Home with Cycle</a></li>
                <li><a href="index-2.html">Home with Columns</a></li>
                <li><a href="index-3.html">Home with Services</a></li>
                <li><a href="index-4.html">Home with Piecemaker</a></li>
              </ul>
              --> 
              </li>
            <!--
            <li><a href="blog-1.html">Blog</a>
              <ul>
                <li><a href="blog-1.html">Blog</a></li>
                <li><a href="blog-2.html">News</a></li>
                <li><a href="blog-single.html">Single Blog Post</a></li>
              </ul>
            </li>
            <li><a href="portfolio-1.html">Portfolio</a>
              <ul>
                <li><a href="portfolio-1.html">Portfolio with Lightbox</a></li>
                <li><a href="portfolio-2.html">Portfolio with Details</a></li>
                <li><a href="portfolio-single.html">Single Portfolio Post</a></li>
              </ul>
            </li>
            -->
            
             
			  
            <!--
            <li><a href="page-tabs-toggle.html">Features</a>
              <ul>
                <li><a href="page-tabs-toggle.html">Tabs &amp; Toggle</a></li>
                <li><a href="page-carousel.html">Carousel</a></li>
                <li><a href="blog-2.html">News</a></li>
                <li><a href="services.html">Services</a></li>
                <li><a href="page-custom.html">Custom Page</a></li>
                <li><a href="page-buttons.html">Buttons</a></li>
                <li><a href="styles.html">Columns &amp; Tables</a></li>
              </ul>
            </li>
            -->
            <li><a href="contact.html">Contact</a></li>
          </ul>
						</div>
					</div>
					<!-- End Menu -->
				</div>
				<!-- End Header -->
			</div>
		</div>
		<!-- End Header Wrapper -->

		<!-- Begin Wrapper -->
		<div id="wrapper">
			<div class="content">
				<div class="tabbed-content">
					<h3>Here you can Download or Upload plugins :</h3>
					<ul class="tabs">
						<li><a href="#tab1">Download</a></li>
						<li><a href="#tab2">Upload</a></li>
						
					</ul>
					<div class="tab_container">
						<div style="display: none;" id="tab1" class="tab_content">
							<h3>Our Plugins:</h3>
					    
						</div>
						<div style="display: none;" id="tab2" class="tab_content">
								
								<form action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
						            <h4>Details about the plugin</h2>
						            <input type="text" name="Details">
						            <br/>
						            <h4>Please select you plugin file</h2>
						            <input type="file" name="Plugin" accept="application/java-archive" onchange="check_extension(this.value);">
						            <br/>
						            <input type="submit" value="Submit" id="submit" disabled="disabled">
						        </form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- End Wrapper -->

		<div class="clearfix"></div>
		<div class="push"></div>
	</div>

	<!-- Begin Footer -->
	<div id="footer-wrapper">
		<div id="footer">
			<div id="footer-content">

				<!-- Begin Copyright -->
				<div id="copyright">
					<p>� Copyright 2011 Card-Deck-Platform</p>
				</div>
				<!-- End Copyright -->

				<!-- Begin Social Icons -->
				<div id="socials">
					<ul>
						<li><a href="#"><img src="style/images/icon-rss.png"
								alt="" /></a></li>
						<li><a href="#"><img src="style/images/icon-twitter.png"
								alt="" /></a></li>
						<li><a href="#"><img src="style/images/icon-dribble.png"
								alt="" /></a></li>
						<li><a href="#"><img src="style/images/icon-tumblr.png"
								alt="" /></a></li>
						<li><a href="#"><img src="style/images/icon-flickr.png"
								alt="" /></a></li>
						<li><a href="#"><img src="style/images/icon-facebook.png"
								alt="" /></a></li>
					</ul>
				</div>
				<!-- End Social Icons -->

			</div>
		</div>
	</div>
	<!-- End Footer -->
</body>
</html>