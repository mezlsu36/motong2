<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Motong</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
	<style type="text/css">
		.fw-bolder{margin-top: 250px;}
		.box{border-bottom: 1px solid gray; margin-bottom: 10px;}
		.box > .sub_menu{text-align: right;}
		.py-5{background-color: #EAEAEA;}
		.carousel-container {
		    overflow: hidden;
		    height: 300px; /* 캐러셀의 높이 조절 */
		}
		
		.carousel {
		    display: flex;
		    transition: transform 0.5s ease-in-out; /* 슬라이드 애니메이션 속성 */
		}
		 
		.carousel-item {
		    flex: 0 0 100%; /* 각 아이템의 가로 크기를 캐러셀의 너비로 조절 */
		    box-sizing: border-box;
		    text-align: center;
		    padding: 20px;
		}
	</style>
	<script type="text/javascript">
	
		document.addEventListener("DOMContentLoaded", function () {
		    const carousel = document.querySelector(".carousel");
		    let currentIndex = 0;
	
		    setInterval(function () {
		        currentIndex = (currentIndex + 1) % carousel.children.length;
		        updateCarousel();
		    }, 3000); // 3초마다 슬라이드 전환
	
		    function updateCarousel() {
		        const translateValue = -currentIndex * 100 + "%";
		        carousel.style.transform = "translateY(" + translateValue + ")";
		    }
		});
	
	</script>

</head>
<body>
<!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-light" style="width:100%; position:fixed; z-index:100; top:0px;  background-color:#e3f2fd;">
        <div class="container">
       		<a href="/main"><img src="/resources/img/motong_logo.png" style="width:100px; height:50px;" /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/main">Home</a></li>
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">${sessionScope.ldto.name}님</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/myPage?email=${sessionScope.ldto.email}" >마이 페이지</a></li>
                    <li class="nav-item"><a class="nav-link" href="/moim/moimlist?pnum=1">모임리스트</a></li>
                    <li class="nav-item"><a class="nav-link" href="/bank/my_moim">나의 모임</a></li>
                </ul>
            </div>
        </div>
    </nav> 
        <br/><br/>

        <div class="py-5 bg-image-full" style="background-image: url('resources/img/main.png'); background-size: 100% 100%; height: 100vh;">
            <div class="text-center my-5">
                <h1 class="text-white fs-3 fw-bolder">모통이</h1>
                <p class="text-white mb-0">가장 편리한 모임통장</p>
            </div>
        </div>
        <!-- Content section-->
        <section class="py-5">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h2>모임통장</h2>
                        <p class="lead">보유하고 있는 계좌를 모임용으로 전환하여 사용 할 수 있습니다.</p>
                        <p class="lead">계좌를 인증하고 모임통장을 활용해보세요.</p>
                    </div>
                </div>
            </div>
        </section>

    <!-- Footer-->
    <footer class="py-3"  style="background-color:#e3f2fd;" >
            <div class="container"><p class="m-0 text-center text-gray" style=" height: 40px;">Copyright &copy; motong 2023</p></div>
        </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
<!--     <script src="resources/js/scripts.js"></script> -->

</body>

</html>