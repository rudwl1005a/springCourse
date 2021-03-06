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

<title>Insert title here</title>

<script>
const appRoot = '${pageContext.request.contextPath}';
$(document).ready(function() {
  $("#btn01").click(function() {
    $.ajax({
      url : appRoot + "/cont14/met01",
      data : {
        name : "donald"
      }
    });
  });
  
  $("#btn02").click(function() {
    $.ajax({
      url : appRoot + "/cont14/met02",
      data : {
        city : "seoul"
      }
    });
  });
  
  $("#btn03").click(function() {
    $.ajax({
      url : appRoot + "/cont14/met03",
      data : {
        city : "busan",
        name : "trump"
      }
    });
  });
  
  $("#btn04").click(function() {
    const val = $("#input04").val();
    
    $.ajax({
      url : appRoot + "/cont14/met04",
      data : {
        data1 : val
      }
    });
  });
  
  $("#btn05").click(function() {
    const name = $("#input05").val();
    const address = $("#input06").val();
    
    $.ajax({
      url : appRoot + "/cont14/met05",
      data : {
        name : name,
        address : address
      }
    });
  });
});
</script>
</head>
<body>

<button id="btn01">/cont14/met01 ??????</button>
<button id="btn02">
/cont14/met02 ajax?????? "city" request parameter ????????? ?????? 
AND ??????????????? "city" request parameter??? ?????? sysout?????? ??????
</button> <br>
<button id="btn03">
/cont14/met03 ?????? 
</button>

<hr>

<input type="text" id="input04">
<button id="btn04">/cont14/met04 ?????? : input????????? ????????? ??? ?????????</button>

<hr>

<input type="text" placeholder="name" id="input05">
<input type="text" placeholder="address" id="input06">
<button id="btn05">/cont14/met05 ajax ??????: ??? 2?????? ??????????????? ?????? ?????? ????????? AND server????????? ??? ?????? ??????</button>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>















