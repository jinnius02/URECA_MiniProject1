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
        background-image: url('/size_background.jpg'); /* 상대 경로로 이미지 위치 지정 */
        background-size: cover; /* 배경 이미지가 화면을 전체 채우도록 */
        background-repeat: no-repeat; /* 이미지 반복 없음 */
        background-position: center -40px; /* 가로 위치는 중앙, 세로 위치는 상단에서 내려옴 */
    }
    @font-face {
        font-family: 'BASKINROBBINS';
        src: url('/fonts/배스킨라빈스B.otf') format('opentype');
    }
    /* 반짝이는 애니메이션 */
    @keyframes sparkle {
        0%, 100% { 
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.8); 
            filter: brightness(1); 
        }
        50% { 
            box-shadow: 0 0 50px rgba(255, 255, 255, 1); 
            filter: brightness(2); 
        }
    }
    /* 점프 애니메이션 */
	@keyframes jumpIn {
	    0%, 100% {
	        transform: translateY(0);
	        opacity: 1;
	    }
	    50% {
	        transform: translateY(-20px);
	        opacity: 1;
	    }
	}
    /* 버튼 스타일 */
    .size-button {
		display: flex; /* Flexbox 사용 */
        background: url('/size_button.jpg') no-repeat center center; /* 버튼 이미지 사용 */
        background-size: 100% 100%; /* 이미지 크기를 버튼 크기에 맞춰 조정 */
        position: absolute; /* 절대 위치 지정 */
        top: 80%; /* 상단으로부터 28% 위치 */
        left: 89%; /* 좌측으로부터 89% 위치 */
        transform: translate(-50%, -50%); /* 정확히 중앙 정렬 */
        width: 240px; /* 박스 너비 */
        height: 80px; /* 박스 높이 */
        border-radius: 50px; /* 모서리를 둥글게 */
        border: none;
        color: white; /* 텍스트 색상 */
        font-family: 'BASKINROBBINS'; /* 사용자 정의 글꼴 사용 */
        font-size: 45px; /* 텍스트 크기 */
        text-decoration: none; /* 링크 밑줄 제거 */
        align-items: center; /* 수직 방향으로 중앙 정렬 */
    	justify-content: center; /* 수평 방향으로 중앙 정렬 */
    	text-align: center; /* 텍스트 중앙 정렬 */
    	transform: translate(-50%, -50%); /* 정확히 중앙에 위치하도록 조정 */
        transition: all 0.3s ease; /* 애니메이션 효과 추가 */
        animation: sparkle 1s infinite; /* 반짝이는 애니메이션 추가 */
	}
	.size-button span {
        position: relative; /* 상대 위치 지정 */
        transform: translate(0px, 0px); /* 텍스트 위치 조정: 오른쪽으로 0px, 아래로 0px 이동 */
        animation: jumpIn 1s ease-in-out infinite; /* 점 애니메이션 적용 + 무한반복 */
        display: inline-block;
        margin-left: 5px; /* 글자 간 간격 조정 */
    }
    .size-button span:nth-child(1) { animation-delay: 0s; }
    .size-button span:nth-child(2) { animation-delay: 0.1s; }
    .size-button span:nth-child(3) { animation-delay: 0.2s; }
    .size-button span:nth-child(4) { animation-delay: 0.3s; }
    .size-button span:nth-child(5) { animation-delay: 0.4s; }
    .size-button span:nth-child(6) { animation-delay: 0.5s; }
    /* 마우스 커서를 올렸을 때 효과 */
    .size-button:hover {
        transform: translate(-50%, -50%) scale(1.1); /* 약간 확대 */
        box-shadow: 0 0 40px rgba(255, 255, 255, 1); /* 더 강한 그림자 추가 */
        animation: sparkle 0.5s infinite; /* 반짝이는 애니메이션 유지 */
    }
    /* 클릭했을 때 효과 */
    .size-button:active {
        transform: translate(-50%, -50%) scale(0.9); /* 약간 축소 */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5); /* 더 강한 그림자 추가 */
    }
    .img-container {
        display: flex;
        justify-content: space-around; /* 변경된 속성 */
   		align-items: flex-end; /* 이미지들의 하단을 일치시킴 */
        margin-top: 750px;
        position: relative;
    }
    img {
        margin: 0px;
        position: absolute; /* 절대 위치 지정 */
    }
    #pint {
        left: 13.8%; /* 왼쪽에서 13.8% 떨어진 위치 */
        width: 200px;
    }
    #quarter {
        left: 31%; /* 왼쪽에서 31% 떨어진 위치 */
        width: 300px;
    }
    #family {
        left: 48%; /* 왼쪽에서 48% 떨어진 위치 */
        width: 400px;
    }
    #half-gallon {
        left: 65%; /* 왼쪽에서 65% 떨어진 위치 */
        width: 500px;
    }
    /* 개별 버튼 위치 조정 */
    #button-pint { left: 20%; }
    #button-quarter { left: 40%; }
    #button-family { left: 60%; }
    #button-half-gallon { left: 80%; }
</style>
</head>
<body>
<div class="img-container">
    <img src="/ice_cream.jpg" id="pint" alt="Pint" class="pint" style="margin-bottom: 60px;">
    <img src="/ice_cream.jpg" id="quarter" alt="Quarter" class="quarter" style="margin-bottom: 40px;">
    <img src="/ice_cream.jpg" id="family" alt="Family" class="family" style="margin-bottom: 20px;">
    <img src="/ice_cream.jpg" id="half-gallon" alt="HalfGallon" class="half-gallon" style="margin-bottom: 8px;">
</div>
<button onclick="location.href='/person/randomFlavors=pint'" id="button-pint" class="size-button"><span>파</span><span>인</span><span>트</span></button>
<button onclick="location.href='/person/randomFlavors=quarter'" id="button-quarter" class="size-button"><span>쿼</span><span>터</span></button>
<button onclick="location.href='/person/randomFlavors=family'" id="button-family" class="size-button"><span>패</span><span>밀</span><span>리</span></button>
<button onclick="location.href='/person/randomFlavors=half-gallon'" id="button-half-gallon" class="size-button"><span>하</span><span>프</span><span>갤</span><span>론</span></button>
    <!-- <a href="random" class="size-button">
    	<span>S</span><span>T</span><span>A</span><span>R</span><span>T</span><span>!</span>
    </a> -->
</body>
</html>