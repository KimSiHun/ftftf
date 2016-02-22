$(document).ready(function(){	      

		 $.getJSON("getMV", function(json){
		      // json객체 -> String      
		      //alert( JSON.stringify(json));		      
		        //  $("").empty();
		          
		          // 유니크 값을 var poster = []; 여기에 저장
		          var poster = [];         
		            // 유니크값을 뽑아내기 위한 반복메서드
		            $.each(json.movies, function(index, value){         
		               if($.inArray(value.c_poster_img, poster)== -1 ){            
		                  poster.push(value.c_poster_img);
		               }      
		            });            
		            // 위의 poster변수를 posters 변수에 저장
		            var posters = poster;		            
		            
		            // json형식으로 다시 가공하여 var posterUrl = [];에 저장
		            var posterUrl = [];            
		            // posters의 유니크 배열값들을 다시 json형식으로 가공
		            $.each(posters, function (index, value)  
		                         {  
		                var img = value;     
		                    item = {}
		                    item ["uniquePoster"] = img;              
		                    posterUrl.push(item);                
		                         });      
		            // json으로 제대로 만들어 졌는지 콘솔에서 확인
		            console.log(JSON.stringify(posterUrl));   

		            // posterUrl에서 이미지주소를 슬라이드에 넣어주는 메소드
		            $.each(posterUrl, function(i, mv){               
		               var img = $('<img/>').attr('src', mv.uniquePoster).css({'width' : '100px' , 'height' : '100px'});
		               
		               $.each(img, function(i, mv){      
		               var link = $('<a></a>').attr('class', "imgfile").append(img);
		               var pdiv = $('<div class ="poster" style="display:inline;"></div>').append(link);
		                   $('#slideDiv').append(pdiv);
		                   
		                   // 각 요소마다 id 값을 id+숫자(0~x) 식으로 부여할 수 있는 코드
		                   var $giveImgID = $("#slideDiv img");
		                   $giveImgID.attr('id', function (index) {
		                       return 'img' + index;
		                   });		                   
		                   var $giveaID = $("#slideDiv a");
		                   $giveaID.attr('id', function (index){
		                	   return 'link' + index;
		                   });		          
		           		});  
		            });   
		            
		            // 이미지 클릭 시 각 고유 이미지주소를 가져오기 위한 코드
		            $(function(){
		                $("img[id^='img'").click(function() {
		                    var getImgLink =$(this).attr("src");
		                    
		                    console.log(getImgLink);
		                });
		            });


//		            $('[id^=link]','#slideDiv').click(function(){	
//		            	 alert('click');
//		            	 $("#Tb").empty();         
//		            });
//		            
		            
		            // 상단 포스터 클릭 시 하단 테이블에 정보 출력가능하게 하는 클릭 이벤트
//		               $(".imgfile").click(function(){
//		            	   $("#Tb").empty();
//		                $.each(json.movies, function(i, s){	                	
//		                     var title = $('<td></td>').text(s.c_name);
//		                     var loc = $('<td></td>').text(s.c_cine_location);
//		                     var time = $('<td></td>').text(s.c_begin_time);
//		                     var seat = $('<td></td>').text(s.c_clearSeat);		                     
//		                     var tr =$('<tr></tr>').append(title, loc, time, seat);		                     
//		                     $("#Tb").append(tr).css("width","400px");           
//		                    });         
//		               });  

		 });
});		

