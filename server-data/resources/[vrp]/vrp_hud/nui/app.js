$(document).ready(function(){
	window.addEventListener("message",function(event){
		if (event.data.hud == true){
			$("#hudDisplay").fadeIn(1000);
		}

		if (event.data.hud == false){
			$("#hudDisplay").fadeOut(1000);
		}

		if (event.data.movie == true){
			$("#movieTop").fadeIn(1000);
			$("#movieBottom").fadeIn(1000);
		}

		if (event.data.movie == false){
			$("#movieTop").fadeOut(1000);
			$("#movieBottom").fadeOut(1000);
		}

		if (event.data.hud == true){
			$(".infosBack").html(event.data.radio +"<b>"+ event.data.day +"</b> - <b>"+ event.data.month +"</b>  - <b>"+ event.data.street);

			if (event.data.voice == 1){
				$(".voiceDisplay1").css("display","none");
				$(".voiceDisplay2").css("display","none");
				$(".voiceDisplay3").css("display","block");
			}

			if (event.data.voice == 2){
				$(".voiceDisplay1").css("display","none");
				$(".voiceDisplay2").css("display","block");
				$(".voiceDisplay3").css("display","block");
			}

			if (event.data.voice == 3){
				$(".voiceDisplay1").css("display","block");
				$(".voiceDisplay2").css("display","block");
				$(".voiceDisplay3").css("display","block");
			}

			if (event.data.health <= 1){
				$(".healthDisplay").css("width","0");
			} else {
				$(".healthDisplay").css("width",event.data.health +"%");
			}

			if (event.data.armour == 0){
				$(".armourBack").fadeOut(1000);
			} else {
				$(".armourBack").fadeIn(1000);
				$(".armourDisplay").css("width",event.data.armour +"%");
			}

			$(".thirstDisplay").css("width",100-event.data.sede +"%");
			$(".hungerDisplay").css("width",100-event.data.fome +"%");
			$(".stressDisplay").css("width",event.data.stress +"%");
			$(".staminaDisplay").css("width",100-event.data.stamina +"%");
			$(".clockBack .hudDisplayText").html(event.data.hour +":"+ event.data.minute);

			if (event.data.car == true){
				var mph = event.data.seatbelt == true ? "<s>MPH</s>":"<b>MPH</b>"
				var fuel = event.data.fuel <= 20 ? "<red>"+ event.data.fuel +"</red>":event.data.fuel
				$("#carDisplay").html("<b>F</b>"+ fuel +"  "+ mph + event.data.speed).fadeIn(1000);
			} else {
				$("#carDisplay").fadeOut(1000);
			}
		}
	})
});