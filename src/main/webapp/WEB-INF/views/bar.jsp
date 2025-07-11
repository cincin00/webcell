<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var TRange=null;

function findString (str) {
	if (parseInt(navigator.appVersion)<4)
		return;
	var strFound;
	if (window.find) {
		strFound=self.find(str);
  		if (!strFound) {
   			strFound=self.find(str,0,1);
   		while (self.find(str,0,1)) 
   			continue;
  		}
 	}
	else if (navigator.appName.indexOf("Microsoft")!=-1) {
		if (TRange!=null) {
   			TRange.collapse(false);
   			strFound=TRange.findText(str);
   			if (strFound) 
   				TRange.select();
  		}
  		if (TRange==null || strFound==0) {
   			TRange=self.document.body.createTextRange();
   			strFound=TRange.findText(str);
   			if (strFound) 
   				TRange.select();
  		}
 	}
 	else if (navigator.appName=="Opera") {
  		alert ("Opera browsers not supported, sorry...")
  	return;
 	}
 	if (!strFound) 
 		alert ("String '"+str+"' not found!")
 	return;
}
function popupOpen()
{
	if(document.all.popup.style.visibility=="hidden")
		{
			document.all.popup.style.visibility="visible";
			return false;
		}
	else
		{
			document.all.popup.style.visibility="hidden";
			return false;
		}
	
}
function closewin()
{
	self.close();
}
$(function(){
	$("body").append("<div id='glayLayer'></div><div id='overLayer'></div>");
	
	$("#glayLayer").click(function(){
		$(this).hide()
		$("#overLayer").hide();
	});
	
	$("a.modal").click(function(){
		$("#glayLayer").show();
		$("#overLayer").show().html("<form><div id='all'><div id='top'><button id='close' onclick='closewin()'>X</button></div><div id='content'>body</div><div id='bottom'>footer</div></div></form>");
		return false;
	});
	
	if($.browser.msie && $.browser.version<7){
		$(window).scroll(function(){
			$("#glayLayer").css('top',$(document).scrollTop());
			$("#overLayer").css('top',($(document).scrollTop()+$(window).height()/2) +"px");
		});
	}
	
});
</script>
<style>
#all
{
background-color: white;
width: 500px;
height: 500px;
}
#top
{
  background-color: blue;
  height: 5%;
  width:100%;
  float: right;
  border: 5px;
  
}
#close
{
	background-color: red;
	width: 20px;
	height: auto;
	text-align: center;
	float: right;
	margin: 3px;
}
#top.title
{
	float: middle;
	text-align: center;
	width: auto;
	height: auto;
}
#content
{

}
#bottom
{

}



div#glayLayer{
	display:none;
	position:fixed;
	left:0;
	top:0;
	height:100%;
	width:100%;
	background:black;
	filter:alpha(opacity=60);
	opacity: 0.60;
}
* html div#glayLayer{
	position:absolute;
}
#overLayer{
	display:none;
	position: fixed;
	top:50%;
	left:50%;
	margin-top:-244px;
	margin-left:-325px;
}
* html #overLayer{
	position: absolute;
}




ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #3fa338;
}

li {
    float: left;
    border-right: 1.5px solid #bbb;
}

li a, .dropbtn{
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn{
    background-color: rgba( 255, 255, 255, 0.5 );
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a{ 
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover{background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

#search
{
	float: right;
	vertical-align: middle;
	padding-top:10px;
	padding-right:10px;
	
}

.dropdown-content button{ 
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
    width: 100%;
    border-color: white;
    background-color: #f1f1f1;
    border-style: none;
}

</style>
</head>
<body>
<ul>
  <li><a class="active" href="#">저장</a></li>
  <li><a href="#">다운로드</a></li>
  <li class="dropdown">
    <a href="#" class="dropbtn">함수</a>
    <div class="dropdown-content">
      <a href="#">평균</a>
      <a href="#">합계</a>
      <a href="#">최대값</a>
      <a href="#">최대값</a>
      <a href="resources/images/photo1.jpg" class="modal">더보기...</a>
  	  <!-- <a href="#" data-toggle="modal" data-target="#testModal">더보기</a> -->
  	  <!-- <button class="modal fade" data-toggle="modal" data-target="#function">더보기</button> -->
    </div>
  </li>
 <li class="dropdown">
    <a href="#" class="dropbtn">정렬</a>
    <div class="dropdown-content">
      <a href="#">오름차순</a>
      <a href="#">내림차순</a>
    </div>
  </li>
   <li class="dropdown">
    <a href="#" class="dropbtn">추가</a>
    <div class="dropdown-content">
      <a href="#">행추가</a>
      <a href="#">열추가</a>
      <a href="#">시트추가</a>
    </div>
  </li>
  <li><a href="board.do">엑셀목록</a></li>
  <li id="search">
  	<div>
  		<input type="text" name="search_text" id="search_text" size="20" onkeypress="javascript:if(event.keyCode==13){findString($('#search_text').val()); return false;}">
  	</div>
  </li>
</ul>
</body>
</html>