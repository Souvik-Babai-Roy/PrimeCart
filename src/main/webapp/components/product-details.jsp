<%@ page import="helpers.Helper"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="card card-solid">
	<div class="card-body">
		<div class="container-fluid">
			<div class="row">
				<!-- Product Image Section -->
				<div
					class="col-md-6 d-flex justify-content-center align-items-center left-side row">
					<!-- Thumbnails for Desktop -->
					<div
						class="d-flex flex-column justify-content-center align-items-center col-md-2 order-md-1 order-2">

						<div class="thumbnail scroll-vertical scrollbar-thin "
							style="height: 350px;">
							<button type="button" class="btn p-0 mb-2 thumbnail-item"
								data-bs-target="#productCarousel" data-bs-slide-to="0"
								aria-label="Slide 1">
								<img src="img/logo-light.png" class="img-thumbnail"
									alt="Thumbnail 1">
							</button>
							<button type="button" class="btn p-0 mb-2 thumbnail-item"
								data-bs-target="#productCarousel" data-bs-slide-to="1"
								aria-label="Slide 2">
								<img src="dist/img/prod-2.jpg" class="img-thumbnail"
									alt="Thumbnail 2">
							</button>
							<button type="button" class="btn p-0 mb-2 thumbnail-item"
								data-bs-target="#productCarousel" data-bs-slide-to="2"
								aria-label="Slide 3">
								<img src="dist/img/prod-3.jpg" class="img-thumbnail"
									alt="Thumbnail 3">
							</button>
							<button type="button" class="btn p-0 thumbnail-item"
								data-bs-target="#productCarousel" data-bs-slide-to="3"
								aria-label="Slide 4">
								<img src="dist/img/prod-4.jpg" class="img-thumbnail"
									alt="Thumbnail 4">
							</button>
						</div>

					</div>

					<!-- Carousel -->
					<div class="col-md-10 order-md-2 order-1">
						<div id="productCarousel" class="carousel slide w-100"
							data-bs-ride="carousel">
							<ol class="carousel-indicators">
								<li action="button" data-bs-target="#productCarousel"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></li>
								<li action="button" data-bs-target="#productCarousel"
									data-bs-slide-to="1" aria-label="Slide 2"></li>
								<li action="button" data-bs-target="#productCarousel"
									data-bs-slide-to="2" aria-label="Slide 3"></li>
								<li action="button" data-bs-target="#productCarousel"
									data-bs-slide-to="3" aria-label="Slide 4"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="img/logo-light.png"
										class="d-block w-100 carousel-img" alt="Product Image 1">
								</div>
								<div class="carousel-item">
									<img src="dist/img/prod-2.jpg"
										class="d-block w-100 carousel-img" alt="Product Image 2">
								</div>
								<div class="carousel-item">
									<img src="dist/img/prod-3.jpg"
										class="d-block w-100 carousel-img" alt="Product Image 3">
								</div>
								<div class="carousel-item">
									<img src="dist/img/prod-4.jpg"
										class="d-block w-100 carousel-img" alt="Product Image 4">
								</div>
							</div>

							<!-- Carousel Controls -->
							<!--  <a class="carousel-control-prev" href="#productCarousel" role="button" data-bs-slide="prev"> 
								<span class="carousel-control-custom-icon" aria-hidden="true">
									<i class="fas fa-chevron-left"></i>
								</span> <span class="sr-only">Previous</span>
							</a> 
							<a class="carousel-control-next" href="#productCarousel" role="button" data-bs-slide="next"> 
								<span class="carousel-control-custom-icon" aria-hidden="true">
										<i class="fas fa-chevron-right"></i>
								</span> <span class="sr-only">Next</span>
							</a> -->

						</div>
					</div>
				</div>
				<!-- Product Details Section -->
				<div class="col-md-6 right-side">

					<div class="scroll-vertical">
						<!-- Product Title -->
						<h3 class="product-title">Logitech MX Mechanical Wireless
							Illuminated Keyboard</h3>

						<!-- Ratings and Amazon Choice Label -->
						<div class="d-flex align-items-center ">
							4.5 &nbsp; <span class="star-rating"> <span class="stars">
									<span class="stars-filled" style="width: 90%;"></span> <!-- Adjust the width for percentage -->
							</span>
							</span> <a href="#reviews" class="text-muted">(3,951 ratings)</a>


						</div>
						<div class="post clearfix"></div>

						<button class="btn btn-outline-danger float-right">
							<i class="fas fa-heart"></i> Wishlist
						</button>



						<!-- Price and Discount -->
						<p class="product-price text-success fs-4">
							<span class="lead" style="font-weight: bold">₹17,995</span> <span
								class="text-muted"><del>₹21,995</del></span> <span
								class="text-success"><strong><em>18% off</em></strong></span>
						</p>

						<!-- Limited Time Deal and Inclusive Tax Note -->
						<p class="text-muted">Inclusive of all taxes</p>
						<p class="deal text-danger">Limited time deal</p>


						<div class="feature-band mb-2">
							<div class="feature-item">
								<i class="fa-solid fa-hand-holding-dollar"></i> <span>Pay
									on Delivery</span>
							</div>
							<div class="feature-item">
								<i class="fas fa-sync-alt"></i> <span>7 Days Replacement</span>
							</div>
							<div class="feature-item">
								<i class="fa-solid fa-shield-halved"></i> <span>2 Year
									Warranty</span>
							</div>

							<div class="feature-item">
								<i class="fa-solid fa-fingerprint"></i> <span>Secure
									Transaction</span>
							</div>
						</div>


						<div class="product-options">
							<p>
								<strong>Selected Colour:</strong> <span id="colourName"
									name="colourName">red</span>
							</p>
							<!-- Color Selection -->
							<div>
								<span class="">Available color:</span> <span
									class="color-options"> <label
									class="color-option red selected"> <input type="radio"
										name="color" value="red">
								</label> <label class="color-option black"> <input type="radio"
										name="color" value="black">
								</label> <label class="color-option beige"> <input type="radio"
										name="color" value="beige">
								</label> <label class="color-option yellow"> <input type="radio"
										name="color" value="yellow">
								</label>
								</span>
							</div>

							<hr>

							<p>
								<strong>Selected Size:</strong> <span id="sizeName"
									name="sizeName">XS</span>
							</p>
							<!-- Size Selection -->
							<div class="mt-3">
								<span class="option-label">Available size:</span>
								<div class="size-options">
									<label class="size-option selected">XS</label> <label
										class="size-option">S</label> <label class="size-option">M</label>
									<label class="size-option">L</label>
								</div>
							</div>

							<hr>

							<!-- Pattern Selection -->
							<p>
								<strong>Style:</strong> <span id="selectedPatternName"
									name="selectedPatternName"></span>
							</p>
							<div class="pattern-container">
								<button class="scroll-button left"
									onclick="scrollPatterns('left')">‹</button>
								<div class="patterns">
									<div class="pattern-item" onclick="selectPattern(this)">
										<span class="pattern-name">Pattern 1</span> <span
											class="pattern-price">$10</span>
									</div>
									<div class="pattern-item" onclick="selectPattern(this)">
										<span class="pattern-name">Pattern 2</span> <span
											class="pattern-price">$20</span>
									</div>
									<div class="pattern-item" onclick="selectPattern(this)">
										<span class="pattern-name">Pattern 3</span> <span
											class="pattern-price">$20</span>
									</div>
									<div class="pattern-item" onclick="selectPattern(this)">
										<span class="pattern-name">Pattern 4</span> <span
											class="pattern-price">$20</span>
									</div>
									<div class="pattern-item" onclick="selectPattern(this)">
										<span class="pattern-name">Pattern 5</span> <span
											class="pattern-price">$20</span>
									</div>
									<div class="pattern-item" onclick="selectPattern(this)">
										<span class="pattern-name">Pattern Pattern Pattern 6</span> <span
											class="pattern-price">$20</span>
									</div>
									<div class="pattern-item" onclick="selectPattern(this)">
										<span class="pattern-name">Pattern Pattern Pattern
											Pattern 7</span> <span class="pattern-price">$20</span>
									</div>
									<div class="pattern-item" onclick="selectPattern(this)">
										<span class="pattern-name">Pattern Pattern Pattern
											Pattern 8</span> <span class="pattern-price">$20</span>
									</div>
								</div>
								<button class="scroll-button right"
									onclick="scrollPatterns('right')">›</button>
							</div>



						</div>

						<div class="product-info mt-2">
							<table class="table table-sm table-borderless">
								<tbody>
									<tr>
										<td class="text-bold">Brand</td>
										<td>Noodler's</td>
									</tr>
									<tr>
										<td class="text-bold">Ink Colour</td>
										<td>Blue</td>
									</tr>
									<tr>
										<td class="text-bold">Package Information</td>
										<td>Bottle</td>
									</tr>
									<tr>
										<td class="text-bold">Item Volume</td>
										<td>88 Millilitres</td>
									</tr>
									<tr>
										<td class="text-bold">Manufacturer</td>
										<td>Noodler's Ink USA, Noodler's Ink, USA</td>
									</tr>
								</tbody>
							</table>

							<div class="about-item">
								<h5>About this item</h5>
								<ul>
									<li>Product Code: 19048</li>
									<li>Brand Origin: United States of America</li>
									<li>Series: Noodler's Ink Bottle Baystate Blue 3Oz</li>
								</ul>
								<a href="#productTab" class="see-more">› See more product
									details</a>
							</div>
						</div>


						<!-- Quantity Selector -->
						<div class="container mt-4 mb-2 row">

							<label class="input-group-text col-8" for="quantitySelect">Quantity</label>

							<div class="input-group quantity-input col-4">
								<div class="input-group-prepend">
									<button class="btn btn-outline-secondary btn-minus"
										type="button" style="border-radius: 25px 0px 0px 25px;">-</button>
								</div>
								<input type="number"
									class="form-control text-center number-no-arrow" value="1"
									min="1" aria-label="Quantity" name="quantitySelect"
									id="quantitySelect">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary btn-plus"
										type="button" style="border-radius: 0px 25px 25px 0px;">+</button>
								</div>
							</div>
						</div>


						<script>
							document
									.querySelector('.btn-minus')
									.addEventListener(
											'click',
											function() {
												let quantityInput = document
														.querySelector('.quantity-input input');
												let currentValue = parseInt(quantityInput.value) || 1;
												if (currentValue > 1)
													quantityInput.value = currentValue - 1;
											});

							document
									.querySelector('.btn-plus')
									.addEventListener(
											'click',
											function() {
												let quantityInput = document
														.querySelector('.quantity-input input');
												let currentValue = parseInt(quantityInput.value) || 1;
												quantityInput.value = currentValue + 1;
											});
						</script>
					</div>


				</div>
			</div>
		</div>
		<div class="clearfix hidden-md-up"></div>


	</div>

	<div class="card-footer">

		<div class="container col-sm-12 col-md-6">
			<!-- Add to Cart and Buy Now Buttons -->
			<div class="row gx-2">
				<div class="col-6">
					<button class="btn btn-warning w-100">
						<i class="fas fa-shopping-cart me-2"></i> Add to Cart
					</button>
				</div>
				<div class="col-6">
					<button class="btn btn-success w-100" type="submit">
						<i class="fas fa-bolt me-2"></i> Buy Now
					</button>
				</div>
			</div>
		</div>

	</div>


</div>

<!-- Tabbed Information Section -->
<div class="card">
	<div class="card-header">
		<ul class="nav nav-tabs elevation-2 " id="productTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="description-tab"
					data-bs-toggle="tab" data-bs-target="#description" type="button"
					role="tab" aria-controls="description" aria-selected="true">Description</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="specification-tab" data-bs-toggle="tab"
					data-bs-target="#specification" type="button" role="tab"
					aria-controls="specification" aria-selected="false">Specification</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
					data-bs-target="#FAQ" type="button" role="tab" aria-controls="FAQ"
					aria-selected="false">FAQs</button>
			</li>
		</ul>
	</div>
	<div class="card-body">
		<div class="tab-content p-3" id="productTabContent">
			<div class="tab-pane fade show active" id="description"
				role="tabpanel" aria-labelledby="description-tab">
				<p>Mill Oil is an innovative oil-filled radiator that provides
					the most modern technology. It is efficient, stylish, and helps
					maintain a warm and cozy atmosphere in your home during winter.</p>
			</div>
			<div class="tab-pane fade" id="specification" role="tabpanel"
				aria-labelledby="specification-tab">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th scope="row">Width</th>
							<td>128mm</td>
						</tr>
						<tr>
							<th scope="row">Height</th>
							<td>508mm</td>
						</tr>
						<tr>
							<th scope="row">Depth</th>
							<td>85mm</td>
						</tr>
						<tr>
							<th scope="row">Weight</th>
							<td>52gm</td>
						</tr>
						<tr>
							<th scope="row">Quality Checking</th>
							<td>Yes</td>
						</tr>
						<tr>
							<th scope="row">Freshness Duration</th>
							<td>03 days</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade" id="FAQ" role="tabpanel"
				aria-labelledby="reviews-tab">

				<!-- Message. Default to the left -->
				<div class="direct-chat-msg">
					<!-- /.direct-chat-infos -->
					<i class="fa-solid fa-person-circle-question direct-chat-img"
						style="font-size: 30px;"></i>
					<!-- /.direct-chat-img -->
					<div class="direct-chat-text">Lorem ipsum dolor sit amet
						consectetur adipisicing elit. Cum, quis sit nemo, possimus
						incidunt quia minima laborum suscipit beatae dolorem sapiente?</div>
					<!-- /.direct-chat-text -->
				</div>
				<!-- /.direct-chat-msg -->

				<!-- Message to the right -->
				<div class="direct-chat-msg right">
					<div class="direct-chat-infos clearfix">
						<span class="direct-chat-name float-right">Anonymous</span>
					</div>
					<!-- /.direct-chat-infos -->
					<i class="fa-solid fa-comment direct-chat-img"
						style="font-size: 30px;"></i>
					<!-- /.direct-chat-img -->
					<div class="direct-chat-text">Some people hate it and argue
						for its demise, but others ignore the hate</div>
					<!-- /.direct-chat-text -->
				</div>
				<!-- /.direct-chat-msg -->

				<div class="post clearfix"></div>

				<div class="direct-chat-msg">
					<!-- /.direct-chat-infos -->
					<i class="fa-solid fa-person-circle-question direct-chat-img"
						style="font-size: 30px;"></i>
					<!-- /.direct-chat-img -->
					<div class="direct-chat-text">Lorem ipsum dolor sit amet
						consectetur adipisicing elit. Cum, quis sit nemo, possimus
						incidunt quia minima laborum suscipit beatae dolorem sapiente?</div>
					<!-- /.direct-chat-text -->
				</div>
				<!-- /.direct-chat-msg -->

				<!-- Message to the right -->
				<div class="direct-chat-msg right">
					<div class="direct-chat-infos clearfix">
						<span class="direct-chat-name float-right">Anonymous</span>
					</div>
					<!-- /.direct-chat-infos -->
					<i class="fa-solid fa-comment direct-chat-img"
						style="font-size: 30px;"></i>
					<!-- /.direct-chat-img -->
					<div class="direct-chat-text">Some people hate it and argue
						for its demise, but others ignore the hate</div>
					<!-- /.direct-chat-text -->
				</div>
				<!-- /.direct-chat-msg -->

				<div class="post clearfix"></div>



			</div>
		</div>
	</div>

</div>



<div class="card card-solid" id="reviews">
	<div class="card-header bg-gradient-light disabled">
		<i class="fa-solid fa-ranking-star"></i> <strong>Customer
			Reviews and Ratings</strong>
	</div>
	<div class="card-body">
		<div class="row">


			<div class="col-md-4">
				<div class="sticky-top mb-0" style="top: 75px">

					<!-- Total Ratings and Reviews Summary -->
					<div class="ratings-summary">
						<%
						String starColor = Helper.getStarColour(90);
						%>
						<h4>
							<span class="star-rating"> <span class="stars"> <span
									class="stars-filled"
									style="width: 90%; color: <%=Helper.getStarColour(90)%>;"></span>
									<!-- Adjust the width for percentage -->
							</span>
							</span> 4.5 out of 5
						</h4>
						<p>11,903 Ratings & 1,065 Reviews</p>
					</div>

					<!-- Rating Distribution -->
					<div class="rating-distribution elevation-2">
						<div class="rating-row">
							<span class="star-label">5★</span>
							<div class="bar-container">
								<div class="bar" data-rating="5" style="width: 52%;"></div>
							</div>
							<span class="count">6,204 (52%)</span>
						</div>
						<div class="rating-row">
							<span class="star-label">4★</span>
							<div class="bar-container">
								<div class="bar" data-rating="4" style="width: 21%;"></div>
							</div>
							<span class="count">2,482 (21%)</span>
						</div>
						<div class="rating-row">
							<span class="star-label">3★</span>
							<div class="bar-container">
								<div class="bar" data-rating="3" style="width: 11%;"></div>
							</div>
							<span class="count">1,265 (11%)</span>
						</div>
						<div class="rating-row">
							<span class="star-label">2★</span>
							<div class="bar-container">
								<div class="bar" data-rating="2" style="width: 5%;"></div>
							</div>
							<span class="count">554 (5%)</span>
						</div>
						<div class="rating-row">
							<span class="star-label">1★</span>
							<div class="bar-container">
								<div class="bar" data-rating="1" style="width: 12%;"></div>
							</div>
							<span class="count">1,398 (12%)</span>
						</div>
					</div>


					<hr>

					<div>
						<div class="card-header">
							<h3 class="card-title">Convey your thought on this product</h3>
						</div>
						<%
						boolean isAlreadyReviewed = false;
						%>
						<%
						if (isAlreadyReviewed) {
						%>
						<div class="card-body">You've already reviewed this product</div>
						<div
							class="card-footer d-flex justify-content-center align-items-center">
							<!-- Button to Trigger Modal -->
							<button type="button" class="btn btn-toggle btn-outline-light"
								data-bs-toggle="modal" data-bs-target="#modal-default">
								Edit your Review</button>
						</div>
						<%
						} else {
						%>
						<div
							class="card-footer d-flex justify-content-center align-items-center">
							<!-- Button to Trigger Modal -->
							<button type="button" class="btn btn-toggle btn-outline-light"
								data-bs-toggle="modal" data-bs-target="#modal-default">
								Review this product</button>
						</div>
						<%
						}
						%>
					</div>



				</div>
			</div>


			<div class="col-md-8">

				<hr>

				<div class="form-group row">
					<label class="col-6 col-sm-8 col-form-label">Customer
						Says</label>

					<div class="col-6 col-sm-4">
						<select name="sortReveiw" id="sortReveiw" class="form-control"
							onchange="">
							<option value="recent">Most Recent</option>
							<option value="positivr">Positive First</option>
							<option value="negative">Negative First</option>
						</select>
					</div>
				</div>

				<hr>
				<div class="post">
					<div class="user-block">
						<img class="img-circle img-bordered-sm"
							src="img/user-profile-icon.png" alt="user"> <span
							class="username"> <span>Jonathan Burke Jr.</span>
						</span> <span class="description"> <span
							style="font-size: 1.25em; color: <%=Helper.getStarColour(60)%>;">✯
								✯ ✯</span> <span style="font-size: 1.25em;">✯ ✯</span> <span
							class="text-bold text-muted" style="font-size: 1.1em;">Loved
								it</span>
						</span> <span class="description">Reviewed in West Bengal, India -
							7:30 PM today</span> <span class="description">Colour : Blue |
							Size : 8 | Pattern : Lorem </span>
					</div>
					<!-- /.user-block -->
					<p>Lorem ipsum represents a long-held tradition for designers,
						typographers and the like. Some people hate it and argue for its
						demise, but others ignore the hate as they create awesome tools to
						help create filler text for everyone from bacon lovers to Charlie
						Sheen fans.</p>

					<!-- admin reply -->
					<div class="timeline timeline-inverse mb-0">
						<div>
							<div class="timeline-item">
								<span class="time"><i class="far fa-clock"></i> 12:05 PM
									Today</span>

								<h3 class="timeline-header">
									<a href="#">Support Team</a> sent you an email
								</h3>

								<div class="timeline-body">Etsy doostang zoodles disqus
									groupon greplin oooj voxy zoodles, weebly ning heekya handango
									imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo
									ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu
									weebly balihoo...</div>
							</div>
						</div>
					</div>
					<!-- END admin reply -->
				</div>

				<div class="post">
					<div class="user-block">
						<img class="img-circle img-bordered-sm"
							src="img/user-profile-icon.png" alt="user"> <span
							class="username"> <span>Jonathan Burke Jr.</span>
						</span>  
						<% 
    int rating = 5; // Assume rating out of 5, can be dynamically set
    int filledStars = rating; // Calculate number of filled stars
    int unfilledStars = 5 - filledStars; // Calculate remaining unfilled stars
    String filledColor = Helper.getStarColour((int) ((rating / 5.0) * 100)); // Color for filled stars based on rating
%>

											<span class="description"> <!-- Filled Stars --> <%
        for (int i = 0; i < filledStars; i++) {
    %> <span style="font-size: 1.25em; color: <%= filledColor %>;">✯</span>
												<%
        }
    %> <!-- Unfilled Stars --> <%
        for (int i = 0; i < unfilledStars; i++) {
    %> <span style="font-size: 1.25em; color: #ddd;">✯</span> <!-- Gray or default color for unfilled stars -->
												<%
        }
    %>
											</span>
						<span class="description">Reviewed in West Bengal, India -
							7:30 PM today</span> <span class="description">Colour : Blue |
							Size : 8 | Pattern : Lorem </span>
					</div>
					<!-- /.user-block -->
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Cum, quis sit nemo, possimus incidunt quia minima laborum suscipit
						beatae dolorem sapiente? Eum tempora corporis sed perspiciatis
						veniam delectus rerum magnam illum, eos assumenda, quae natus
						voluptates doloribus possimus nihil facilis. Aliquid nesciunt ut
						odio quidem iste quisquam, tempora temporibus neque sequi repellat
						dolorem. Nulla exercitationem expedita nam earum modi, fugit atque
						ex, ea eligendi harum molestias repellat vel non, iusto
						consequatur perspiciatis optio totam necessitatibus tempore
						accusantium ab. Modi quasi, optio provident dolore fugiat quam
						iste voluptas magni, eum neque debitis ipsa voluptatem a ipsam
						iusto ab libero, rerum saepe repellat totam dolores? Totam cum
						mollitia laboriosam delectus ex quae animi reiciendis aliquam
						minima, cumque sapiente ea.</p>
				</div>


			</div>


		</div>


	</div>
</div>


<div class="modal fade p-4" id="modal-default">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form method="post">
				<div class="modal-header">
					<h4 class="modal-title">Leave a Review</h4>
					<button type="button" class="btn btn-sm btn-toggle" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-circle-xmark"></i></button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="exampleSelectBorderWidth2">Your Product</label> <select
							class="custom-select form-control-border border-width-2"
							id="exampleSelectBorderWidth2">
							<option>Pattern 1</option>
							<option>Pattern 2</option>
							<option>Pattern 3</option>
						</select>







<style>
:root {
	--light-bg: #ffffff;
	--dark-bg: #1e1e1e;
	--light-text: #333333;
	--dark-text: #dddddd;
	--star-color: orange; /* color for selected and hovered stars */
	--inactive-star: #cccccc; /* color for unselected stars */
	--btn-bg: #007bff;
	--btn-text: #ffffff;
	--btn-hover: #0056b3;
}

body.light-mode {
	--bg-color: var(--light-bg);
	--text-color: var(--light-text);
}

body.dark-mode {
	--bg-color: var(--dark-bg);
	--text-color: var(--dark-text);
}

.review-section {
	background-color: var(--bg-color);
	color: var(--text-color);
	padding: 20px;
	border-radius: 8px;
	max-width: 400px;
	margin: auto;
	text-align: center;
}

.star-rating {
	margin: 10px 0;
	font-size: 24px;
}

.star {
	cursor: pointer;
	color: var(--inactive-star);
	transition: color 0.3s;
}

/* Highlight stars with .hover or .selected class */
.star.hover, .star.selected {
	color: var(--star-color);
}
</style>

						<h5 class="mt-3">Overall Rating</h5>
						<div class="star-rating">
							<span class="star" data-value="1">&#9733;</span> <span
								class="star" data-value="2">&#9733;</span> <span class="star"
								data-value="3">&#9733;</span> <span class="star" data-value="4">&#9733;</span>
							<span class="star" data-value="5">&#9733;</span>
						</div>
						<input type="hidden" id="ratingValue" name="rating" value="0">

<script>
const stars = document.querySelectorAll('.star');
const ratingInput = document.getElementById('ratingValue'); // Get the hidden input
let rating = 0;

stars.forEach((star, index) => {
    // Handle mouseenter to add hover effect up to the hovered star
    star.addEventListener('mouseenter', () => {
        stars.forEach((s, i) => {
            s.classList.toggle('hover', i <= index);
        });
    });

    // Remove the hover effect on mouseleave
    star.addEventListener('mouseleave', () => {
        stars.forEach(s => s.classList.remove('hover'));
    });

    // Handle click to set the rating
    star.addEventListener('click', () => {
        rating = index + 1;
        stars.forEach((s, i) => {
            s.classList.toggle('selected', i < rating);
        });
     // Update the hidden input's value
        ratingInput.value = rating;
    });
});

</script>
						<br>
						<label class="form-label">Add a headline</label>
						<input type="text" class="form-control" id="" name="txtHeadline" placeholder="What's most important to know?">
						<br>
						<label class="form-label">Add a written review</label>
						<textarea class="form-control" rows="4"
							placeholder="What did you like or dislike? What did you use this product for?"></textarea>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning">Submit Review</button>
					<button type="button" class="btn btn-warning">Save changes</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
