
			  $(".menu-click").toggle(function(){
			    $(".menu-bar").css("right","5%");
			    $(".right-bar").css("background","#EA0082");
				$(".right-bar").css("display","block");
				$(".right-bar").css("top","0px");},
			    function(){
			    $(".right-bar").css("background","0");
			    $(".menu-bar").css("right","-50%");
				$(".right-bar").css("display","inline-block");
			}),



				$(window).scroll(function () {
			        var scrollVal = $(this).scrollTop();
			        $("span.qScrollTop").text(scrollVal);
			        /* console.log(scrollVal); */
			        if(1239 > scrollVal && scrollVal >422){
			        	$(".left-bar").css("color","white");
			        	$(".right-bar").css("color","white");
			        	$('.dot').removeClass("dot-pink");
						$('#activity-area').addClass("dot-pink");

			        }else if(1981 >scrollVal && scrollVal > 1240){
			        	$(".right-bar").css("color","black");



			        }else if(2499 >scrollVal && scrollVal > 1981 ){
			        	$(".left-bar").css("color","black");

			        	$('.dot').removeClass("dot-pink");
						$('#funds-area').addClass("dot-pink");

			        }
			        else if(9999 > scrollVal && scrollVal > 2530){
			        	$(".left-bar").css("color","white");
			        	$(".right-bar").css("color","white");

			        	$('.dot').removeClass("dot-pink");
						$('#movie-area').addClass("dot-pink");

			        }
			        else{
			        	$(".left-bar").css("color","black");
			        	$(".right-bar").css("color","black");



			        	$('.dot').removeClass("dot-pink");
						$('#home-area').addClass("dot-pink");
			        }
			        
			    });

			    //點dot移動畫面

			    $("#home-area").click(function(){
			    	$('html,body').animate({ scrollTop: 0 }, 'fast'); 
			    });
			     $("#activity-area").click(function(){
			    	$('html,body').animate({ scrollTop: 860 }, 'fast'); 
			    });
			      $("#funds-area").click(function(){
			    	$('html,body').animate({ scrollTop: 1671 }, 'fast'); 
			    });
			       $("#movie-area").click(function(){
			    	$('html,body').animate({ scrollTop: 3027 }, 'fast'); 
			    });


			$(".pictures").mouseover(function(){
				$(".pictures").addClass("dark");
			
				$('#test1').mouseover(function() {
					$('.pictures').removeClass("light");
					 $(this).addClass("light");
				});
				$('#test2').mouseover(function() {
					$('.pictures').removeClass("light");
					$(this).addClass("light");	
				}); 
				$('#test3').mouseover(function() {
					$('.pictures').removeClass("light");
					$(this).addClass("light");
				});
				$('#test4').mouseover(function() {
					$('.pictures').removeClass("light");
					$(this).addClass("light");
				});
				$('#test5').mouseover(function() {
					$('.pictures').removeClass("light");
					$(this).addClass("light");
				});
				$('#test6').mouseover(function() {
					$('.pictures').removeClass("light");
					$(this).addClass("light");
				});
			});

			// 移出照片區時(mouseout) 去掉所有移入時加入的dark
			$(".pictures").mouseout(function(){
				$(".pictures").removeClass("dark");
			});



			var x = $(".right-bar .goToMid").html();
			console.log("x  = " + x);

