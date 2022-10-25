
GameStates = {Menu = 0,Game = 1,HowTo = 2, Exit = 3}


Ball = {}
Rectangle ={}
Flappy ={}
ButtonMenuHow = {}
ButtonMenuPlay ={}
Circle = {}

Rectangle.x= 0
Rectangle.y= 0
Rectangle.width = 100
Rectangle.height = 400

Flappy.x= 100
Flappy.y= 400
Flappy.width = 55
Flappy.height = 45
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


ButtonMenuHow.width = 50
ButtonMenuHow.x= 400 - ButtonMenuHow.width/2
ButtonMenuHow.y= 400
ButtonMenuHow.height = 30
ButtonMenuHow.color = {0,0,0}

ButtonMenuPlay.width = 50
ButtonMenuPlay.x= 400 - ButtonMenuPlay.width/2
ButtonMenuPlay.y= 200
ButtonMenuPlay.height = 30
ButtonMenuPlay.color ={0,0,0}

Circle.x=0
Circle.y=0
Circle.radius=50
state = GameStates.Menu
function love.load()
	
end
function love.update()

	

if state == GameStates.Exit then
love.event.quit()
end


 menuLogic()

FlappyMovement()

logicPipe()

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
	resetGame()
 end

end

function love.keypressed(key)
	
	 if  key == "space" then
		Flappy.gravity = Flappy.gravity*-1
	 end
end
function resetGame()

	Flappy.x= 100
	Flappy.y= 400
	Flappy.width = 55
	Flappy.height = 45
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
	love.graphics.setColor(1,1,1)
	love.graphics.rectangle("fill", 0, 0, 200,80)
	love.graphics.setColor(0,0,0)
	love.graphics.print('Score:' .. math.floor(Flappy.score), 0, 0)
end

function drawMenu()

    if state == GameStates.Menu then
		love.graphics.print('Menu', 400, 300,0,2)
		love.graphics.setColor(ButtonMenuPlay.color)
		love.graphics.rectangle("fill", ButtonMenuPlay.x, ButtonMenuPlay.y, ButtonMenuPlay.width,ButtonMenuPlay.height );
		love.graphics.setColor(ButtonMenuHow.color)
		love.graphics.rectangle("fill", ButtonMenuHow.x, ButtonMenuHow.y, ButtonMenuHow.width,ButtonMenuHow.height );
	elseif state == GameStates.Game then
		love.graphics.setColor(1, 181/255,22/255)
		love.graphics.rectangle("fill", Flappy.x, Flappy.y, Flappy.width,Flappy.height )
		love.graphics.setColor(1,1,1) 
		love.graphics.circle("fill",love.mouse.getX(),love.mouse.getY(),5)
		drawPipe()

	elseif state == GameStates.HowTo then
	love.graphics.print('Rules!', 400, 300)
	elseif state == GameStates.exit then
	love.graphics.print('ByeBye!', 400, 300)
	end
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


