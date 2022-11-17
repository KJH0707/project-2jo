/**
 * 
 */
 var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
		
	    //console.log(location);
	    //console.log(document.getElementById('address223').value);
	    
	    // 주소로 좌표를 검색합니다
	    geocoder.addressSearch(document.getElementById('address223').value, function(result, status) {

	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {

	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	            // 결과값으로 받은 위치를 마커로 표시합니다
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords
	            });

	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            map.setCenter(coords);
	        	 //console.log('성공');
	
	         }else{
	        	// console.log('실패');
	         } 
	       
	    });  