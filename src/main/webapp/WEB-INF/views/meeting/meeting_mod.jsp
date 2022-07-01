<%--
/**
	Class Name: boot_reg.jsp
	Description: 부트스트랩 등록
	Modification information
	
	수정일     수정자      수정내용
    -----   -----  -------------------------------------------
    2022. 6. 20.        최초작성 
    
    author eclass 개발팀
    since 2020.11.23
    Copyright (C) by KandJang All right reserved.
*/
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- /ehr -->
<c:set var="CP" value="${pageContext.request.contextPath}"/>
<c:set var="resources" value="/resources"/>
<c:set var="CP_RES" value="${CP}${resources}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="${CP}/favicon.ico">
	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>게시 관리</title>
    
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
    <!-- jquery_bootstrap paging -->
    <script type="text/javascript" src="${CP_RES}/js/jquery.bootpag.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function(){
        	console.log("document.ready");
            
        	// 목록으로 이동 함수
        	function moveToList(){
        		window.location.href = "${CP}/meeting/meetingView.do";
        	}
        	
        	$('#doUpdate').on("click", function(e){
        		console.log('doUpdate');
        		if(eUtil.ISEmpty($("#mSeq").val())){
                    alert("게시순번을 입력하세요.");
                    $("#seq").focus();
                    return;
                }
        		if(eUtil.ISEmpty($("#mLoc").val())){
                    alert("지역 구분을 입력하세요.");
                    $("#mLoc").focus();
                    return;
                }
        		if(eUtil.ISEmpty($("#mTitle").val())){
                    alert("제목을 입력하세요.");
                    $("#mTitle").focus();
                    return;
                }
        		if(eUtil.ISEmpty($("#mNum").val())){
                    alert("모집 인원을 입력하세요.");
                    $("#mNum").focus();
                    return;
                }
        		if(eUtil.ISEmpty($("#mKind").val())){
                    alert("모임 종류를 입력하세요.");
                    $("#mKind").focus();
                    return;
                }
        		if(eUtil.ISEmpty($("#mStatus").val())){
                    alert("모임상태를 표시하세요.");
                    $("#mStatus").focus();
                    return;
                }
        		if(eUtil.ISEmpty($("#mDate").val())){
                    alert("모임일을 입력하세요.");
                    $("#mDate").focus();
                    return;
                }
                if(eUtil.ISEmpty($("#modId").val())){
                    alert("수정자를 확인하세요.");
                    $("#regId").focus();
                    return;
                }
                if(eUtil.ISEmpty($("#mContents").val())){
                    alert("내용을 입력하세요.");
                    $("#mContents").focus();
                    return;
                }
                if(confirm("수정 하시겠습니까?") == false){
                    return;
                }
                
                let url = "${CP}/meeting/doUpdate.do";
                let method = "POST";
                let parameters = {
                        "mSeq" : $("#mSeq").val(),
                        "mLoc" : $("#mLoc").val(),
                        "mTitle" : $("#mTitle").val(),
                        "mNum" : $("#mNum").val(),
                        "mKind" : $("#mKind").val(),
                        "mStatus" : $("#mStatus").val(),
                        "mDate" : $("#mDate").val(),
                        "modId" : $("#modId").val(),
                        "mContents" : $("#mContents").val() ,
                        "div" : $("#div").val()
                };
                let async = true;
                EClass.callAjax(url, parameters, method, async, function(data) {
                    console.log("data.msgId : " + data.msgId);
                    console.log("data.msgContents : " + data.msgContents);
                    
                    if("1" == data.msgId){
                        alert(data.msgContents);
                        moveToList();
                    }
                    else{
                        alert(data.msgContents);
                    }
                });
        	});
        	
        	$("#doDelete").on("click", function(e){
        		let meetingId = $('#mSeq').val();
        		console.log('meetingId: ' + meetingId);
        		
        		if(eUtil.ISEmpty(meetingId)){
        			alert("게시 순번을 확인 하세요.");
        			return;
        		}
        		
        		if(confirm("삭제 하시겠습니까?") == false){
                    return;
                }
        		
        		let url = "${CP}/meeting/doDelete.do";
                let method = "POST";
                let parameters = {
                        "mSeq" : meetingId
                };
                let async = true;
                EClass.callAjax(url, parameters, method, async, function(data) {
                	console.log("data.msgId : " + data.msgId);
                    console.log("data.msgContents : " + data.msgContents);
                	
                    if("1" == data.msgId){
                        alert(data.msgContents);
                        moveToList();
                    }
                    else{
                        alert(data.msgContents);
                    }
                })
        	});
        	
        	
        	$("#moveToList").on("click", function(e){
        		moveToList();
        	});
        	
//         	$("#doInsert").on("click", function(e){
//         		console.log('doInsert');
        		
//         		if(eUtil.ISEmpty($("#title").val())){
//         			alert("제목을 입력하세요.");
//         			$("#title").focus();
//         			return;
//         		}
//         		if(eUtil.ISEmpty($("#regId").val())){
//                     alert("아이디를 입력하세요.");
//                     $("#regId").focus();
//                     return;
//                 }
//         		if(eUtil.ISEmpty($("#contents").val())){
//                     alert("내용을 입력하세요.");
//                     $("#contents").focus();
//                     return;
//                 }
//         		if(confirm("등록 하시겠습니까?") == false){
//                     return;
//                 }
        		
//         		let url = "${CP}/meeting/doInsert.do";
//         		let method = "POST";
//         		let parameters = {
//                         "title" : $("#title").val(),
//                         "regId" : $("#regId").val(),
//                         "contents" : $("#contents").val() ,
//                         "div" : $("#div").val()
//                 };
//         		let async = true;
//         		EClass.callAjax(url, parameters, method, async, function(data) {
//         			console.log("data.msgId : " + data.msgId);
//                     console.log("data.msgContents : " + data.msgContents);
                    
//                     if("1" == data.msgId){
//                     	alert(data.msgContents);
//                     	moveToList();
//                     }
//                     else{
//                     	alert(data.msgContents);
//                     }
//         		});
//         	});
        	
        });
    </script>
</head>
<body>
    <!-- div container -->
    <div class="container">
        <!-- 제목 -->
        <div class="page-header">
            <h2>게시 관리</h2>
        </div>
        vo:${vo }
        <!--//제목  ------------------------------------------->
        <!-- 버튼 -->
        <div class="row text-right">
            <label class="col-sm-3 col-md-2 col-lg-2"></label>
            <div class="col-sm-9 col-md-10 col-lg-10">
                <input type="button" class="btn btn-primary btn-sm" value="수정" id="doUpdate">
                <input type="button" class="btn btn-primary btn-sm" value="삭제" id="doDelete">
                <input type="button" class="btn btn-primary btn-sm" value="목록" id="moveToList">
            </div>
        </div>
        <!--//버튼 -------------------------------------------->
        <!-- form -->
        <form action="#" class="form-horizontal" method="post">
            <div class="form-group">
                <label for="mSeq" class="col-sm-3 col-md-2 col-lg-2 control-label">순번</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="mSeq" id="mSeq" value="<c:out value='${vo.mSeq}' />" placeholder="지역 구분" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="mLoc" class="col-sm-3 col-md-2 col-lg-2 control-label">지역 구분</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="mLoc" id="mLoc" value="<c:out value='${vo.mLoc}' />" placeholder="지역 구분" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="mTitle" class="col-sm-3 col-md-2 col-lg-2 control-label">제목</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="mTitle" id="mTitle" value="<c:out value='${vo.mTitle}' />" placeholder="제목" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="mNum" class="col-sm-3 col-md-2 col-lg-2 control-label">모집 인원</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="mNum" id="mNum" value="<c:out value='${vo.mNum}' />" placeholder="모집 인원" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="mKind" class="col-sm-3 col-md-2 col-lg-2 control-label">모임 종류</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="mKind" id="mKind" value="<c:out value='${vo.mKind}' />" placeholder="모임 종류" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="mStatus" class="col-sm-3 col-md-2 col-lg-2 control-label">모임 상태 표시</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="mStatus" id="mStatus" value="<c:out value='${vo.mStatus}' />" placeholder="모임 상태 표시" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="mDate" class="col-sm-3 col-md-2 col-lg-2 control-label">모임 일</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="mDate" id="mDate" value="<c:out value='${vo.mDate}' />" placeholder="모임 일" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="mReadcnt" class="col-sm-3 col-md-2 col-lg-2 control-label">조회 수</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="mReadcnt" id="mReadcnt" value="<c:out value='${vo.mReadcnt}' />" placeholder="조회 수" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="regId" class="col-sm-3 col-md-2 col-lg-2 control-label">등록자</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="regId" id="regId" value="<c:out value='${vo.regId}' />" placeholder="등록자" class="form-control" readonly="readonly">
                </div>
            </div>
            <div class="form-group">
                <label for="regDt" class="col-sm-3 col-md-2 col-lg-2 control-label">등록일</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="regDt" id="regDt" value="<c:out value='${vo.regDt}' />" placeholder="등록일" class="form-control" readonly="readonly">
                </div>
            </div>
            <div class="form-group">
                <label for="modId" class="col-sm-3 col-md-2 col-lg-2 control-label">수정자</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="modId" id="modId" value="<c:out value='${sessionScope.user.uId}' />" placeholder="수정자" class="form-control" readonly="readonly">
                </div>
            </div>
            <div class="form-group">
                <label for="modDt" class="col-sm-3 col-md-2 col-lg-2 control-label">수정일</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <input type="text" maxlength="100" name="modDt" id="modDt" value="<c:out value='${vo.modDt}' />" placeholder="등록일" class="form-control" readonly="readonly">
                </div>
            </div>
<!--             내용 -->
            <div class="form-group">
                <label for="mContents" class="col-sm-3 col-md-2 col-lg-2 control-label">내용</label>
                <div class="col-sm-9 col-md-10 col-lg-10">
                    <textarea name="mContents" id="mContents" cols="20" rows="5" class="form-control"><c:out value='${vo.mContents}'/></textarea>
                </div>
            </div>
<!--             //내용 -------------------------------------- -->
        </form>
        <!--//form -------------------------------------------->
    </div>
    <!--//div container --------------------------------------->
</body>
</html>