<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배스킨라빈스 설희원</title>
  <style type="text/css">
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
  /* 배경 이미지 설정 */
     body {
        background-image: url('/list_background.jpg'); /* 상대 경로로 이미지 위치 지정 */
	    background-size: cover; /* 이미지가 화면을 전체 채우도록 조정 */
	    background-repeat: no-repeat; /* 이미지 반복 없음 */
	    background-position: center -20px; /* 세로 위치를 상단에서 20픽셀 올림 */
	    background-attachment: fixed; /* 배경 이미지 고정 */
     }
     @font-face {
        font-family: 'BASKINROBBINS';
        src: url('/fonts/배스킨라빈스B.otf') format('opentype');
     }
     th,td {
        border: 2px solid #d6001c; /* 각 셀의 테두리 색상을 붉은색으로 설정 */
        font-size: 35px; /* 폰트 크기 조정 */
        text-align: center; /* 모든 셀의 글자를 가운데 정렬 */
        vertical-align: middle; /* 세로 중앙 정렬 */
        height: 100px; /* 셀 높이 */
    	padding: 0; /* 패딩 제거 */
     }
     
     table {
        border-collapse: collapse;
        width: 100%; /* 테이블이 컨테이너 너비에 맞게 확장 */
    	height: 100%; /* 테이블이 컨테이너 높이에 맞게 확장 */
        margin: 0;
        border: 2px solid #000; /* 테이블 전체의 테두리 색상 설정 */
    	font-family: 'BASKINROBBINS'; /* 글씨체 적용 */
     }
     .table-container {
	    position: absolute; /* 상대적 위치 조정을 위해 절대 위치 지정 */
	    top: 55%; /* 상단에서 55%의 위치에 배치 */
	    left: 46%; /* 왼쪽에서 46%의 위치에 배치 */
	    transform: translate(-50%, -50%); /* 중앙 정렬을 위한 변환 */
	    max-height: 600px; /* 컨테이너의 최대 높이 설정 */
	    width: 65%; /* 너비는 80% */
	    overflow-y: auto; /* 수직 스크롤만 허용 */
    	margin: 0 auto; /* 상하 마진 0, 자동 가운데 정렬 */
	    background-color: white; /* 배경색 설정 */
	 }
     th {
        background-color: #FFB6C1; /* 헤더 배경색을 밝은 핑크색으로 설정 */
    	color: black; /* 헤더 글자 색상을 검은색으로 설정 */
        font-size: 40px;
     }
     /* 링크 스타일 */
	 td a {
	    color: black; /* 링크 글자색 */
	    text-decoration: none; /* 밑줄 제거 */
	    display: block; /* 블록 레벨 요소로 만들어 전체 셀을 채움 */
	    height: 100%; /* 높이를 셀의 높이와 같게 */
	    line-height: 100px; /* 라인 높이를 셀 높이와 같게 */
	    width: 100%; /* 너비를 셀의 너비와 같게 */
	 }
     tr:nth-child(odd) {
	    background-color: #FFB6C1; /* 홀수 행 배경색을 밝은 핑크색으로 설정 */
    	color: black; /* 홀수 행 글자 색상을 검은색으로 설정 */
	 }
	 tr:nth-child(even) {
	    background-color: #FFC0CB; /* 짝수 행 배경색을 연핑크색으로 설정 */
    	color: black; /* 짝수 행 글자 색상을 검은색으로 설정 */
	 }
     /* 이미지 셀을 정사각형으로 설정 */
     td.image-cell {
        width: 100px; /* 너비 설정 */
        height: 100px; /* 높이 설정 */
     }
     img {
        width: 100%; /* 이미지를 셀 크기에 맞춤 */
        height: 100%; /* 이미지를 셀 크기에 맞춤 */
        object-fit: cover; /* 이미지 비율을 유지하면서 셀에 맞춤 */
     }
     /* 아이스크림 이름 셀 스타일 */
	 td.name-cell a {
	    display: block; /* 링크를 블록 요소로 만들어 전체 셀에 적용 */
	    text-decoration: none; /* 밑줄 제거 */
	    color: inherit; /* 부모 요소의 색상 상속 */
	    height: 100%; /* 셀 높이만큼 높이 설정 */
	    width: 100%; /* 셀 너비만큼 너비 설정 */
	    vertical-align: middle; /* 링크의 세로 위치 조정 */
	 }
	
	 td.name-cell {
	    cursor: pointer;
	    transition: background-color 0.3s, color 0.3s;
	 }
	
	 /* 기본 상태 */
	 td.name-cell {
	    color: black; /* 초기 글자 색상 설정 */
	    vertical-align: middle; /* 세로 중앙 정렬 */
	 }
	
	 /* 마우스 오버 시 */
	 td.name-cell:hover, td.name-cell:hover a {
	    background-color: #FF69B4; /* 호버 시 배경색 변경 */
	    color: white; /* 호버 시 글자 색상 변경 */
	 }
	 /* name-cell 호버 시 스타일 */
	 td.name-cell a:hover {
	    font-size: 70px; /* 호버 시 글자 크기 증가 */
	    transition: font-size 0.3s ease-in-out; /* 부드러운 전환 효과 */
	 }
	
	 /* 활성 상태 (클릭된 상태)의 스타일 */
	 .active {
	    background-color: #FF69B4; /* 클릭 시 배경색 변경 */
	    color: white; /* 클릭 시 글자색 변경 */
	    font-size: 35px; /* 활성 상태에서 글자 크기 */
	 }
	 .no-flavor {
        position: fixed; /* 뷰포트에 대해 고정 위치 */
	    top: 50%; /* 상단에서 50%의 위치 */
	    left: 50%; /* 왼쪽에서 50%의 위치 */
	    transform: translate(-50%, -50%); /* 정확한 중앙 정렬을 위해 이동 */
	    width: 100%; /* 전체 너비 */
	    text-align: center; /* 텍스트 중앙 정렬 */
	    font-size: 100px; /* 글자 크기 */
	    color: black; /* 글자 색상 */
	    font-family: 'BASKINROBBINS'; /* 글씨체 */
    }
    .list-button {
    	display: flex; /* Flexbox 사용 */
        background: url('/list_button.jpg') no-repeat center center; /* 버튼 이미지 사용 */
        background-size: 100% 100%; /* 이미지 크기를 버튼 크기에 맞춰 조정 */
        position: absolute; /* 절대 위치 지정 */
        top: 94%; /* 상단으로부터 94% 위치 */
        left: 46%; /* 좌측으로부터 47% 위치 */
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
	.size-button {
		display: flex; /* Flexbox 사용 */
        background: url('/size_button.jpg') no-repeat center center; /* 버튼 이미지 사용 */
        background-size: 100% 100%; /* 이미지 크기를 버튼 크기에 맞춰 조정 */
        position: absolute; /* 절대 위치 지정 */
        top: 28%; /* 상단으로부터 28% 위치 */
        left: 89%; /* 좌측으로부터 89% 위치 */
        transform: translate(-50%, -50%); /* 정확히 중앙 정렬 */
        width: 300px; /* 박스 너비 */
        height: 100px; /* 박스 높이 */
        border-radius: 50px; /* 모서리를 둥글게 */
        border: none;
        color: white; /* 텍스트 색상 */
        font-family: 'BASKINROBBINS'; /* 사용자 정의 글꼴 사용 */
        font-size: 50px; /* 텍스트 크기 */
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
        animation: jumpIn 1s ease-in-out infinite; /* 점 애니메이션 적용 + 무한반 */
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
  </style>
</head>
<%-- 
   list.jsp 

   List<Person> list = (List<Person>)request.getAttribute("list");

   if(list.size()>1){ 테이블 출력 
      for(Person person:list){
           person.getName();
      }
   }
   else {등록된 Person이 없습니다.}
--%>
 <%-- 영역에 "list" key로 저장된 값이 있고 null이 아니라면
      영역에 "list" key로 저장된 값이 있고 List의 경우 size()가 1이상이라면   --%>
<body>
  <c:if test="${ !empty list }">
    <div class="table-container">
      <table>
        <tr>
          <th>이름</th>
          <th>칼로리(kcal)</th>
          <th>Best/이달의 맛</th>
          <th>사진</th>
        </tr>
        <c:forEach items="${list }" var="person">
          <tr>
            <td class="name-cell"><a href="upform?no=${person.no}">${person.name }</a></td>
            <td>${person.calorie}</td>
            <td>${person.best}</td>
            <td class="image-cell">
              <img src="<c:url value='/images/${person.photoFilename}' />" alt="Flavor Image" style="width:100%; height:100%;">
            </td>
          </tr>
        </c:forEach>
      </table>
    </div>
  </c:if>
  <c:if test="${ empty list }">
    <div class="no-flavor">등록된 Flavor이 없습니다.</div>
  </c:if>
  <a href="form" class="list-button">아이스크림입력하기</a>
  <a href="size" class="size-button">
  		<span>사</span><span>이</span><span>즈</span><span>고</span><span>르</span><span>기</span>
  </a>
</body>
</html>
