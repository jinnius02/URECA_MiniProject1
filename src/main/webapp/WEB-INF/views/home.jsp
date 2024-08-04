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
        background-image: url('/home_background.jpg'); /* 상대 경로로 이미지 위치 지정 */
        background-size: cover; /* 배경 이미지가 화면을 전체 채우도록 */
        background-repeat: no-repeat; /* 이미지 반복 없음 */
        background-position: center 0px; /* 가로 위치는 중앙, 세로 위치는 상단에서 내려옴 */
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
    .start-button {
        display: flex; /* Flexbox 사용 */
        justify-content: center; /* 텍스트 중앙 정렬 */
        align-items: center; /* 텍스트 중앙 정렬 */
        background: url('/start_button.jpg') no-repeat center center; /* 버튼 이미지 사용 */
        background-size: 100% 100%; /* 이미지 크기를 버튼 크기에 맞춰 조정 */
        width: 400px; /* 버튼 너비 조정 */
        height: 90px; /* 버튼 높이 조정 */
        color: white; /* 텍스트 색상 */
        font-family: 'BASKINROBBINS'; /* 사용자 정의 글꼴 사용 */
        font-size: 50px; /* 텍스트 크기 */
        text-decoration: none; /* 링크 밑줄 제거 */
        border-radius: 50px; /* 모서리를 둥글게 */
        position: absolute; /* 절대 위치 지정 */
        top: 17.7%; /* 세로 중앙에 위치 */
        left: 49%; /* 가로 중앙에 위치 */
        transform: translate(-50%, -50%); /* 정확히 중앙에 위치하도록 조정 */
        transition: all 0.3s ease; /* 애니메이션 효과 추가 */
        animation: sparkle 1s infinite; /* 반짝이는 애니메이션 추가 */
    }
    .start-button span {
        position: relative; /* 상대 위치 지정 */
        transform: translate(0px, 0px); /* 텍스트 위치 조정: 오른쪽으로 0px, 아래로 0px 이동 */
        animation: jumpIn 1s ease-in-out infinite; /* 점 애니메이션 적용 + 무한반 */
        display: inline-block;
        margin-left: 5px; /* 글자 간 간격 조정 */
    }
    .start-button span:nth-child(1) { animation-delay: 0s; }
    .start-button span:nth-child(2) { animation-delay: 0.1s; }
    .start-button span:nth-child(3) { animation-delay: 0.2s; }
    .start-button span:nth-child(4) { animation-delay: 0.3s; }
    .start-button span:nth-child(5) { animation-delay: 0.4s; }
    /* 마우스 커서를 올렸을 때 효과 */
    .start-button:hover {
        transform: translate(-50%, -50%) scale(1.1); /* 약간 확대 */
        box-shadow: 0 0 40px rgba(255, 255, 255, 1); /* 더 강한 그림자 추가 */
        animation: sparkle 0.5s infinite; /* 반짝이는 애니메이션 유지 */
    }
    /* 클릭했을 때 효과 */
    .start-button:active {
        transform: translate(-50%, -50%) scale(0.9); /* 약간 축소 */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5); /* 더 강한 그림자 추가 */
    }
</style>
</head>
<body>
    <a href="form" class="start-button">
    	<span>S</span><span>T</span><span>A</span><span>R</span><span>T</span><span>!</span>
    </a> <!-- 클릭 가능한 버튼 추가 -->
</body>
</html>