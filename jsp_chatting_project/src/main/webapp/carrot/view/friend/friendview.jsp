<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/simple-sidebar.css" rel="stylesheet"> <!-- 친구목록 사이드바 css -->

</head>
<body>

<div class="sidebar">
    <span class="sidebar-brand">
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
 <a href="javascript:void(0)" class="btn btn-default" data-toggle="sidebar" style="margin: auto;">
     칭구
 </a>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="../../js/simple-sidebar.js"></script> <!-- 친구목록 사이드바 js  -->
</body>
</html>