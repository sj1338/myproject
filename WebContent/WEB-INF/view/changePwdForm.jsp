<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

 <u:navbar />
  <!-- .container>.row>.col-3+.col-6>h1+form -->
  <div class="container">
  	<div class="row">
  		<div class="col-3"></div>
  		<div class="col-6">
  			<h1>암호 변경</h1>
  			<form action="${root }/changePwd.do" method="post">
              <!-- div.form-group*2>label+input.form-control -->
              <div class="form-group">
                <label for="input1-password">현재 암호</label>
                <input id="input1-password" type="password" class="form-control" name="curPwd" />
                <c:if test="${errors.curPwd }">
                  <small class="form-text text-muted">
                    현재 암호를 입력하세요. 
                  </small>
                </c:if>
                <c:if test="${errors.badCurPwd }">
                	<small class="form-text text-muted">
                	현재 암호와 일치하지 않습니다
                	</small>	
                </c:if>
              </div>
              <div class="form-group">
                <label for="input2-password">새 암호를 입력하세요.</label>
                <input id="input2-password" type="password" name="newPwd" class="form-control" />
                <c:if test="${errors.newPwd }">
                  <small class="form-text text-muted">
                    암호를 입력하세요.
                  </small>
                </c:if>
                
              </div>
              <button type="submit" class="btn btn-primary">암호 변경</button>
              
            </form>
  		</div>
  	</div>
  </div>
  
  <c:if test="${success }" >
	<div class="modal" tabindex="-1" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">암호 변경</h5>
      </div>
      <div class="modal-body">
        <p>암호가 변경되었습니다.</p>
      </div>
      <div class="modal-footer">
        <a href="${root }/myPage.do" class="btn btn-primary">마이 페이지로 가기</a>
      </div>
    </div>
  </div>
</div>

<script>
$('#myModal').modal({
			backdrop: 'static',
			keyboard: false
		});
</script>
</c:if>
  
  
</body>
</html>