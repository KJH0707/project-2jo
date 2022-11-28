<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Fork and Knife | Admin</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="./assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/libs/css/style.css">
    <link rel="stylesheet" href="./assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
</head>

<body>
    <div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa2ed31d007cce419a977e2e07a834f5&libraries=services"></script>
	<script>
		var container = document.getElementById('map');
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 
			};
		
		var map = new kakao.maps.Map(container, mapOption);
		var geocoder = new kakao.maps.services.Geocoder();
		
		geocoder.addressSearch('${param.loc}', function(result, status) {
			 if (status === kakao.maps.services.Status.OK) {
				 var juso = new kakao.maps.LatLng(result[0].y, result[0].x);
				 
				 var marker = new kakao.maps.Marker({
					    map: map,
					    position: juso
				});
				marker.setTitle('${param.name}');
				var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${param.name}</div>'
		        });
				infowindow.open(map, marker);
				 map.setCenter(juso);
			 }
			 else {
				 map.setCenter(new kakao.maps.LatLng(33.450701, 126.570667));
				 var marker = new kakao.maps.Marker({
					    map: map,
					    position: new kakao.maps.LatLng(33.450701, 126.570667)
				});
				 marker.setTitle('${param.name}');
				 var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${param.name}</div>'
			        });
					infowindow.open(map, marker);
			 }
			
			
		});
	</script>
</body>
 
</html>