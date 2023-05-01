<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>오구가구</title>
<style>

	/* 
		index.html blocker : 
		1. 할인 슬라이드를 제외한 모든 요소가 너무 크다 -> 현재가 100이라면 약 80% 정도으 사이즈로 변경이 필요하다.
		2. 할인 슬라이드는 너무 작다 => 보통 전체 화면의 가로 기준 너비가 100이라면 얘는 약 60 정도 된는 것 같다. 
		3. 화면이 아래로 스크롤 될 때, 첫번째 슬라이드 위의 글씨가 타이틀 로고를 침범한다. z index나 position 적용해봤지만 뭘 잘못했는지 적용 안된다. 
		.. 혹시 위 문제들에 대한 해결책을 알고있거나 시도하며 궁금한 점이 있다면 김은지에게 말해주세요!
	*/
	#wrap{
		min-height: 100vh;
		position: relative;
		width: 100%
	}
	header {
		position: fixed;
		top : 0;
		left: 0;
		right : 0;
		/* 메뉴바 침범하지 않기위함 */
		z-index:2;
		margin-bottom: 0px;
		background-color: white;
	}
	footer{
		width: 100%;
		height: 110px;
		bottom: 0px;
		position: relative;
		z-index: 3;
	}
	html, body{
		margin: 0;
		padding: 0;
	}
	html {
		height: 100%;
	}
	header {
		position: fixed;
		top : 0;
		left: 0;
		right : 0;
		/* 메뉴바 침범하지 않기위함 */
		z-index:2;
		margin-bottom: 0px;
		background-color: white;
	}

	body {
		padding-top: 100px;
		position: relative;
		/* 메뉴바 침범하지 않기위함 */
		z-index:1;
	}

	/* 1번 슬라이드 스타일 구역 */
	.container{
		top: 20px;
		left: 0;
		right: 0;
		bottom: 0;
		margin : 0px;
	}

	/* 1번 슬라이드 내부 사진 */
	.carousel-inner>.carousel-item>img {
		height:800px; 
		/* 사진이 찌그러짐... 개큼*/
	}

	.product-detail {
		z-index:1;
	}

	.ohgu_tit_box {
		/* text-align: center; */
		margin: 0px, 10px, 10px, 20px;
		font-family: "Inter", "Noto Sans KR";
		letter-spacing: -0.01em;
		text-align: left;
	}

	.ohgu_tit_box>.eng {
		font-weight: 400;
		font-size: 30px;
		margin-bottom: 3px;
	}

	.ohgu_tit_box>.kor {
		font-weight: 700;
		font-size: 40px;
	}

	.ohgu_tit_box>.kor>span {
		margin-left: 20px;
		font-weight: 200px;
		font-size: 25px;
		color: #a80c0c;
	}

	.more {
		float : right;
		background-color: transparent;
		width: auto;
		height: auto;
		margin: 12px 0, 0;
		color : rgba(25, 25, 25,0.6);
		font-size: 20px;
		font-weight: 400;
		line-height: 18px;
		position: relative;
		overflow: hidden;
		box-sizing: border-box;
		text-decoration: none;
		margin-top: 30px;
	}

	/* 오구 세일 박스 */
	.ohgu_wrap {
		box-sizing: border-box;
		padding: 120px 10px 10px 20px;
		/* 패딩값을 모두에게 다 줘야하는건가..?*/
	}

	.ohgu_sale_box {
		text-align: center;
		display: flex;
		flex-wrap: nowrap;
		justify-content: space-between;
		overflow: hidden;
	}

	.ohgu_img {
		width: 400px;
		height: 400px;
		object-fit: contain;
		/* border: 1px solid black; */
	}
	/* 추천 상품 하나 하나 */
	.ohgu_sale_prod {
		width:400px;
		font-weight: 400;
		font-family: "Inter", "Noto Sans KR";
	}

	.ohgu_prod_name {
		font-size: 30px;
	}

	.ohgu_orign_price {
		font-size: 20px;
		text-decoration: line-through;
		display: block;
		color: darkgray;
	}

	.ohgu_sale_price {
		font-size: 25px;
		font-weight: 700;
		display: block;
		color: #a80c0c;
	}

	/* 베너 이미지 */
	#advertisement-banner {
        width: 100%;
        height: 400px;
        margin-top: 200px;
    }

	#advertisement-banner img {
		display: block;
		width: 100%;
		height: 100%;
		object-fit: cover;
	}

	/* 비디오 화면 */
	#video-screen {
		text-align: center;
		width: 96%;
		height: 800px;
		margin: 100px auto;
		margin-bottom: 200px;
	}

	/* 할인 상품 슬라이드  */
	

	@media (max-width: 767px) {
		.carousel-inner .carousel-item > div {
			display: none;
		}
		.carousel-inner .carousel-item > div:first-child {
			display: block;
		}
	}

	.carousel-inner .carousel-item.active,
	.carousel-inner .carousel-item-next,
	.carousel-inner .carousel-item-prev {
		display: flex;
	}

	/* medium and up screens */
	@media (min-width: 768px) {
		
		.carousel-inner .carousel-item-end.active,
		.carousel-inner .carousel-item-next {
		transform: translateX(25%);
		}
		
		.carousel-inner .carousel-item-start.active, 
		.carousel-inner .carousel-item-prev {
		transform: translateX(-25%);
		}
	}

	.carousel-inner .carousel-item-end,
	.carousel-inner .carousel-item-start { 
	transform: translateX(0);
	}

	#sale_box {
		width: 1800px !important;
		padding: 0px;
	}

	.sale_image {
		width: 300;
		height: 400;
	}

	.card {
		width: 250px;
		height: 250px;
	}

	#recipeCarousel {
		width: 2000px
	}

</style>

</head>

<body>
	<div id="wrap">
		<header>
			<%@ include file="views/common/mainSidebar.jsp" %>
			<%@ include file="views/common/menubar.jsp" %>
		</header>
			<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
				  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
				  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
				  <div class="carousel-item active">
					<img src="https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block product-detail">
					  <h5>First slide label</h5>
					  <p>Some representative placeholder content for the first slide.</p>
					</div>
				  </div>
				  <div class="carousel-item">
					<img src="https://images.pexels.com/photos/245208/pexels-photo-245208.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block product-detail">
					  <h5>Second slide label</h5>
					  <p>Some representative placeholder content for the second slide.</p>
					</div>
				  </div>
				  <div class="carousel-item">
					<img src="https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block product-detail">
					  <h5>Third slide label</h5>
					  <p>Some representative placeholder content for the third slide.</p>
					</div>
				  </div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				  <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				  <span class="carousel-control-next-icon" aria-hidden="true"></span>
				  <span class="visually-hidden">Next</span>
				</button>
			  </div>

			  <!-- 금주의 오구가구 모음 부분-->
			  <div class="ohgu_wrap w-100">
				<div class="ohgu_tit_box">
					<p class="eng">Recommended</p>
					<p class="kor">
						금주의 오구가구
						<span>오만 구천원으로 봄 맞이 인테리어 하기</span>
						<a class="more" href="...오구가구모음으로가기(상품리스트+오구할인인것만)">더보기<ion-icon name="chevron-forward-outline"></ion-icon></a>
					</p>				
				</div>
				<div class="ohgu_sale_box w-100">
					<div class="ohgu_sale_prod">
						<a href="<%=request.getContextPath()%>/detailView.pr"><img class="ohgu_img" src="https://www.pngarts.com/files/7/Modern-Furniture-PNG-Pic.png" alt=""></a>						
						<div class="ohgu_info">
							<span class="ohgu_prod_name">소파</span>
							<sapn class="ohgu_orign_price">90,000 원</sapn>
							<span class="ohgu_sale_price">59,000 원</span>
						</div>
					</div>
					<div class="ohgu_sale_prod">
						<img class="ohgu_img"src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/product_category/163669805956534581.png" alt="">
						<div class="ohgu_info">
							<span class="ohgu_prod_name">화장대</span>
							<sapn class="ohgu_orign_price">200,000 원</sapn>
							<span class="ohgu_sale_price">59,000 원</span>
						</div>
					</div>
					<div class="ohgu_sale_prod">
						<img class="ohgu_img"src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/product_category/163669805553651444.png" alt="">
						<div class="ohgu_info">
							<span class="ohgu_prod_name">식탁의자</span>
							<sapn class="ohgu_orign_price">90,000 원</sapn>
							<span class="ohgu_sale_price">59,000 원</span>
						</div>
					</div>
					<div class="ohgu_sale_prod">
						<img class="ohgu_img"src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/product_category/163669805553651444.png" alt="">
						<div class="ohgu_info">
							<span class="ohgu_prod_name">식탁의자</span>
							<sapn class="ohgu_orign_price">90,000 원</sapn>
							<span class="ohgu_sale_price">59,000 원</span>
						</div>
					</div>
					<div class="ohgu_sale_prod">
						<img class="ohgu_img"src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/product_category/163669805553651444.png" alt="">
						<div class="ohgu_info">
							<span class="ohgu_prod_name">식탁의자</span>
							<sapn class="ohgu_orign_price">90,000 원</sapn>
							<span class="ohgu_sale_price">59,000 원</span>
						</div>
					</div>
				</div>


				 <!-- 광고용 가로 베너 -->
				 <div id="advertisement-banner">
					<a href="#"><img src="resources/image/ad.png" alt="Advertisement"></a>
				  </div>
	

				  <!-- 오구 할인 아닌 할인상품 목록 -->
				  <div class="container text-center my-5 w-100" id="sale_box">
					<h2 class="font-weight-light">할인 가구 오마카세</h2>
					<div class="row mx-auto my-auto justify-content-center">
						<div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active crouser-item-sale">
									<div class="col-md-3">
										<div class="card sale_card">
											<div class="card-img">
												<img src="https://cdn.allets.com/550/2021/02/02/550_668602_1612248978.webp" class="img-fluid sale_image">
											</div>
											<div class="card-img-overlay">Slide 1</div>
										</div>
									</div>
								</div>
								<div class="carousel-item crouser-item-sale">
									<div class="col-md-3">
										<div class="card">
											<div class="card-img">
												<img src="https://cdn.allets.com/550/2021/02/01/550_668630_1612177001.webp" class="img-fluid sale_image">
											</div>
											<div class="card-img-overlay">Slide 2</div>
										</div>
									</div>
								</div>
								<div class="carousel-item crouser-item-sale">
									<div class="col-md-3">
										<div class="card">
											<div class="card-img">
												<img src="https://cdn.imweb.me/thumbnail/20210414/6b9fefa15f0ff.jpg" class="img-fluid sale_image">
											</div>
											<div class="card-img-overlay">Slide 3</div>
										</div>
									</div>
								</div>
								<div class="carousel-item crouser-item-sale">
									<div class="col-md-3">
										<div class="card">
											<div class="card-img">
												<img src="https://cdn.imweb.me/thumbnail/20210414/af1e7e56d73b2.jpg" class="img-fluid sale_image">
											</div>
											<div class="card-img-overlay">Slide 4</div>
										</div>
									</div>
								</div>
								<div class="carousel-item crouser-item-sale">
									<div class="col-md-3">
										<div class="card">
											<div class="card-img">
												<img src="https://cdn.imweb.me/thumbnail/20210414/7a970c77ba697.jpg" class="img-fluid sale_image">
											</div>
											<div class="card-img-overlay">Slide 5</div>
										</div>
									</div>
								</div>
								<div class="carousel-item crouser-item-sale">
									<div class="col-md-3">
										<div class="card">
											<div class="card-img">
												<img src="https://cdn.designhouse.co.kr/cms/img/2019/04/M.1556602968.3368.7.jpg" class="img-fluid sale_image">
											</div>
											<div class="card-img-overlay">Slide 6</div>
										</div>
									</div>
								</div>
							</div>
							<a class="carousel-control-prev bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							</a>
							<a class="carousel-control-next bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
							</a>
						</div>
					</div>
					<h5 class="mt-2 fw-light">advances one slide at a time</h5>
				</div>

				<script>
					let items = document.querySelectorAll('.crouser-item-sale')

					items.forEach((el) => {
						const minPerSlide = 4
						let next = el.nextElementSibling
						for (var i=1; i<minPerSlide; i++) {
							if (!next) {
								// wrap carousel by using first child
								next = items[0]
							}
							let cloneChild = next.cloneNode(true)
							el.appendChild(cloneChild.children[0])
							next = next.nextElementSibling
						}
					});
				</script>
				
				  <!-- 비디오 -->
				  <div id="video-screen">
					<div class="ohgu_tit_box video_tit_box">
						<p class="eng video_eng">YouTube</p>				
					</div>
					<iframe class="text-center" width="100%" height="100%" src="https://www.youtube.com/embed/KT8FfeDr77Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"></iframe>
				  </div>
			  </div>

		<footer>
			<%@ include file="views/common/footer.jsp" %>
		</footer>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>