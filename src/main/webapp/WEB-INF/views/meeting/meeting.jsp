<%--
/**
        Class Name:
        Description:
        Modification information
        
        수정일     수정자      수정내용
    -----   -----  -------------------------------------------
    2022. 6. 23.        최초작성 
    
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
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${CP}/favicon.ico">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>게시 목록</title>
    
    <!-- 부트스트랩 -->
    <link href="${CP_RES}/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CP_RES}/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <!-- 사용자 정의 function, ISEmpty -->
    <script src="${CP_RES}/js/eUtil.js"></script>
    <!-- 사용자 정의 function, callAjax -->
    <script src="${CP_RES}/js/eclass.js"></script>
    <!-- jquery_bootstrap paging -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${CP_RES}/js/jquery.min.js"></script>
    <script src="${CP_RES}/js/docs.min.js"></script>
    <script type="text/javascript" src="${CP_RES}/js/jquery.bootpag.js"></script>
    <script src="${CP_RES}/js/bootstrap.min.js"></script>
    <style type="text/css">
    
    </style>
    
    <script type="text/javascript">
      $(document).ready(function(){
        console.log("document.ready");  
        
        renderingPage('${pageTotal}', 1);
        
        // 데이터 클릭
        $('#meeting_card > div').on('click','.meeting_detail', function(){
            console.log("#meeting_card > div > .meeting_detail");
            let aArray = $(this).children();
            console.log("aArray: " + aArray);
            let boardSeq = aArray.eq(4).text();
            console.log("boardSeq: " + boardSeq);
            
            if(confirm("상세 조회를 하시겠습니까?") == false) return;
            
            window.location.href = "${CP}/meeting/doSelectOne.do?mSeq="+boardSeq;
        });
        
        // 등록 화면으로 이동
        $('#moveToReg').on("click", function(e){
        	console.log('moveToReg');
        	console.log("${'#div'}.val(): " + $('#div').val() );
        	window.location.href = "${CP}/meeting/moveToReg.do?div="+$('#div').val(); 
        });
        
     // 페이징
        function renderingPage(pageTotal, page){
            console.log("pageTotal : " + pageTotal);  // 소수점 데이터
            console.log("page : " + page);  // 정수 데이터
            
            pageTotal = parseInt(pageTotal);
            console.log("pageTotal : " + pageTotal);  // 정수 데이터
            
            //이전 연결된 EventHandler 제거
            $('#page-selection').unbind('page');
            
            $('#page-selection').bootpag({
                total: pageTotal,
                page: page,
                maxVisible: 10,
                leaps: true,
                firstLastUse: true,
                first: '←',
                last: '→',
                wrapClass: 'pagination',
                activeClass: 'active',
                disabledClass: 'disabled',
                nextClass: 'next',
                prevClass: 'prev',
                lastClass: 'last',
                firstClass: 'first'
            }).on("page", function(event, num){
                console.log("num : " + num);
                doRetrieve(num);
            });
        }
     
        function doRetrieve(page){
            console.log("function doRetrieve");
            console.log("page:" + page);
            console.log("div:" + $("#div").val());
            
            let url = "${CP}/meeting/doRetrieve.do";
            let method = "GET";
            let async = true;
            let parameters = {
                searchDiv: $("#searchDiv").val(),
                searchWord: $("#searchWord").val(),
                pageSize: $("#pageSize").val(),
                pageNum: page, 
                div: $("#div").val()
            };
            
            EClass.callAjax(url, parameters, method, async, function(data) {
                console.log("EClass.callAjax data : " + data);
                
                // 기존 데이터 삭제
                
                let parsedData = data;
                
                $("#meeting_card").empty();
                console.log("parsedData.length:" + parsedData.length);
                
                let htmlData = "";
                let totalCnt = 0;
                let pageTotal = 1;
                
                // 데이터가 있는경우
                if(null != parsedData && parsedData.length>0){
                    
                    $.each(parsedData, function(i, meetingVO){
                          htmlData += "<div class='col-lg-4'>                                                         ";
                          htmlData += "  <img class='img-circle' src='' style='width: 140px; height: 140px;'>         ";
                          htmlData += "  <h2>"+<c:out value='meetingVO.mTitle'/>+"</h2>                               ";
                          htmlData += "  <p>"+<c:out value='meetingVO.mContents'/>+"</p>                              ";
                          htmlData += "  <p>"+<c:out value='meetingVO.mDate'/>+"</p>                                   ";
                          htmlData += "  <p style='display: none;'>"+<c:out value='meetingVO.mSeq'/>+"</p>            ";
                          htmlData += "  <p><a class='btn btn-default' href='#' role='button'>자세히 보기 &raquo;</a></p> ";
                          htmlData += "</div><!-- /.col-lg-4 -->                                                      ";         
                    });
                }
                else{
                	htmlData += "<div class='col-lg-4'>                                                         ";
                    htmlData += "  <img class='img-circle' src='' style='width: 140px; height: 140px;'>         ";
                    htmlData += "  <h2>NO DATA FOUND!</h2>                                                      ";
                    htmlData += "  <p>NO DATA FOUND!</p>                                                        ";
                    htmlData += "  <p>NO DATA FOUND!</p>                                                        ";
                    htmlData += "  <p><a class='btn btn-default' href='#' role='button'>자세히 보기 &raquo;</a></p> ";
                    htmlData += "</div><!-- /.col-lg-4 -->                                                      ";
                }
                // 데이터가 없는 경우
                $("#meeting_card").append(htmlData);
        	});
        }
        
     
        $("#doRetrieve").on("click", function(e){
            console.log("doRetrieve");
            doRetrieve(1);
        });
        
      });
      
      
    </script>
</head>
<body>
    <!-- div container ------------------------------------------>
    <div class="container">
        <!-- 제목 -------------------------------------------------->
        <div class="page-header">
        </div>
        <!--//제목  -------------------------------------------------->
         <div class="jumbotron">
	        <h1>캠핑 모임 찾기/만들기</h1>
	        <p class="lead">같이 가고 싶은 사람들을 찾아 보세요!!</p>
	        <p>
	          <a href="#" id="moveToReg" class="btn btn-primary my-2">글 쓰기</a>
	          <a href="#" id="doRetrieve" class="btn btn-primary my-2">목록</a>
	        </p>
	      </div>
    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">
      <!-- Three columns of text below the carousel -->
      <div id="meeting_card" class="row">
        <c:choose>
                <c:when test="${list.size() > 0 }">
                  <c:forEach var="vo" items="${list }">
			        <div class="col-lg-4">
				         <div class="meeting_detail">
					          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style="width: 140px; height: 140px;">
					          <h2>${vo.mTitle }</h2>
					          <p>${vo.mContents }</p>
					          <p>${vo.mDate }</p>
					          <p style="display: none;">${vo.mSeq }</p>
					          <p><a class="btn btn-default" href="#" role="button">모임 자세히 보기 &raquo;</a></p>
				         </div>
			        </div><!-- /.col-lg-4 -->
                  </c:forEach>
                </c:when>
	        <c:otherwise>
	        <div class="col-lg-4">
	          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style="width: 140px; height: 140px;">
	          <h2>No data found</h2>
	          <p>No data found</p>
	          <p>No data found</p>
	          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
	        </div><!-- /.col-lg-4 -->
	        </c:otherwise>
        </c:choose>
      </div><!-- /.row -->
       <!-- 검색영역----------------------------------------------- -->
        <div class="row">
          <form action="#" class="form-inline col-sm-12 col-md-12 col-lg-12 text-right">
              <input type="text" name="div" id="div" value =  "${vo.getDiv() }">
              <div class="form-group">
                  <select class="form-control input-sm" name="searchDiv" id="searchDiv">
                      <option value="">전체</option>
                      <option value="10">제목</option>
                      <option value="20">내용</option>
                  </select>
                  <input type="text" class="form-control input-sm" placeholder="검색어" name="searchWord" id="searchWord">
              <select class="form-control input-sm" name="pageSize" id="pageSize">
                  <option value="10">10</option>
                  <option value="20">20</option>
                  <option value="30">30</option>
              </select>
              </div>
          </form>
        </div>
        <!--//검색영역  -->
      <!-- /END THE FEATURETTES -->
    <!-- pagenation------------------------------------------------- -->
        <div class="text-center">
            <div class="text-center col-sm-12 col-md-12 col-lg-12">
                <div id="page-selection" class="text-center page"></div>
            </div>
        </div>
        <!-- //pagenation----------------------------------------------- -->
      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->
    
  </body>
</html>
