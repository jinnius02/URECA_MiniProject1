<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배스킨라빈스 설희원</title>
<style>
	body {
		background-image: url('/random_background.jpg'); /* 상대 경로로 이미지 위치 지정 */
        background-size: cover; /* 배경 이미지가 화면을 전체 채우도록 */
        background-repeat: no-repeat; /* 이미지 반복 없음 */
        background-position: center 0px; /* 가로 위치는 중앙, 세로 위치는 상단에서 내려옴 */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* 화면 전체 높이 */
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
    .flavor-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        margin-top: 6%;
        margin-left: 7%; /* 오른쪽으로 7% 이동 */
        transition: all 0.3s ease; /* 애니메이션 효과 추가 */
        animation: sparkle 1s infinite; /* 반짝이는 애니메이션 추가 */
    	animation: jumpIn 1s ease-in-out infinite; /* 점 애니메이션 적용 + 무한반복 */
    }
    .flavor {
        margin: 10px;
        text-align: center; /* 텍스트 중앙 정렬 */
        font-family: "BASKINROBBINS";
        font-size: 30px;
        padding: 0 40px; /* 양쪽 패딩 추가 */
    }
    .char {
    	display: inline-block;
    	margin-bottom: 5px;
    	transition: all 0.3s ease; /* 애니메이션 효과 추가 */
        animation: sparkle 1s infinite; /* 반짝이는 애니메이션 추가 */
    	animation: jumpIn 1s ease-in-out infinite; /* 점 애니메이션 적용 + 무한반복 */
    	
    }
    /* h3 span:nth-child(1) { animation-delay: 0s; }
    h3 span:nth-child(2) { animation-delay: 0.1s; }
    h3 span:nth-child(3) { animation-delay: 0.2s; }
    h3 span:nth-child(4) { animation-delay: 0.3s; }
    h3 span:nth-child(5) { animation-delay: 0.4s; }
    h3 span:nth-child(6) { animation-delay: 0.5s; }
    h3 span:nth-child(7) { animation-delay: 0.6s; }
    h3 span:nth-child(8) { animation-delay: 0.7s; }
    h3 span:nth-child(9) { animation-delay: 0.8s; }
    h3 span:nth-child(10) { animation-delay: 0.9s; } */
    img {
        width: 200px; /* 이미지 크기 조정 */
        height: 200px;
        border-radius: 50%; /* 이미지를 원형으로 만듦 */
        margin-bottom: 0;
    }
    
</style>
<script>
window.onload = function() {
    document.querySelectorAll('.flavor-name').forEach(function(el) {
        let text = el.innerText;
        let animatedText = '';
        for (let i = 0; i < text.length; i++) {
            animatedText += '<span class="char" style="animation-delay: ' + (i * 0.1) + 's;">' + text[i] + '</span>';
        }
        el.innerHTML = animatedText;
    });
};
</script>
</head>
<body>
<c:if test="${not empty flavors}">
    <div class="flavor-container">
        <c:forEach items="${flavors}" var="flavor">
            <div class="flavor">
                <div class="flavor-name">${flavor.name}</div>
                <img src="/images/${flavor.photoFilename}" alt="Image of ${flavor.name}">
            </div>
        </c:forEach>
    </div>
</c:if>
<c:if test="${empty flavors}">
    <p>No flavors available.</p>
</c:if>
</body>
</html>