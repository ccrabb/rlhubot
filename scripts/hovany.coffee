# Description:
#   Hovany Lunch Timer

module.exports = (robot) ->

	robot.respond /hovany lunch alarm$/i, (msg) ->
		lunchOptions = [
			"Jersey Mikes",
			"Jersey Mikes :D",
			"Jersey Mikes?",
			"Genki Grill!",
			"--JACKPOT-- McDonalds!!!!! --JACKPOT--",
			"Genki Grill",
			"Genki Grill",
			"Genki Grill!",
			"Genki Grill",
			"Genki Grill?",
			"Genki Grill"
		];
		today  = new Date();
		alarmTime = new Date(today.getFullYear(), today.getMonth(), today.getDate(), 18, 40, 0, 0);
		
		sendMessage = (message) ->
			msg.send message
		
		determineLocation = () ->			
			msg.send lunchOptions[Math.floor(Math.random()*11)];			
		
		lunchTime = () -> 			
			setTimeout (() -> 
				msg.send "It's lunch time Hovany!";
				setTimeout (() -> 
					msg.send "Might I suggest that today you go to...";
					setTimeout(determineLocation, 3000);
					), 2000;
				), 2000;			
		
		checkTime = () ->
			if alarmTime.getDay() > 0 and alarmTime.getDay() < 6
				if new Date() > alarmTime
					lunchTime();
					alarmTime = new Date(today.getFullYear(), today.getMonth(), today.getDate()+1, 11, 45, 0, 0);
				setTimeout(checkTime, 6000);
			
		
		setTimeout(checkTime, 6000);

