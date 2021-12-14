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
        <small>친구 목록 </small>
    </span>
    <ul class="sidebar-nav">
        <li>
            <a href="javascript:void(0)" data-toggle="collapse" data-target="#menu-collapse-1">
               로그인된 친구
            </a>
            <ul id="menu-collapse-1" class="collapse in">
                <li>
                    <a href="noteview.jsp"><button>메시지</button>
                       친구
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                       친구
                    </a>
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
                    <a href="javascript:void(0)">
                     	친구
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                       친구
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        친구
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</div>

 <!-- 사이드바 열기 버튼 -->
 <a href="javascript:void(0)" data-toggle="sidebar" style="margin: auto;">
     <button class="btn btn-default">친구</button>
 </a>
 

</body>
</html>