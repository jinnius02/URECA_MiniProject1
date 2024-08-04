<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배스킨라빈스 설희원</title>
<style>
	/* 배경 이미지 설정 */
    body {
        background-image: url('/form_background.jpg'); /* 상대 경로로 이미지 위치 지정 */
        background-size: cover; /* 배경 이미지가 화면을 전체 채우도록 */
        background-repeat: no-repeat; /* 이미지 반복 없음 */
        background-position: center -65px; /* 가로 위치는 중앙, 세로 위치는 상단에서 내려옴 */
    }
    @font-face {
        font-family: 'BASKINROBBINS';
        src: url('/fonts/배스킨라빈스B.otf') format('opentype');
    }
    /* pink-box 이미지 설정 */
    .pink-box {
        display: flex; /* Flexbox 사용 */
        background: url('/pink_box.jpg') no-repeat center center; /* 버튼 이미지 사용 */
        background-size: 100% 100%; /* 이미지 크기를 버튼 크기에 맞춰 조정 */
        position: absolute; /* 절대 위치 지정 */
        top: 46.3%; /* 상단으로부터 46.3% 위치 */
        left: 50%; /* 좌측으로부터 50% 위치 */
        transform: translate(-50%, -50%); /* 정확히 중앙 정렬 */
        width: 710px; /* 박스 너비 */
        height: 710px; /* 박스 높이 */
        border-radius: 30px; /* 모서리를 둥글게 */
        color: black; /* 텍스트 색상 */
        font-family: 'BASKINROBBINS'; /* 사용자 정의 글꼴 사용 */
        font-size: 48px; /* 텍스트 크기 */
        text-decoration: none; /* 링크 밑줄 제거 */
        border-radius: 40px; /* 모서리를 둥글게 */
		align-items: center; /* 가로 방향 중앙 정렬 */
    	justify-content: normal; /* 세로 방향 자연 정렬 */        
    	flex-direction: column;
    }
    /* 폼 스타일 */
    form {
        background-color: transparent; /* 배경색 투명 설정 */
        border-radius: 15px; /* 경계선 모서리 둥글게 */
        padding: 20px; /* 내부 여백 설정 */
        width: 80%; /* 폼의 너비를 전체의 80%로 설정 */
        font-family: 'BASKINROBBINS'; /* 글꼴 적용 */
        margin-top: 20px; /* 폼의 상단 마진 조절 */
    }
    /* 입력 필드와 버튼 스타일 */
    input[type="text"], button {
        width: 100%; /* 전체 폭 사용 */
        padding: 10px; /* 패딩 설정 */
        margin: 8px 0; /* 위아래 마진 설정 */
        box-sizing: border-box; /* 박스 사이징 보더박스로 설정 */
        font-size: 30px; /* 글자 크기 설정 */
        font-family: 'BASKINROBBINS'; /* 글꼴 적용 */
        border: 2px solid #ccc; /* 윤곽선 두께 2px, 색상 #ccc */
    	border-radius: 15px; /* 테두리를 둥글게 */
    	outline: none; /* 포커스 시 발생하는 기본 윤곽선 제거 */
    }
    /* 등록 버튼 */
    button {
    	display: flex; /* Flexbox 사용 */
        background: url('/regist_button.jpg') no-repeat center center; /* 버튼 이미지 사용 */
        background-size: 100% 100%; /* 이미지 크기를 버튼 크기에 맞춰 조정 */
        position: absolute; /* 절대 위치 지정 */
        top: 78.5%; /* 상단으로부터 78.5% 위치 */
        left: 50%; /* 좌측으로부터 50% 위치 */
        transform: translate(-50%, -50%); /* 정확히 중앙 정렬 */
        width: 132px; /* 박스 너비 */
        height: 55px; /* 박스 높이 */
        border-radius: 50px; /* 모서리를 둥글게 */
        border: none;
        color: black; /* 텍스트 색상 */
        font-family: 'BASKINROBBINS'; /* 사용자 정의 글꼴 사용 */
        font-size: 35px; /* 텍스트 크기 */
        text-decoration: none; /* 링크 밑줄 제거 */
        align-items: center; /* 수직 방향으로 중앙 정렬 */
    	justify-content: center; /* 수평 방향으로 중앙 정렬 */
    }
    button:hover {
    	transform: translate(-50%, -50%) scale(1.1); /* 약간 확대 */
        box-shadow: 0 0 40px rgba(255, 255, 255, 1); /* 더 강한 그림자 추가 */
    }
    button:active {
    	transform: translate(-50%, -50%) scale(0.9); /* 약간 축소 */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5); /* 더 강한 그림자 추가 */
    }
    .list-button {
    	display: flex; /* Flexbox 사용 */
        background: url('/list_button.jpg') no-repeat center center; /* 버튼 이미지 사용 */
        background-size: 100% 100%; /* 이미지 크기를 버튼 크기에 맞춰 조정 */
        position: absolute; /* 절대 위치 지정 */
        top: 77%; /* 상단으로부터 77% 위치 */
        left: 50%; /* 좌측으로부터 50% 위치 */
        transform: translate(-50%, -50%); /* 정확히 중앙 정렬 */
        width: 300px; /* 박스 너비 */
        height: 60px; /* 박스 높이 */
        border-radius: 50px; /* 모서리를 둥글게 */
        border: none;
        color: black; /* 텍스트 색상 */
        font-family: 'BASKINROBBINS'; /* 사용자 정의 글꼴 사용 */
        font-size: 35px; /* 텍스트 크기 */
        text-decoration: none; /* 링크 밑줄 제거 */
        align-items: center; /* 수직 방향으로 중앙 정렬 */
    	justify-content: center; /* 수평 방향으로 중앙 정렬 */
    }
    .list-button:hover {
    	transform: translate(-50%, -50%) scale(1.1); /* 약간 확대 */
        box-shadow: 0 0 40px rgba(255, 255, 255, 1); /* 더 강한 그림자 추가 */
    }
    .list-button:active {
    	transform: translate(-50%, -50%) scale(0.9); /* 약간 축소 */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5); /* 더 강한 그림자 추가 */
    }
    input[type="file"] {
	    width: 100%; /* 전체 폭 사용 */
        padding: 10px; /* 패딩 설정 */
        margin: 8px 0; /* 위아래 마진 설정 */
        box-sizing: border-box; /* 박스 사이징 보더박스로 설정 */
        font-size: 30px; /* 글자 크기 설정 */
        border: 2px solid #ccc; /* 윤곽선 두께 2px, 색상 #ccc */
    	border-radius: 15px; /* 테두리를 둥글게 */
    	outline: none; /* 포커스 시 발생하는 기본 윤곽선 제거 */
    	background-color: white;
    	font-family: 'BASKINROBBINS'; /* 사용자 정의 글꼴 사용 */
	}
</style>
</head>
<body>
  <!-- <form method="post" action="/person/form"> -->
  <!-- <form method="post" action="form"> -->
  <div class="pink-box">
  	<form method="post" enctype="multipart/form-data">
	    이름 <input type="text" name="name"><br>
	    칼로리(kcal) <input type="text" name="calorie"><br>
	    Best/이달의 맛 <input type="text" name="best"><br>
	    사진 <input type="file" name="photo"><br>
	   <button>입력</button>
  	</form>
  </div>
  <br>
  <a href="list" class="list-button">아이스크림목록보기</a>
</body>
</html>
