<%--
/**
	Class Name:
	Description:
	Modification information
	
	수정일     수정자      수정내용
    -----   -----  -------------------------------------------
    2022. 6. 20.        최초작성 
    
    author ehr 개발팀
    since 2022.01.27
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath}"/>
<c:set var="resources" value="/resources"/>
<c:set var="CP_RES"    value="${CP}${resources}" />
<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <link rel="shortcut icon" type="image/x-icon" href="${CP}/favicon.ico">
    <title>부트 스트랩-boot_list</title>
    <!-- 부트스트랩 -->
    <link href="${CP_RES}/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CP_RES}/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <!-- 사용자 정의 function, ISEmpty -->
    <script src="${CP_RES}/js/eUtil.js"></script>
    <!-- 사용자 정의 function, callAjax -->
    <script src="${CP_RES}/js/eclass.js"></script>
    
    <script src="${CP_RES}/js/bootstrap.min.js"></script>
    <link rel="canonical"
    href="https://getbootstrap.kr/docs/5.1/examples/album/">



<!-- Bootstrap core CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
    crossorigin="anonymous">
<!-- Favicons -->
<link rel="apple-touch-icon"
    href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
    sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
    sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
    sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon"
    href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
    color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

<link rel="stylesheet" href="">
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<style>

/*     .page_wrap {
    text-align:center;
    font-size:0;
 } */
.bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
}

@media ( min-width : 768px) {
    .bd-placeholder-img-lg {
        font-size: 3.5rem;
    }
}
</style>
        
    <script type="text/javascript">
      
    </script>
</head>
<body>
       <header>
        <div class="collapse bg-dark" id="navbarHeader">
            <div class="container">
                <div class="row">

                    <div class="col-sm-8 col-md-7 py-4">
                        <h4 class="text-white">본뉘</h4>
                        <p class="text-muted">캠핑이란 라틴어로 이탈리아 중부의 카피니아의 넓은 평야를 뜻하는 캄푸스
                            Campus 라는 뜻에서 시작하게 되었습니다. 현대의 캠핑은 자연으로 돌아가는 것의 의미로 집과 도시를 벗어나
                            자연속에 마련한 임시거처에 머므르면서 사람과의 우정을 돈독히 하고 저욘을 느끼며 배우는 것이라 할 수 있습니다. 저희
                            본뉘는 모든 캠퍼들을 위한 여러가지 정보들을 담았습니다.</p>
                    </div>
                    <div class="col-sm-4 offset-md-1 py-4">
                        <h4 class="text-white">Contact</h4>
                        <ul class="list-unstyled">
                            <li><a href="meeting.html" class="text-white">모임 찾기</a></li>
                            <li><a href="hogi.html" class="text-white">여행 후기</a></li>
                            <li><a href="travelbb.html" class="text-white">여행지 추천</a></li>
                            <li><a href="community.html" class="text-white">캠핑용품 추천/리뷰</a></li>
                            <li><a href="gongji.html" class="text-white">공지사항</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="navbar navbar-dark bg-dark shadow-sm">
            <div class="container">
                <a href="#" class="navbar-brand d-flex align-items-center"> <!-- <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg> -->
                    <img alt="BonneNuitMark" src="imgs/BonneNuitMark.png" id="nav_img">
                    <strong>로그인</strong>
                </a>
                <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse" data-bs-target="#navbarHeader"
                    aria-controls="navbarHeader" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </div>
    </header>
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">모임 찾기</h1>
                <p class="lead text-muted">가고 싶은 캠핑지 모임을 선택하세요</p>
                <p>
                    <a href="#" class="btn btn-primary my-2">모임 만들기</a>
                    <!--              <a href="#" class="btn btn-secondary my-2">BUTTON</a> -->
                </p>
            </div>
        </div>
    </section>

    <article>
        <div class="main_container">
            <ul class="meeting">
            <c:choose>
               <c:when test="${list.size > 0 }">
                 <c:forEach var="vo" items="${list }">
                <li class="meeting_box1">

                    <p class="meeting_card">시작 예정일 | 2022.06.14</p>
                    <div class="meeting_card">
                        <h2 class="meeting_card">강릉 여행!!</h2>
                        <ul>
                            <li class="meeting_card">#1박2일#먹방여행</li>
                        </ul>
                    </div>
                </li>
                </c:forEach>
                </c:when>
                <c:otherwise>
                </c:otherwise>
<!--                 <li class="meeting_box1"></li> -->
<!--                 <li class="meeting_box1"></li> -->
<!--                 <li class="meeting_box1"></li> -->
<!--                 <li class="meeting_box1"></li> -->
<!--                 <li class="meeting_box1"></li> -->
            </c:choose>
            </ul>
        </div>
        <aside></aside>
    </article>
    <footer class="text-muted py-5">
        <div class="container">
            <p class="float-end mb-1">
                <a href="#">Back to top</a>
            </p>
            <!--        <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p> -->
            <p class="mb-0">
                New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a
                    href="/docs/5.1/getting-started/introduction/">getting started
                    guide</a>.
            </p>
        </div>
    </footer>
</body>
</html>