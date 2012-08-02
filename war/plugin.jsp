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
					.append($('<td>').text('Name:')) // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
					.append($('<td>').text('Link :')).append(
							$('<td>').text('Date :'));
					$.each(responseJson, function(index, product) { // Iterate over the JSON array.
						$('<tr>').appendTo($table) // Create HTML <tr> element, set its text content with currently iterated item and append it to the <ul>.
						.append($('<td>').text(product.name)) // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
						.append($('<td>').text(product.address)).append(
								$('<td>').text(product.date)); // Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.

					});
				});
				//});
			});
</script>
</head>
<body>
	<div id="container">
		<!-- Begin Header Wrapper -->
		<div id="page-top">
			<div id="header-wrapper">
				<!-- Begin Header -->
				<div id="header">
					<div id="logo">
						<a href="index.html"><img src="style/images/logo.png"
							alt="Delphic" /></a>
					</div>
					<!-- Logo -->
					<!-- Begin Menu -->
					<div id="menu-wrapper">
						<div id="smoothmenu1" class="ddsmoothmenu">
							<ul>
								<li><a href="index.html">Home</a>
									<ul>
										<li><a href="index.html">Home with Cycle</a></li>
										<li><a href="index-2.html">Home with Columns</a></li>
										<li><a href="index-3.html">Home with Services</a></li>
										<li><a href="index-4.html">Home with Piecemaker</a></li>
									</ul></li>
								<li><a href="blog-1.html">Blog</a>
									<ul>
										<li><a href="blog-1.html">Blog</a></li>
										<li><a href="blog-2.html">News</a></li>
										<li><a href="blog-single.html">Single Blog Post</a></li>
									</ul></li>
								<li><a href="portfolio-1.html">Portfolio</a>
									<ul>
										<li><a href="portfolio-1.html">Portfolio with
												Lightbox</a></li>
										<li><a href="portfolio-2.html">Portfolio with Details</a></li>
										<li><a href="portfolio-single.html">Single Portfolio
												Post</a></li>
									</ul></li>
								<li><a href="services.html">Services</a></li>
								<li><a href="page-tabs-toggle.html" class="selected">Features</a>
									<ul>
										<li><a href="page-tabs-toggle.html">Tabs &amp; Toggle</a></li>
										<li><a href="page-carousel.html">Carousel</a></li>
										<li><a href="blog-2.html">News</a></li>
										<li><a href="services.html">Services</a></li>
										<li><a href="page-custom.html">Custom Page</a></li>
										<li><a href="page-buttons.html">Buttons</a></li>
										<li><a href="styles.html">Columns &amp; Tables</a></li>
									</ul></li>
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
					<h3>We love tabs</h3>
					<p>Aenean fermentum luctus viverra. Pellentesque id lectus
						ante, vel tristique elit. Fusce mattis, purus non consectetur
						cursus, justo nisi viverra sem, ac lobortis ipsum sapien vel
						purus. Vivamus aliquet gravida nibh sit amet accumsan. Fusce et
						lorem nunc. Sed convallis, tortor nec ornare sagittis, velit
						ligula varius sapien, eu cursus nisl purus sed felis habitant
						morbi tristique senectus et netus et malesuada fames ac turpis.</p>
					<ul class="tabs">
						<li><a href="#tab1">Download</a></li>
						<li><a href="#tab2">Upload</a></li>
						<li><a href="#tab3">Content</a></li>
					</ul>
					<div class="tab_container">
						<div style="display: none;" id="tab1" class="tab_content">
							<h3>Our Plugins:</h3>
						
					    
						</div>
						<div style="display: none;" id="tab2" class="tab_content">
							<h3>Please complete all the forms</h3>
								<form action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
						            <input type="text" name="Details">
						            <input type="file" name="Plugin">
						            <input type="submit" value="Submit">
						        </form>
						</div>
						<div style="display: none;" id="tab3" class="tab_content">
							<h3>Content</h3>
							<p>Nulla non tortor eget ligula dapibus semper non ut mauris.
								Nam feugiat, lorem a tempus auctor, odio nisl porttitor lacus,
								ut ultrices neque massa a odio. Pellentesque sit amet leo dictum
								nisl tempor malesuada id ut magna. Etiam non mauris eget massa
								sagittis euismod. Aliquam lectus nulla, consequat eget molestie
								id, malesuada sit amet lectus. Pellentesque eget justo sit amet
								nunc adipiscing semper at ac quam. Praesent a volutpat nulla.
								Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<p>Morbi congue pellentesque quam, eu ultricies. Pellentesque
								habitant morbi tristique senectus et netus et malesuada fames ac
								turpis egestas. Nulla facilisi. Class aptent taciti sociosqu ad
								litora torquent per conubia nostra, per inceptos himenaeos. Nunc
								rhoncus tortor quis eros bibendum a tempus est dapibus. Vivamus
								consectetur quam eu tellus porttitor ultrices. Nunc metus massa,
								ullamcorper sit amet malesuada a, porttitor in tellus.
								Vestibulum ullamcorper quam nec lorem aliquam id feugiat risus
								tincidunt.</p>
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
					<p>� Copyright 2011 Delphic | Creative Portfolio Template</p>
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