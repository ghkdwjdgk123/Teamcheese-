<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<%--<c:set var="loginId" value="${sessionScope.id}"/>--%>
<c:set var="loginId" value="${ur_id}"/>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>saleInfo</title>
	<style>
		/* 탭 스타일 */
		.bun-ui-tab {
			background-color: transparent;
			border: none;
			cursor: pointer;
			padding: 10px 20px;
			font-size: 16px;
			color: #555;
		}

		.bun-ui-tab-selected {
			border-bottom: 2px solid #D80C18;
			color: #D80C18;
		}

		/* 수평선 스타일 */
		.bun-ui-divider {
			border-top: 1px solid #ccc;
		}

		/* 기사 스타일 */
		article header {
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

		article header h3 {
			margin: 0;
			font-size: 18px;
			color: #333;
		}

		article footer button {
			background-color: #D80C18;
			color: white;
			border: none;
			padding: 10px 20px;
			font-size: 16px;
			cursor: pointer;
		}
		/* article 요소의 크기 조정 */
		article {
			margin-top: 10px; /* 기존 20px에서 10px로 줄임 */
			margin-bottom: 10px; /* 기존 20px에서 10px로 줄임 */
			padding: 5px; /* 기존 10px에서 5px로 줄임 */
			border: 1px solid #ccc;
			width: 100%; /* 가로 길이는 원래대로 100%로 유지 */
			margin-left: auto; /* 가운데 정렬을 위한 왼쪽 여백 자동 조절 */
			margin-right: auto; /* 가운데 정렬을 위한 오른쪽 여백 자동 조절 */
		}

		/* article 안의 section 요소의 크기 조정 */
		article section {
			padding: 2px; /* 기존 5px에서 2px로 줄임 */
		}

		/* article 안의 section 안의 section 요소의 크기 조정 */
		article section section {
			padding: 2px 0; /* 기존 5px에서 2px로 줄임 */
		}



		/* 섹션 간격 */
		section {
			margin-bottom: 5px;
		}
		.mainContainer {
			width: 40%;
			margin: 0 auto; /* 가로 중앙 정렬 */
			position: absolute;
			top: 0;
			left: 50%;
			transform: translateX(-50%);
		}

		.bun-ui-divider {
			display: flex; /* 내부 요소를 가로로 배치합니다. */
			justify-content: center; /* 가로 방향으로 정중앙에 배치합니다. */
		}
		.sc-57cf470b-1.fFtTgD {
			--bun-ui-sat: env(safe-area-inset-top);
			--bun-ui-sar: env(safe-area-inset-right);
			--bun-ui-sab: env(safe-area-inset-bottom);
			--bun-ui-sal: env(safe-area-inset-left);
			word-break: keep-all;
			-webkit-font-smoothing: inherit;
			font-size: 16px;
			line-height: 1.5;
			box-sizing: border-box;
			font-family: "Pretendard Variable", -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
			margin: 0px;
			border: 0px;
			vertical-align: baseline;
			position: relative;
			display: flex;
			flex-direction: row;
			padding: 0px 20px 8px;
			-webkit-box-pack: justify;
			justify-content: space-between;
		}
		/* 판매내역 및 구매내역 전용 CSS */
		.purchase-info {
			/* 구매내역에 대한 CSS */
			/* 필요한 스타일 추가 */
		}
		p {
			margin: 0;
		}
		.paging-active {
			background-color: rgb(216, 216, 216);
			border-radius: 5px;
			color: rgb(24, 24, 24);
		}

		.page-space {
			margin: 0 5px;
		}
		.modal {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, 0.6);
			display: flex;
			align-items: center;
			justify-content: center;
			z-index: 1000;
		}

		.modal-content {
			background-color: #fff;
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
			width: auto;
			max-width: 600px;
			margin: auto;
		}

		.close {
			float: right;
			font-size: 28px;
			font-weight: bold;
			cursor: pointer;
		}

		#myform fieldset {
			display: block;
			direction: rtl;
			border: 0;
			text-align: center;
			margin: 20px 0;
		}

		#starRating {
			display: flex;
			justify-content: center;
		}

		#myform input[type=radio] {
			position: absolute;
			opacity: 0;
			width: 0;
			height: 0;
		}

		#myform label {
			font-size: 3em;
			color: #ccc;
			cursor: pointer;
			transition: color 0.3s ease;
		}

		#myform input[type=radio]:checked ~ label,
		#myform label:hover,
		#myform label:hover ~ label {
			color: rgba(250, 208, 0, 0.99);
		}

		#reviewContents {
			width: calc(100% - 20px);
			height: 150px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 1.5px #D3D3D3;
			border-radius: 5px;
			font-size: 16px;
			resize: none;
			outline: none;
		}

		.commentBtn {
			background-color: #007BFF;
			color: white;
			border: none;
			padding: 10px 20px;
			font-size: 16px;
			border-radius: 5px;
			cursor: pointer;
			transition: background-color 0.3s;
		}

		.commentBtn:hover {
			background-color: #0056b3;
		}
	</style>
</head>
<body>
<div class="mainContainer">
	<div class="bun-ui-divider">
		<button class="bun-ui-tab bun-ui-tab-selected" id="seller">
			<span class="bun-ui-tab-label">판매내역</span>
		</button>
		<button class="bun-ui-tab" id="buyer">
			<span class="bun-ui-tab-label">구매내역</span>
		</button>
	</div>
	<hr class="bun-ui-divider">
	<section class="purchase-info">
		<div>
			<button class="bun-ui-tab bun-ui-tab-selected" id="A" data-label-seller="전체" data-label-buyer="전체">
				<span class="bun-ui-tab-label">전체</span>
			</button>
			<button class="bun-ui-tab" id="R" data-label-seller="예약중" data-label-buyer="예약중">
				<span class="bun-ui-tab-label">예약중</span>
			</button>
			<button class="bun-ui-tab" id="S" data-label-seller="판매중" data-label-buyer="구매중">
				<span class="bun-ui-tab-label">판매중</span>
			</button>
			<button class="bun-ui-tab" id="C" data-label-seller="거래완료" data-label-buyer="구매완료">
				<span class="bun-ui-tab-label">거래완료</span>
			</button>
		</div>
		<div class="sc-57cf470b-1 fFtTgD">
			<form id="searchForm">
				<div class="sc-cPiKLX irylio bun-ui-search-container">
					<svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" role="img">
						<path d="M8.99 16.162c-3.955 0-7.172-3.218-7.172-7.172A7.18 7.18 0 0 1 8.99 1.818c3.954 0 7.171 3.217 7.171 7.172 0 3.954-3.217 7.172-7.171 7.172zm6.963-1.494A8.953 8.953 0 0 0 17.98 8.99C17.98 4.032 13.946 0 8.99 0 4.033 0 0 4.032 0 8.99c0 4.957 4.033 8.99 8.99 8.99a8.943 8.943 0 0 0 5.676-2.027l3.781 3.78a.908.908 0 0 0 1.287 0 .909.909 0 0 0 0-1.285l-3.78-3.78z" fill="#b2b2b2" fill-rule="evenodd"></path>
					</svg>
					<input id="searchInput" placeholder="상품명으로 검색해보세요" enterkeyhint="search" class="bun-ui-search" value="">
				</div>
			</form>
			<button class="sc-57cf470b-3 ferXDa">
				<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 18" role="img">
					<path d="M6.6 11.3c1.562 0 2.866 1.063 3.265 2.5H19a.9.9 0 1 1 0 1.8H9.865c-.399 1.436-1.703 2.5-3.265 2.5s-2.866-1.064-3.265-2.5H1a.9.9 0 0 1 0-1.8h2.335c.4-1.437 1.703-2.5 3.265-2.5zm0 1.8c-.882 0-1.6.718-1.6 1.6 0 .882.718 1.6 1.6 1.6.882 0 1.6-.718 1.6-1.6 0-.882-.718-1.6-1.6-1.6zm6.801-11.2c1.562 0 2.866 1.063 3.265 2.5h2.335a.9.9 0 0 1 0 1.8h-2.335c-.399 1.436-1.703 2.5-3.265 2.5s-2.866-1.064-3.265-2.5H1.001a.9.9 0 1 1 0-1.8h9.135c.399-1.437 1.703-2.5 3.265-2.5zm0 1.8c-.882 0-1.6.718-1.6 1.6 0 .882.718 1.6 1.6 1.6.882 0 1.6-.718 1.6-1.6 0-.882-.718-1.6-1.6-1.6z" fill="#1e1d29" fill-rule="evenodd"></path>
				</svg>
			</button>
		</div>
	</section>
	<section id="historyList">
	</section>
	<div id="myModal" class="modal" >
		<div class="modal-content">
			<!-- 후기글 작성 폼 -->
			<form class="mb-3" name="myform" id="myform">
				<fieldset>
					<span class="text-bold">별점을 선택해주세요</span>
					<div id="starRating">
						<input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
						<input type="radio" name="reviewStar" value="4" id="rate2"><label for="rate2">★</label>
						<input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
						<input type="radio" name="reviewStar" value="2" id="rate4"><label for="rate4">★</label>
						<input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
					</div>
				</fieldset>
				<div>
					<textarea type="text" id="reviewContents" name="comment" placeholder="리뷰를 남겨주세요!!"></textarea>
				</div>
				<button class="commentBtn" id="comment-sendBtn" type="button">등록</button>
				<button class="cancelBtn" id="cancelBtn" type="button">취소</button>
			</form>
		</div>
	</div>
</div>
</body>
<script>
	// 세션id 변수로 선언
	let ur_id = "${loginId}";

	// 선택된 별점 값 담을 변수
	let selectedStar;

	// 판매자 ID
	let seller_id;

	// 판매글 no
	let no;

	// 별점 클릭시 변수에 값 담기
	$("input[name='reviewStar']").on("click", function() {
		var clickedStar = $(this).val(); // 클릭된 별점 값

		// 클릭한 별점이 이미 선택된 경우
		if ($(this).is(":checked")) {
			// 선택된 별점과 이전에 선택된 별점이 같은 경우
			if (clickedStar === selectedStar) {
				// 이전에 선택된 별점을 취소하여 0점으로 설정
				$(this).prop("checked", false);
				selectedStar = 0;
			} else {
				// 클릭한 별점 값으로 설정
				selectedStar = clickedStar;
			}
		} else {
			// 선택되지 않은 경우는 0점으로 설정
			selectedStar = 0;
		}
		// 선택된 별점 값을 콘솔에 출력하여 확인
		alert("선택된 별점 값: " + selectedStar);
	});

	// 모달 창
	var modal = document.getElementById("myModal");

	// 모달 창을 닫는 함수
	function closeModal() {
		modal.style.display = "none";
	}

	// 취소 버튼 기능 추가
	var cancelBtn = document.getElementById("cancelBtn");
	cancelBtn.onclick = function() {
		closeModal();
	}

	let addZero = function(value=1){
		return value > 9 ? value : "0"+value;
	}

	let dateToString = function(ms=0) {
		let date = new Date(ms);

		let yyyy = date.getFullYear();
		let mm = addZero(date.getMonth() + 1);
		let dd = addZero(date.getDate());

		let HH = addZero(date.getHours());
		let MM = addZero(date.getMinutes());
		let ss = addZero(date.getSeconds());

		return yyyy+"."+mm+"."+dd;
	}

	// 내역 목록 보여주기
	let showList = function (page = 1, pageSize = 5, option = 'seller', sal_s_cd = '',keyword= '') {
		$.ajax({
			type: 'POST',       // 요청 메서드
			url: "/myPage/saleHistorys",  // 요청 URI
			headers: {"content-type": "application/json"}, // 요청 헤더
			dataType: 'json',
			data: JSON.stringify({
				ur_id: ur_id,
				page: page,
				pageSize: pageSize,
				option: option,
				sal_s_cd: sal_s_cd,
				keyword: keyword
			}),
			success: function (result) {
				// 내역 목록과 페이징 정보 가져오기
				let list = result.list;
				let ph = result.ph;
				$("#historyList").html(toHtml(list, ph,option,sal_s_cd,keyword));
			},
			error: function (result) {
				alert(result.responseText);
			} // 에러가 발생했을 때, 호출될 함수
		}); // $.ajax()
	}

	let toHtml = function (list,ph,option,sal_s_cd,keyword) {
		let tmp = "";

		list.forEach(function (item) {
			tmp += '<article>';

			// header 부분 생성
			tmp += '<header>';
			tmp += '<h3>' + dateToString(item.r_date) + '</h3>';
			tmp += '<svg width="12" height="12" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" role="img">';
			tmp += '<path d="M5.262 19.536a.9.9 0 0 0 1.273 0l9-8.974a.905.905 0 0 0 .265-.636.904.904 0 0 0-.263-.637l-9-9.024a.9.9 0 1 0-1.275 1.27l8.365 8.388-8.363 8.34a.9.9 0 0 0-.002 1.273" fill="#7f7f7f" fill-rule="evenodd"></path>';
			tmp += '</svg>';
			tmp += '</header>';

			// divider 추가
			tmp += '<hr class="bun-ui-divider">';

			// section 부분 생성
			tmp += '<section>';
			tmp += '<p>판매상태(R-예약중/S-판매중/C-거래완료) : ' + item.sal_s_cd + '</p>';
			tmp += '<p>판매글번호 : ' + item.no + '</p>';
			tmp += '<section>';
			tmp += '<!-- 여기에 이미지가 들어갑니다. -->';
			tmp += '<section>';
			tmp += '<p>가격: ' + item.price + '</p>';
			tmp += '<p>제목: ' + item.title + '</p>';
			tmp += '<p>판매(S)/나눔(F) : '+item.tx_s_cd+' / 거래방법: ' + item.trade_s_cd_1 + '</p>';
			tmp += '</section>';
			tmp += '</section>';
			tmp += '</section>';

			// footer 부분 생성
			if (item.rv_state === 'Y' && option === 'buyer' && item.sal_s_cd === 'C') {
				tmp += '<footer>'; // 구매내역 버튼이 클릭된 경우에만 hidden 속성 추가하지 않음
			} else {
				tmp += '<footer hidden>'; // 그 외의 경우 hidden 속성 추가
			}
			tmp += '<button class="writeBtn" type="button" data-id="' + item.seller_id + '"  data-no="' + item.no + '">후기 남기기</button>';
			tmp += '</footer>';

			tmp += '</article>';
		});
		// 페이지 링크 추가
		if (ph) {
			tmp += '<div class="pageContainer" style="text-align:center">';
			if (ph.totalCnt == null || ph.totalCnt == 0) {
				tmp += '<div>내역이 없습니다.</div>';
			}
			if (ph.totalCnt != null && ph.totalCnt != 0) {
				if (ph.prevPage) {
					tmp += '<a href="#" onclick="showList(' + (ph.beginPage - 1) + ', ' + ph.pageSize + ', \'' + option + '\', \'' + sal_s_cd + '\', \'' + keyword + '\')">&lt;</a>';
				}
				for (let i = ph.beginPage; i <= ph.endPage; i++) {
					// 페이지 번호 사이에 공백 추가
					tmp += '<span class="page-space"></span>';
					tmp += '<a class="page ' + (i == ph.page ? "paging-active" : "") + '" href="#" onclick="showList(' + i + ', ' + ph.pageSize + ', \'' + option + '\', \'' + sal_s_cd + '\', \'' + keyword + '\')">' + i + '</a>';
				}
				if (ph.nextPage) {
					tmp += '<span class="page-space"></span>';
					tmp += '<a href="#" onclick="showList(' + (ph.endPage + 1) + ', ' + ph.pageSize + ', \'' + option + '\', \'' + sal_s_cd + '\', \'' + keyword + '\')">&gt;</a>';
				}
			}
			tmp += '</div>';
		}
		return tmp;
	}

	$(document).ready(function(){
		showList();
		modal.style.display = "none"; // 모달창 숨기기
		let option = $('#seller').hasClass('bun-ui-tab-selected') ? 'seller' : 'buyer';
		updateButtonLabels(option);

		// 판매내역, 구매내역 버튼 클릭 이벤트 설정
		$(".bun-ui-divider .bun-ui-tab").click(function () {
			// 같은 div 내의 모든 버튼에서 bun-ui-tab-selected 클래스를 제거
			$(".bun-ui-divider .bun-ui-tab").removeClass("bun-ui-tab-selected");
			// 클릭한 버튼에 bun-ui-tab-selected 클래스 추가
			$(this).addClass("bun-ui-tab-selected");

			// searchInput 값을 초기화
			$("#searchInput").val('');

			// '전체' 버튼에 bun-ui-tab-selected 클래스 추가
			$("#A").addClass("bun-ui-tab-selected");
			$("#R").removeClass("bun-ui-tab-selected");
			$("#S").removeClass("bun-ui-tab-selected");
			$("#C").removeClass("bun-ui-tab-selected");

			// 내역 목록 업데이트
			let option = $(this).attr('id');
			showList(1, 5, option);

			// 버튼 레이블 업데이트
			updateButtonLabels(option);
		});

		// 판매,구매상태 버튼 클릭 이벤트 설정
		$(".purchase-info .bun-ui-tab").click(function () {
			// 같은 div 내의 모든 버튼에서 bun-ui-tab-selected 클래스를 제거
			$(".purchase-info .bun-ui-tab").removeClass("bun-ui-tab-selected");
			// 클릭한 버튼에 bun-ui-tab-selected 클래스 추가
			$(this).addClass("bun-ui-tab-selected");

			let id = $(this).attr('id');
			let option = $('#seller').hasClass('bun-ui-tab-selected') ? 'seller' : 'buyer';
			let searchValue = $("#searchInput").val();

			updateButtonLabels(option);

			if (id === 'R') {
				showList(1, 5, option, 'R', searchValue);
			} else if (id === 'S') {
				showList(1, 5, option, 'S', searchValue);
			} else if (id === 'C') {
				showList(1, 5, option, 'C', searchValue);
			} else {
				showList(1, 5, option, '', searchValue);
			}
		});

		function updateButtonLabels(option) {
			const buttons = $(".purchase-info .bun-ui-tab");
			buttons.each(function() {
				const button = $(this);
				const label = option === 'buyer' ? button.attr('data-label-buyer') : button.attr('data-label-seller');
				button.find('.bun-ui-tab-label').text(label);
			});
		}

		$("#searchForm").submit(function (event) {
			event.preventDefault();
			let searchValue = $("#searchInput").val();
			let option = $('#seller').hasClass('bun-ui-tab-selected') ? 'seller' : 'buyer';
			let sal_s_cd = $(".purchase-info .bun-ui-tab.bun-ui-tab-selected").attr('id');
			if (sal_s_cd === 'A') {
				showList(1, 5, option, '', searchValue);
			} else {
				showList(1, 5, option, sal_s_cd, searchValue);
			}
		});

		// 후기글 쓰기 버튼 클릭 이벤트 설정
		$(document).on("click", ".writeBtn", function() {
			seller_id = $(this).data("id");
			no = $(this).data("no");
			$('#reviewContents').val('');
			$("input[name='reviewStar']").prop("checked", false);
			selectedStar = undefined;
			modal.style.display = "block";
		});

		// 후기글 전송 버튼
		$(document).on("click", "#comment-sendBtn", function() {
			let contents = $("#reviewContents").val();

			if(contents.trim()==''){
				alert("글을 작성해주세요");
				$("#reviewContents").focus()
				return;
			}

			$.ajax({
				type: 'POST',
				url: "/comments?no=" + no,
				headers: { "content-type": "application/json" },
				data: JSON.stringify({ sal_id: seller_id, contents: contents, reviewStar: selectedStar }),
				success: function(result) {
					alert(result);
					const url = "/myPage/main?ur_id=" + encodeURIComponent(seller_id);
					window.location.href = url;
				},
				error: function(result) {
					alert(result.responseText);
				}
			});
		});
	});
</script>
</html>
