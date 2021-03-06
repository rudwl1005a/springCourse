<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/board" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
	<b:navBar></b:navBar>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>게시물 수정</h1>
				<form id="modifyForm" method="post">
					<input type="hidden" name="id" value="${board.id }">
					<div class="form-group">
						<label for="input1">제목</label>
						<input type="text" class="form-control" value="${board.title }" id="input1" name="title">
					</div>
					<div class="form-group">
						<label for="input2">내용</label>
						<textarea type="text" class="form-control" id="input2" name="content">${board.content }</textarea>
					</div>
					<div class="form-group">
						<label for="input3">작성자</label>
						<input type="text" class="form-control" id="input3" value="${board.nickName }" readonly>
					</div>
					
					<input type="hidden" name="writer" value="${board.writer }" />
					
					<button id="modifySubmitButton" class="btn btn-outline-primary" type="submit">수정</button>
					<button id="removeSubmitButton" class="btn btn-outline-danger">삭제</button>
				</form>
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<script>
$(document).ready(function() {
    $("#removeSubmitButton").click(function(e) {
      e.preventDefault(); // 기본 동작을 진행하지 않도록 함.
      $("#modifyForm").attr("action", "remove").submit();
    });

    $("#modifySubmitButton").click(function(e) {
      e.preventDefault();
      $("#modifyForm").attr("action", "modify").submit();
    });
  });
</script>
</body>
</html>
