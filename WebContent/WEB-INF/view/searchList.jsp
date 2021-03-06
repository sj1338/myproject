<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" type="text/css" href="/myproject/res/listSize.css">
<title>Insert title here</title>
<style>
.num-col {
  width: 10%;
}

.title-col {
  width: 60%;
}

.writer-col {
  width: 20%;
}

.read-col {
  width: 10%;
}

#cat {
	font-size:20px;
	margin-bottom : 20px;
}


.table-text{
	color : blue;
	background-color : #e3f2fd;
	
}
</style>
</head>
<body>
  <u:navbar/>

  <div class="container " >
    <div class="row">
      <div class="col-3"></div>
      <div class="col-6">
        <h1 id=cat><b>${param.search } 제목 검색 결과 입니다.</b></h1>
        

        <div class="list-container">
          <table class="table">
            <thead>
              <tr class="table-text">
                <th class="title-col">제목</th>
                <th class="read-col"><i class="fas fa-eye"></i></th>
                <th class="writer-col"><i class="fas fa-user-edit"></i></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="article" items="${articlePage.content }">
                <tr>
                  <td class="position-relative">
                  <a class="stretched-link" href="${root }/article/read.do?no=${article.number }&pageNo=${articlePage.currentPage}">
                    <c:out value="${article.title }" />
                  </a>
                  </td>
                  <td class="text-right">${article.readCount }</td>
                  <td>${article.writer.name }</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        
        <div class="mt-5 pagenation-container d-flex justify-content-center">
          <nav aria-label="Page navigation example">
            <ul class="pagination">
              <c:if test="${articlePage.startPage > 5}">
                <li class="page-item"><a class="page-link" href="${root }/search.do?search=${param.search }&pageNo=${articlePage.startPage - 5 }">Previous</a></li>
              </c:if>
              
              <c:forEach begin="${articlePage.startPage }" end="${articlePage.endPage }" var="pNo">
                <li class="page-item"><a class="page-link" href="${root }/search.do?search=${param.search }&pageNo=${pNo}">${pNo }</a></li>
              
              </c:forEach>
              <c:if test="${articlePage.endPage < articlePage.totalPages }">
                <li class="page-item"><a class="page-link" href="${root }/search.do?search=${param.search }&pageNo=${articlePage.startPage + 5 }">Next</a></li>
              </c:if>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>

  


</body>
</html>