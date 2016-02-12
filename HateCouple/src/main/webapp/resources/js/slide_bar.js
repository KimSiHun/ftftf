

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
				 
	$.each(json.movies, function(i, mv){		
		
		var img = $('<img/>').attr('src', mv.c_poster_img).attr('alt', mv.c_movie_title).css({'width' : '100%' , 'height' : '100%'});
		
		var link = $('<a></a>').attr('href',"http://www.google.com").append(img);
		
		var li = $('<li></li>').append(link);
		
		var ul = $('<ul></ul>').append(li);
		
		$('.vis_frame').append(ul);			
	
		});
		
	 });
		
	});	
});

