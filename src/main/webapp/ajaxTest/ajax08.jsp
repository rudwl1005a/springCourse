<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
$(document).ready(function() {
  const appRoot = '${pageContext.request.contextPath}';
  $("#btn01").click(function() {
    $.ajax({
      url : appRoot + "/cont17/met01"
    });
  })
  
  $("#btn02").click(function() {
    $.ajax({
      url : appRoot + "/cont17/met02/" + 3231
    });
  })
  
  $("#btn03").click(function() {
    $.ajax({
      url : appRoot + "/cont17/met03/" + 567
    });
  });
  
  $("#btn04").click(function() {
    $.ajax({
      url : appRoot + "/cont17/met04/tiger"
    });
  });
  
  $("#btn05").click(function() {
    $.ajax({
      url : appRoot + "/cont17/met05/999/ny"
    });
  });
  
  $("#btn06").click(function() {
    $.ajax({
      url : appRoot + "/cont17/met06/id/3333/city/seoul"
    });
  })
});
</script>

<title>Insert title here</title>
</head>
<body>
<button id="btn06">/cont17/met06/id/{id}/city/{city}</button>
<button id="btn05">/cont17/met05/id/city</button>
<button id="btn04">/cont17/met04/?????????</button>
<button id="btn03">/cont17/met03/number ?????? : controller?????? ??????????????? number??? sysout?????? ??????</button>
<button id="btn02">/cont17/met02/id ??????</button>
<button id="btn01">/cont17/met01 ??????</button>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>









