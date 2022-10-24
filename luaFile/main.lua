
GameStates = {Menu = 0,Game = 1,HowTo = 2, Exit = 3}



Ball = {}
Rectangle ={}
ButtonMenuHow = {}
ButtonMenuPlay ={}
Circle = {}
Ball.x = 5
Ball.y = 5
Ball.radius = 20
Ball.gravity =256

Rectangle.x= 0
Rectangle.y= 0
Rectangle.width = 50
Rectangle.height = 50

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
function love.load()
	
end
function love.update()

	
if love.keyboard.isDown("right") then
	Rectangle.x= Rectangle.x+ 1 * love.timer.getDelta() * 400
end

if love.keyboard.isDown("up") then
	Rectangle.y= Rectangle.y- 1 * love.timer.getDelta() * 400
end

if love.keyboard.isDown("down") then
	Rectangle.y= Rectangle.y+ 1 * love.timer.getDelta() * 400
end

if love.keyboard.isDown("left") then
	Rectangle.x= Rectangle.x- 1 * love.timer.getDelta() * 400
end


if state == GameStates.Exit then
love.event.quit()
end


 menuLogic()


 if Ball.y < love.graphics.getHeight() then
Ball.y = Ball.y + Ball.gravity*love.timer.getDelta()
end



end

function love.keypressed(key)
	
	if  key == "space" then
		Ball.gravity = Ball.gravity*-1
	else
		Ball.gravity = math.abs(Ball.gravity)
	end
end
function love.load()


end
function love.draw()
	love.graphics.setBackgroundColor(1,1,0.5)
	love.graphics.setColor(1,0,0)
	
	love.graphics.rectangle("fill", Rectangle.x, Rectangle.y, Rectangle.width,Rectangle.height );
	
	drawMenu()
	
	love.graphics.setColor(1,1,1) 
	love.graphics.circle("fill",love.mouse.getX(),love.mouse.getY(),5)
	love.graphics.setColor(0,1,0) 
	love.graphics.circle("fill",Ball.x,Ball.y,Ball.radius)
end
function drawMenu()

    if state == GameStates.Menu then
		love.graphics.print('Menu', 400, 300,0,2)
		love.graphics.setColor(ButtonMenuPlay.color)
		love.graphics.rectangle("fill", ButtonMenuPlay.x, ButtonMenuPlay.y, ButtonMenuPlay.width,ButtonMenuPlay.height );
		love.graphics.setColor(ButtonMenuHow.color)
		love.graphics.rectangle("fill", ButtonMenuHow.x, ButtonMenuHow.y, ButtonMenuHow.width,ButtonMenuHow.height );
	elseif state == GameStates.Game then
		love.graphics.print('Game!', 400, 300)
		love.graphics.setColor(ButtonMenuHow.color)
		love.graphics.rectangle("fill", Rectangle.x, Rectangle.y, Rectangle.width,Rectangle.height );

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
		end
	else
		ButtonMenuPlay.color = {0,0,0}
	end
	
    if checkRecMouseCollision(ButtonMenuHow.x,ButtonMenuHow.y ,ButtonMenuHow.width, ButtonMenuHow.height) then
		ButtonMenuHow.color = {1,0,0}
		if  love.mouse.isDown(1) then
				state = GameStates.Game
		end
	else
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
function checkBallRecCollision(ball, rectangle)
	if ball.x < rectangle.leftEdge then
		testX = rectangle.leftEdge
	elseif ball.x > rectangle.rightEdge then
		testX = rectangle.rightEdge
	end
	if ball.y < rectangle.downEdge then
		testY = rectangle.upEdge
	elseif ball.y > rectangle.upEdge then
		testY = rectangle.downEdge
	end

     distanceX = ball.x - testX
     distanceY = ball.y - testY
	 distance = math.sqrt((distanceX * distanceX) + (distanceY * distanceY))

	if distance <= ball.radius then
		return true;
	else
		return false;
	end
end


