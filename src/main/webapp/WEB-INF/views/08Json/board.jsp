<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
	//페이지가 로드되면 해당 영역의 모든 내용이 지워진다.
	$(function(){
		$('#boardHTML').html('');
		//아래 내용을 추가한다.
		$('#boardHTML')
			.append('<div style="text-align: center; padding-top: 50px;">')
			.append('<img src="../images/loading02.gif">')
			.append('</div>');
		 
		//리스트 가져오기
		$.ajax({
			url : "./aList.do",
			type : "get",
			contextType : "text/html;charset:utf-8",
			data : {},
			dataType : "html",
			success : function(d){
				$('#boardHTML').html(d);
			},
			error : function(e){
				alert("실패"+e);
			}
		});
	});
</script>
</head>
<body>
<div class="container">
	<h3>방명록 + JSON + jQuery Ajax 연동 게시판</h3>
	
	<div id="boardHTML" class="pt-5">
		<h2>
			여기에 게시판이 출력됩니다.
		</h2>
	</div>
</div>
</body>
</html>