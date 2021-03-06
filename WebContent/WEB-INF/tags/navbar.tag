<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>

<style>
.title {
	font-weight: bold;
	font-size: 20px;	
}


.container.my-container {
    max-width: 1400px;
}

.nav-item {
	font-size: 20px;
	margin-left: 5px;
	margin-right: 5px;
}

.navbar-brand {
	font-weight: bold;
	font-size: 22px;
}


</style>

<div class="container my-container mb-5">
<nav class="navbar navbar-expand-lg navbar-light py-3" style="background-color: #e3f2fd;">
  <a class="navbar-brand" href="${root }/index.do">FirstProject.com</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <form class="form-inline my-2 my-lg-0 mx-auto" action="search.do"  >
<!--   	width:500px; position:absolute; top:50%; left:50%; style="transform: translate(-50%, -70%);" -->
   		<input name="search" class="form-control mr-sm-3"  type="search" placeholder="제목 검색" aria-label="Search">
<!--       		style="width:400px" -->
   		<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
   	</form>
    <ul class="navbar-nav mr-auto" >
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
        data-toggle="dropdown" aria-haspopup="t rue" aria-expanded="false" style="font-size: 20px;">
          카테고리
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${root }/article/list.do?cat=art">예술</a>
          <a class="dropdown-item" href="${root }/article/list.do?cat=cook">요리</a>
          <a class="dropdown-item" href="${root }/article/list.do?cat=game">게임</a>
          <a class="dropdown-item" href="${root }/article/list.do?cat=music">음악</a>
          <a class="dropdown-item" href="${root }/article/list.do?cat=sport">스포츠</a>
          <a class="dropdown-item" href="${root }/article/list.do?cat=tour">여행</a>
        </div>
      </li>
      
      <u:notLogin>     
	      <li class="nav-item">
	        <a class="nav-link" href="${root }/login.do">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${root }/join.do">회원가입</a>
	      </li>
      </u:notLogin>
    	
      <u:isLogin>
	      <li class="nav-item">
	        <a class="nav-link" href="${root }/logout.do">로그아웃</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${root }/myPage.do">마이페이지</a>
	      </li>
      </u:isLogin>
    	
      </ul>

     
    <%-- 
    <u:notLogin>
        <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${root }/login.do">로그인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${root }/join.do">회원가입</a>
      </li>
    </ul>
    </u:notLogin>
    
    <u:isLogin>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${root }/logout.do">로그아웃</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${root }/myPage.do">마이페이지</a>
      </li>
    </ul>
    </u:isLogin>
    --%>
  </div>
</nav>
</div>