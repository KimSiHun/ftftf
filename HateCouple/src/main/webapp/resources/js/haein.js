/**
 * 영화관 지도 스크립트랍니당~
 */
$(document).ready(function() {
		$("button").click(function(){
			var dongName = $("#dongName").val();
			
			var url = "https://apis.daum.net/local/geo/addr2coord?apikey=085c621120828d233c8a25e9eee763e8&q="+dongName+"&output=json";
			
			// Ajax 프로젝트 외부 못가져옴(브라우저 동일 출처 정책)		
			// XML : 자바로 받아서 다시뿌림(프록시 서버)
			// JSON : 프록시 서버, 서버(다음)에서 JSONP를 적용해놨으면 가능
			// {} x
			// JSONP : Json with padding
			// ({}) 가능 javascript 함수모양으로
			$.getJSON(url+"&callback=?", function(json){
				$("ul").empty();
				
				var items = json.channel.item;
				$.each(items, function(i, it){
					var lat = it.lat;
					var lng = it.lng;
					
					var pos = lat+","+lng;		
					// 지도
					
					// 검색쿼리용				
					var url2="https://apis.daum.net/local/v1/search/keyword.json?apikey=085c621120828d233c8a25e9eee763e8&q&query=CGV영화관&location="+pos+"&radius=2000";
					$.getJSON(url2+"&callback=?",function(json2){
		    		   var items2 = json2.channel.item;
//		   			   var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						
//		   			   var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
//		   			   var options = { //지도를 생성할 때 필요한 기본 옵션
//		   					   center: new daum.maps.LatLng(pos), //지도의 중심좌표.
//		   					   level: 10 //지도의 레벨(확대, 축소 정도)
//		   			   };
//		   			   var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		   			   
		   			   var cgvList = [];
		   			   var cgv = "CGV";
						$.each(items2,function(i,it2){
													   
//							    // 마커 이미지의 이미지 크기 입니다
//						   var imageSize = new daum.maps.Size(24, 35); 
//							    
//							    // 마커 이미지를 생성합니다    
//						   var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
//							    
//							    // 마커를 생성합니다
//						   var marker = new daum.maps.Marker({
//							   map: map, // 마커를 표시할 지도
//							   position: new daum.maps.LatLng(it2.latitude, it2.longitude), // 마커를 표시할 위치
//							   title : it2.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
//							   image : markerImage // 마커 이미지 
//							});

							 							
							if (it2.title.indexOf(cgv) != -1) {
								cgvList.push(it2.title);
							}
							alert(cgvList);
						
			
							
 							var br = $("<br>");
							var br2 = $("<br>");
							var li = $("<li></li>").append(it2.title);
							// ,br,it2.newAddress,br2,it2.phone
							$("ul").append(li);
											
						});
						//$("ul").listview("refresh");
					});
					
				});
				
				//$("ul").listview("refresh");
				
			});
			
			$("#dongName").val("");
		
		});
	});