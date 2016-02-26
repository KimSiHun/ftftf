
$(document).ready(function() {
		//정보표시 구역(두번째)으로 이동
		$("#go").click(function() {
			var addr = document.getElementById('sample6_address').value;
			document.getElementById('search_addr').value = addr;
			var dongaddr = document.getElementById('sample6_address').value;
			
			$("#fst").slideUp("slow");						
			
			var url = "https://apis.daum.net/local/geo/addr2coord?apikey=085c621120828d233c8a25e9eee763e8&q="+addr+"&output=json";
			// 좌표 구하기
			$.getJSON(url+"&callback=?", function(json){
				// 초기화시 리스트 비움.
				$("ul").empty();
								
				var items = json.channel.item;
				// 좌표를 검색형태로 가공
				$.each(items, function(i, it){
					var lat = it.lat;
					var lng = it.lng;
					
					var pos = lat+","+lng;
					// 가공된 좌표, 검색질의로 해당 질의에 답 구하기.
					var url2="https://apis.daum.net/local/v1/search/keyword.json?apikey=085c621120828d233c8a25e9eee763e8&q&query=CGV영화관&location="+pos+"&radius=2000";
					$.getJSON(url2+"&callback=?",function(json2){
						var items2 = json2.channel.item;
						// 해당 json value로 li에 붙이기 . -> 영화관 이름만
						$.each(items2,function(i,it2){
							
							// list에 영화관 이름 붙이기. 상위 ul
							var li = $('<li class = "theaterNameLI"></li>').append(it2.title);
							$('#theaterNameUL').append(li);
						});						
						
						// mapAndList.jsp의 <ul><li></li><ul> 속의 영화관지점명의 값을 빼내고 json객체 생성
						  thNameJsonObj = [];						  
						    $(".theaterNameLI").each(function() {
						        var thName = $(this).text();
						        
						       // CGV만 빼내기
						        if ( thName.indexOf('CGV') !== -1 ) {
						          console.log('CGV', thName);  
						       // 공백 없애기
						          thName = thName.replace(/\s+/g, '');
							        item = {}
							        item ["c_theaterName"] = thName;	
							        thNameJsonObj.push(item);
						        } 						       
						    });
						    console.log(JSON.stringify(thNameJsonObj));					
						    
						    // thNameJsonObj을 홈컨트롤러로 보내기 위한 ajax 매서드
							$.ajax({
								url : 'abc',								
								method : "post", 
								dataType : 'json',
								data :JSON.stringify(thNameJsonObj), 
								processData : true /*querySTring make false*/,
								contentType : "application/json; charset=UTF-8",
								success : function(data, stat, xhr) {
									  var poster = [];         
		                              // 유니크값을 뽑아내기 위한 반복메서드
		                              $.each(data, function(c_posterName, value){         
		                                 if($.inArray(value.c_posterName, poster)== -1 ){            
		                                    poster.push(value.c_posterName);
		                                 }      
		                              });            
		                              // 위의 poster변수를 posters 변수에 저장
		                              var posters = poster;                  
		                              
		                              // json형식으로 다시 가공하여 var posterUrl = [];에 저장
		                              var posterUrl = [];            
		                              // posters의 유니크 배열값들을 다시 json형식으로 가공
		                              $.each(posters, function (index, value) {  
		                                  var img = value;     
		                                      item = {}
		                                      item ["c_posterName"] = img;              
		                                      posterUrl.push(item);                
		                              });      
		                              // json으로 제대로 만들어 졌는지 콘솔에서 확인
		                             // console.log(JSON.stringify(posterUrl));  
		                         
		                              $.each(posterUrl, function(i, mv){ 
		                                 
		                                    var img = $('<img/>').attr('src', mv.c_posterName);
		                                    
		                                    $.each(img, function(i, mv){ 
		                                    var link = $('<a></a>').attr('href', "#").append(img);
		                                    var span = $('<span></span>').append(link);
		                                    $('#slide_banner').append(span);
		                                    
		                                    // 각각 img 태그에 아이디 부여 img0~xx이런 식으로
		                                    var $giveImgID = $("#slide_banner img");
		         		                   $giveImgID.attr('id', function (index) {
		         		                       return 'img' + index;
		         		                   });
		         		                   // 각각 a 태그에 아이디 부여 link0~xx이런 식으로
		         		                  var $giveaID = $("#slide_banner a");
		         		                  $giveaID.attr('id', function (index){
		       		                	   return 'link' + index;
		       		                   });		          
		                             });             		           		                                    
		                            });
		                           // 이미지 클릭 시 각 고유 이미지주소를 가져오기 위한 코드
		                              $(function(){
		                            	  
	                		                $("img[id^='img'").click(function() {  
	                		                    var getImgLink =$(this).attr("src");
	                		                    
	                		                    
	                		                    $.ajax({
	                		                        url: 'zxcv',
	                		                        data: { 'c_posterName' : getImgLink},
	                		                        type: "post",
	                		                        cache: false,
	                		                        success: function (data, stat, xhr) {                		                        	
	                		                        	
	                		                        	 $.each(data, function(i, mv){
	                                                         
	                                                         var theaterTitle = $("<td></td>").text(mv.c_theaterName);
	                                                         var movieTitle = $("<td></td>").text(mv.c_movieName);
	                                                         var movieTime = $("<td></td>").text(mv.c_movieTime);
	                                                         var clearChair = $("<td></td>").text(mv.c_clearChair);
	                                                         var tr =$('<tr></tr>').append(theaterTitle,movieTitle,movieTime,clearChair);
	                                                         $("#Tb").append(tr).css("width","500px");   
	                                                      });
	                		                        },
	                		                        error: function (xhr, stat, err) {
	                		                        	alert("error");
	                							    	console.log(err);
	                		                        }
	                		                    });
	      		                   
		                		              });
	                		                
	                		               
	      		                           });  
	      		             
		                              
	                                    var mySlider = $( '#slide_banner' ).bxSlider( {
	                                  	   mode: 'horizontal',// 가로 방향 수평 슬라이드
	                                  	   speed: 500,        // 이동 속도를 설정
	                                  	   pager: false,      // 현재 위치 페이징 표시 여부 설정
	                                  	   moveSlides: 1,     // 슬라이드 이동시 개수
	                                  	   slideWidth: 100,   // 슬라이드 너비
	                                  	   minSlides: 4,      // 최소 노출 개수
	                                  	   maxSlides: 4,      // 최대 노출 개수
	                                  	   slideMargin: 5,    // 슬라이드간의 간격
	                                  	   auto: true,        // 자동 실행 여부
	                                  	   autoHover: true,   // 마우스 호버시 정지 여부
	                                  	   controls: false    // 이전 다음 버튼 노출 여부
	                                  	  } );

	                                  //이전 버튼을 클릭하면 이전 슬라이드로 전환
	                                  $('#prevBtn').on('click', function() {
	                                     mySlider.goToPrevSlide(); //이전 슬라이드 배너로 이동
	                                     //<a>에 링크 차단
	                                  });

	                                  //다음 버튼을 클릭하면 다음 슬라이드로 전환
	                                  $('#nextBtn').on('click', function() {
	                                     mySlider.goToNextSlide(); //다음 슬라이드 배너로 이동

	                                  }); 
								},
								error : function(xhr, stat, err) {
							    	alert("error");
							    	console.log(err);
							    }
							});
					});
					
				});
				
			});
			
			
		});		
		// 최초 구역으로 이동 - 기존 주소창 비우기
		$("#back").click(function() {
			$("#sample6_address").val(" ");
			$("#fst").slideDown("slow");
		});
	});	
//	//마우스 스크롤 금지
//	$(document)
//		.on("mousewheel.disableScroll DOMMouseScroll.disableScroll touchmove.disableScroll",
//			function(e) {
//				e.preventDefault();
//				return;
//			});
	//키보드로 이동 금지
	$(document).on("keydown.disableScroll", function(e) {
		var eventKeyArray = [ 32, 33, 34, 35, 36, 37, 38, 39, 40 ];
		for (var i = 0; i < eventKeyArray.length; i++) {
			if (e.keyCode === eventKeyArray[i]) {
				e.preventDefault();
				return;
			}
		}
	});
	
	function realtimeClock() {
		document.rtcForm.rtcInput.value = getTimeStamp();
		setTimeout("realtimeClock()", 1000);
	}

	function getTimeStamp() { // 24시간제
		var d = new Date();
		var s = leadingZeros(d.getFullYear(), 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate(), 2) + ' ' +

				leadingZeros(d.getHours(), 2) + ':'
				+ leadingZeros(d.getMinutes(), 2) + ':'
				+ leadingZeros(d.getSeconds(), 2);
		return s;
	}

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();
		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}