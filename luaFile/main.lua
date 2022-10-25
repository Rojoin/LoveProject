
GameStates = {Menu = 0,Game = 1,HowTo = 2, Exit = 3, Lose = 4}


Ball = {}
Rectangle ={}
Flappy ={}
ButtonMenuHow = {}
ButtonMenuPlay ={}
ButtonMenuExit ={}
Circle = {}
ButtonMenuBack ={}


Flappy.x= 100
Flappy.y= 400
Flappy.width = 45
Flappy.height = 55
Flappy.gravity = 256
Flappy.isAlive = true
Flappy.score = 0
recUp1 = {}

recUp1.x= 900
recUp1.y= 500
recUp1.width= 100
recUp1.height= 450
recUp1.color = {0,0,1}

recUp2 = {}
recUp2.x= 400
recUp2.y= 500
recUp2.width= 100
recUp2.height= 450
recUp2.color = {0,0,1}

recBottom1       = {}
recBottom1.x     = 900
recBottom1.y     = -100
recBottom1.width = 100
recBottom1.height= 450
recBottom1.color = {0,0,1}

recBottom2 = {}
recBottom2.x=       400
recBottom2.y=      -100
recBottom2.width=   100
recBottom2.height=  450
recBottom2.color = {0,0,1}


ButtonMenuHow.width = 80
ButtonMenuHow.x= 400 - ButtonMenuHow.width/2
ButtonMenuHow.y= 400
ButtonMenuHow.height = 50
ButtonMenuHow.color = {0,0,0}

ButtonMenuPlay.width = 80
ButtonMenuPlay.x= 400 - ButtonMenuPlay.width/2
ButtonMenuPlay.y= 300
ButtonMenuPlay.height = 50
ButtonMenuPlay.color ={0,0,0}

ButtonMenuExit.width = 80
ButtonMenuExit.x= 400 - ButtonMenuExit.width/2
ButtonMenuExit.y= 500
ButtonMenuExit.height = 50
ButtonMenuExit.color ={0,0,0}

ButtonMenuBack.width = 80
ButtonMenuBack.x= 50- ButtonMenuBack.width/2
ButtonMenuBack.y= 550
ButtonMenuBack.height = 50
ButtonMenuBack.color ={0,0,0}



Circle.x=0
Circle.y=0
Circle.radius=50
state = GameStates.Menu

function love.update()



if state == GameStates.Menu then
	menuLogic()
elseif state == GameStates.Game then
	GameLogic()
elseif state == GameStates.HowTo then
	HowToLogic()
elseif state == GameStates.Lose then
	EndLogic()
elseif state == GameStates.Exit then
love.event.quit()
end




end
function EndLogic()
	if checkRecMouseCollision(ButtonMenuBack.x ,ButtonMenuBack.y ,ButtonMenuBack.width, ButtonMenuBack.height) then
		ButtonMenuBack.color = {1,0,0}
		if  love.mouse.isDown(1) then
			state = GameStates.Menu
		end
	else
		ButtonMenuBack.color = {0,0,0}
	end
end
function HowToLogic()
	if checkRecMouseCollision(ButtonMenuBack.x ,ButtonMenuBack.y ,ButtonMenuBack.width, ButtonMenuBack.height) then
		ButtonMenuBack.color = {1,0,0}
		if  love.mouse.isDown(1) then
			state = GameStates.Menu
		end
	else
		ButtonMenuBack.color = {0,0,0}
	end
end

function GameLogic()
	


	FlappyMovement()
	
	logicPipe()
	

end

function FlappyMovement()
if Flappy.isAlive then
	Flappy.y = Flappy.y + Flappy.gravity*love.timer.getDelta()
	Flappy.score =Flappy.score + 1 *love.timer.getDelta()
	if Flappy.y+Flappy.height < 0 then
		Flappy.isAlive = false
	end
	if Flappy.y+Flappy.height  >love.graphics.getHeight() then
		Flappy.isAlive = false
	end
	
else
	state = GameStates.Lose
 end

end

function love.keypressed(key)
	
	 if  key == "space" and state == GameStates.Game then
		Flappy.gravity = Flappy.gravity*-1
	 end
	 if  key == "escape" then
		state = GameStates.Menu
	 end
	 if  key == "r" and state == GameStates.Lose then
		resetGame()
		state = GameStates.Game
	 end
end
function resetGame()

	Flappy.x= 100
	Flappy.y= 400
	Flappy.width = 45
	Flappy.height = 55
	Flappy.gravity = 256
	Flappy.isAlive = true
	Flappy.score = 0
    recUp1.x= 900
    recUp1.y= 500
    recUp1.width= 100
    recUp1.height= 450
    recUp1.color = {0,0,1}

	recUp2.x= 400
    recUp2.y= 500
    recUp2.width= 100
    recUp2.height= 450
    recUp2.color = {0,0,1}
    
    recBottom1.x     = 900
    recBottom1.y     = -100
    recBottom1.width = 100
    recBottom1.height= 450
    recBottom1.color = {0,0,1}

    recBottom2.x=       400
    recBottom2.y=      -100
    recBottom2.width=   100
    recBottom2.height=  450
    recBottom2.color = {0,0,1}


end
function love.load()
resetGame()
rules =love.graphics.newImage("/resources/menuFlappy.png")
flappy=love.graphics.newImage("/resources/Crab.png")
endGame=love.graphics.newImage("/resources/endFlappy.png")
tittle=love.graphics.newImage("/resources/tittleFlappy.png")
end
function love.draw()
	love.graphics.setBackgroundColor(1,1,0.5)
	drawMenu()

	
end

function logicPipe()
	
if checkRecRecCollision(recBottom1,Flappy) then
recBottom1.color = {1,0,0}
Flappy.isAlive = false
end
if checkRecRecCollision(recBottom2,Flappy) then
	recBottom2.color = {1,0,0}
	Flappy.isAlive = false
	
end
if checkRecRecCollision(recUp1,Flappy) then
	recUp1.color = {1,0,0}
	Flappy.isAlive = false
	
end
if checkRecRecCollision(recUp2,Flappy) then
	recUp2.color = {1,0,0}
	Flappy.isAlive = false
	
end
	
	recBottom1.x = recBottom1.x - 200 *love.timer.getDelta()
	recBottom2.x = recBottom2.x - 200 *love.timer.getDelta()
	recUp1.x = recUp1.x - 200 *love.timer.getDelta()
	recUp2.x = recUp2.x - 200 *love.timer.getDelta()

    randomNumber = love.math.random(100, 300)

	if recBottom1.x + recBottom1.width and recUp1.x+ recUp1.width < 0 then
		recBottom1.x = 800
		recUp1.x = 800
		recUp1.y = 500 -randomNumber
		recBottom1.y = -100 -randomNumber

	end
	if recUp2.x+ recUp2.width < 0 and recBottom2.x+ recBottom2.width then
		recUp2.x = 800
		recBottom2.x = 800
		recUp2.y = 500 -randomNumber
		recBottom2.y = -100 -randomNumber
	end


end 
function drawPipe()
	love.graphics.setColor(recUp1.color)
	love.graphics.rectangle("fill", recUp1.x, recUp1.y, recUp1.width,recUp1.height)
	love.graphics.setColor(recUp2.color)
	love.graphics.rectangle("fill", recUp2.x, recUp2.y, recUp2.width,recUp2.height)
	love.graphics.setColor(recBottom1.color)
	love.graphics.rectangle("fill", recBottom1.x, recBottom1.y, recBottom1.width,recBottom1.height)
	love.graphics.setColor(recBottom2.color)
	love.graphics.rectangle("fill", recBottom2.x, recBottom2.y, recBottom2.width,recBottom2.height)
	love.graphics.setColor(0,0,0)
	love.graphics.print('Score:' .. math.floor(Flappy.score), 0, 0)
end

function drawEndGame()

	love.graphics.setColor(1,1,1) 
	love.graphics.draw(endGame,185,100,0)
	love.graphics.setColor(0,0,0)
	love.graphics.print('Score:' .. math.floor(Flappy.score), 325, 200,0,5,5)
	love.graphics.setColor(ButtonMenuBack.color)
		love.graphics.rectangle("fill", ButtonMenuBack.x, ButtonMenuBack.y, ButtonMenuBack.width,ButtonMenuBack.height );
	love.graphics.setColor(1,1,1)
	love.graphics.print('    Back', ButtonMenuBack.x, ButtonMenuBack.y+ButtonMenuBack.height/2)

end



function drawMenu()

    if state == GameStates.Menu then
		love.graphics.setColor(1,1,1)
		love.graphics.draw(tittle,200, 50)
		love.graphics.setColor(ButtonMenuPlay.color)
		love.graphics.rectangle("fill", ButtonMenuPlay.x, ButtonMenuPlay.y, ButtonMenuPlay.width,ButtonMenuPlay.height);
		love.graphics.setColor(1,1,1)
		love.graphics.print('    Play', ButtonMenuPlay.x, ButtonMenuPlay.y+ButtonMenuPlay.height/2)
		love.graphics.setColor(ButtonMenuHow.color)
		love.graphics.rectangle("fill", ButtonMenuHow.x, ButtonMenuHow.y, ButtonMenuHow.width,ButtonMenuHow.height );
		love.graphics.setColor(1,1,1)
		love.graphics.print('    HowTo', ButtonMenuHow.x, ButtonMenuHow.y+ButtonMenuHow.height/2)
		love.graphics.setColor(ButtonMenuExit.color)
		love.graphics.rectangle("fill", ButtonMenuExit.x, ButtonMenuExit.y, ButtonMenuExit.width,ButtonMenuExit.height );
		love.graphics.setColor(1,1,1)
		love.graphics.print('    Exit', ButtonMenuExit.x, ButtonMenuExit.y+ButtonMenuExit.height/2)
	elseif state == GameStates.Game then

	
		love.graphics.setColor(1,1,1)
		love.graphics.draw(flappy,Flappy.x, Flappy.y)
		drawPipe()
		
	elseif state == GameStates.HowTo then
		love.graphics.setColor(1,1,1) 
		love.graphics.draw(rules,185,100,0)
		love.graphics.setColor(ButtonMenuBack.color)
		love.graphics.rectangle("fill", ButtonMenuBack.x, ButtonMenuBack.y, ButtonMenuBack.width,ButtonMenuBack.height );
		love.graphics.setColor(1,1,1)
		love.graphics.print('    Back', ButtonMenuBack.x, ButtonMenuBack.y+ButtonMenuBack.height/2)
	elseif state == GameStates.Lose then
		drawEndGame()
	
		
	elseif state == GameStates.exit then
		love.graphics.print('ByeBye!', 400, 300)
	end
	love.graphics.setColor(0,0,0) 
love.graphics.print('Game Made by Ignacio "Rojoin " Arrastua', 550, 585)
end

function menuLogic()
	if checkRecMouseCollision(ButtonMenuPlay.x ,ButtonMenuPlay.y ,ButtonMenuPlay.width, ButtonMenuPlay.height) then
		ButtonMenuPlay.color = {1,0,0}
		if  love.mouse.isDown(1) then
			state = GameStates.Game
			resetGame()
		end
	else
		ButtonMenuPlay.color = {0,0,0}
	end
	
    if checkRecMouseCollision(ButtonMenuHow.x,ButtonMenuHow.y ,ButtonMenuHow.width, ButtonMenuHow.height) then
		ButtonMenuHow.color = {1,0,0}
		if  love.mouse.isDown(1) then
				state = GameStates.HowTo
		end
	else
		ButtonMenuHow.color = {0,0,0}
	end
    if checkRecMouseCollision(ButtonMenuExit.x,ButtonMenuExit.y ,ButtonMenuExit.width, ButtonMenuExit.height) then
		ButtonMenuExit.color = {1,0,0}
		if  love.mouse.isDown(1) then
				state = GameStates.Exit
		end
	else
		ButtonMenuExit.color = {0,0,0}
	end
	

	end

function checkRecMouseCollision(x,y,width,height)

	mouse = {}
	mouse.x, mouse.y = love.mouse.getPosition()
    rightEdge = x + width 
    leftEdge  = x 
    upEdge    = y  
    downEdge  = y + height

if (mouse.x >= leftEdge and mouse.x <= rightEdge and mouse.y >= upEdge and mouse.y <= downEdge) then
	return true
else
	return false
	end
end
function checkRecRecCollision(rec1,rec2)
	
	if rec1.x + rec1.width >= rec2.x and rec1.x <= rec2.x + rec2.width  and   rec1.y + rec1.height  >= rec2.y  and rec1.y <= rec2.y + rec2.height   then
	  return true
else
	return false 
end

end

function checkBallRecCollision(ball, rectangle)

	testX = 0
	testY = 0
    rightEdge = rectangle.x + rectangle.width 
    leftEdge  = rectangle.x 
    upEdge    = rectangle.y  
    downEdge  = rectangle.y + rectangle.height

	if ball.x < leftEdge then
		testX = leftEdge
	elseif ball.x > rightEdge then
		testX = rightEdge
	end
	if ball.y > downEdge then
		testY = downEdge

	elseif ball.y < upEdge then
		testY = upEdge
	end

     distanceX = ball.x - testX
     distanceY = ball.y - testY
	 distance = math.sqrt((distanceX * distanceX) + (distanceY * distanceY))

	if   distance <= ball.radius then
		return true;
	else
		return false;
	end
end


