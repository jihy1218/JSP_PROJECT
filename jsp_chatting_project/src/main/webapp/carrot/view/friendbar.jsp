<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="sidebar">
    <span class="sidebar-brand">
    	<br><br><br><br>
        <a href="javascript:void(0)" data-toggle="sidebar"><i class="glyphicon glyphicon-arrow-left"></i> HIDE</a><br>
        <span>친구 목록 </span>
    </span>
    <ul class="sidebar-nav">
        <li>
            <a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-1">로그인된 친구</a>
            <ul id="menu-collapse-1" class="collapse in">
                <li>
                	<div class="row">
	                	<div class="col-md-4 offset-1">
	                		<span>오동진</span><span style="color: #3BA55D;"><i class="fas fa-circle"></i></span>
	                	</div>
	                	<div class="col-md-5">
	                		<a class="message" href="noteview.jsp"><button class="form-control"><i class="far fa-sticky-note"></i><span class="text-danger">*</span></button></a>
	                	</div>
                	</div>
                </li>
                <li>
                	<div class="row">
	                	<div class="col-md-4 offset-1">
	                		<span>이예지</span><span style="color: #3BA55D;"><i class="fas fa-circle"></i></span>
	                	</div>
	                	<div class="col-md-5">
	                		<a class="message" href="noteview.jsp"><button class="form-control"><i class="far fa-sticky-note"></i></button></a>
	                	</div>
                	</div>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        친구
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-2">
               로그아웃 친구
            </a>
            <ul id="menu-collapse-2" class="collapse in">
                <li>
                	<div class="row">
	                	<div class="col-md-4 offset-1">
	                		<span>이민욱</span><span style="color: #747F8D;"><i class="far fa-circle"></i></span>
	                	</div>
	                	<div class="col-md-5">
	                		<a class="message" href="noteview.jsp"><button class="form-control"><i class="far fa-sticky-note"></i></button></a>
	                	</div>
                	</div>
                </li>
                <li>
                	<div class="row">
	                	<div class="col-md-4 offset-1">
	                		<span>김지형</span><span style="color: #747F8D;"><i class="far fa-circle"></i></span>
	                	</div>
	                	<div class="col-md-5">
	                		<a class="message" href="noteview.jsp"><button class="form-control"></button></a>
	                	</div>
                	</div>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        친구
                    </a>
                </li>
            </ul>
        </li>
        <li>
       		<img src="/jsp_chatting_project/carrot/img/당근친구만들기.png">
        </li>
    </ul>
   
</div>

 <!-- 사이드바 열기 버튼 -->
 <a href="javascript:void(0)" data-toggle="sidebar" style="margin: auto; position: fixed; top: 120px; right:180px;">
     <button class="btn"><i class="fas fa-users fa-2x" style="color: #3f7d1b;"></i></button>
 </a>
 

</body>
</html>