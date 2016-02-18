
foo = function() {
	$(".vis_frame_content").append("<h1> append </h1>");
}

$(document).ready(function(){
	
	  var eleWidth = $(".vis_frame ul li").innerWidth();
      var state = false;
      var playOn = false;
      var direction = "left";
      var time = 2000;
      var bannerAuto;
      function play() {
         if (!playOn) {
            playOn = true;
            bannerAuto = setInterval(function() {
               if (direction == "left") {
                  $(".left").click();
               } else {
                  $(".right").click();
               }
            }, time);
         }
      }
      function stop() {
         if (playOn) {
            playOn = false;
            clearInterval(bannerAuto);
         }
      }
      function left() {
         stop();
         direction = "left";
         $(".vis_frame > ul").animate(
               {
                  left : eleWidth * -1
               },
               300,
               "swing",
               function() {
                  $(this).children("li:first").insertAfter(
                        $(this).children("li:last"));
                  $(this).css({
                     left : 0
                  });
                  state = false;
                  play();
               });
      }
      function right() {
         stop();
         direction = "right";
         $(".vis_frame > ul > li:last").insertBefore(
               $(".vis_frame > ul > li:first"));
         $(".vis_frame > ul").css({
            left : eleWidth * -1
         });
         $(".vis_frame > ul").animate({
            left : 0
         }, 300, "swing", function() {
            state = false;
            play();
         });
      }
      $(".left").click(function() {
         if (!state) {
            state = true;
            left();
         }
      });
      $(".right").click(function() {
         if (!state) {
            state = true;
            right();
         }
      });
      $(".stop").click(function() {
         stop();
      });
      $(".play").click(function() {
         play();
      });
      $(".play").click();
	
	
	$.getJSON("getMV", function(json){
		// json객체 -> String		
		//alert( JSON.stringify(json)  );
			
		$('#get').click(function(){
			 $(".vis_frame").empty();
			 
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
					var img = $('<img/>').attr('src', mv.uniquePoster).attr('alt', mv.c_movie_title).css({'width' : '100%' , 'height' : '100%'});
					var link = $('<a></a>').attr('href', "#").append(img);
					var li = $('<li class ="poster"></li>').append(link);
					var ul = $('<ul></ul>').append(li);		
					$('.vis_frame').append(ul);					
					});					
	 });
		
		
		   $("#Bt").click(function(){
			   $("#Tb").empty();
	       $.each(json.movies, function(i, s) {               
       
               var title = $('<td></td>').text(s.c_name);
               var loc = $('<td></td>').text(s.c_cine_location);
               var time = $('<td></td>').text(s.c_begin_time);
               var seat = $('<td></td>').text(s.c_clearSeat);
               
               var tr =$('<tr></tr>').append(title, loc, time, seat);
               
               $("#Tb").append(tr).css("width","400px");           
              });   		
		   });
	});	
});



   
   

