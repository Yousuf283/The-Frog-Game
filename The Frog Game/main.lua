love.window.setTitle("The Frog Game - By Yousuf Ahmed")

function love.load()
	--Event Triggers
	MenuActive = false
	GuideActive = false
  GameActive = false
	GameComplete = true
	--Load In Assets
	Font = love.graphics.newFont('Fonts/Berlin Sans FB Demi Bold.ttf', 45)
	SizeTwentyFive = love.graphics.setNewFont(25)
	MenuBackground = love.graphics.newImage('Images/MenuBackground.png')
  FrogLeft = love.graphics.newImage('Images/FrogLookingLeft.png')
  FrogRight = love.graphics.newImage('Images/FrogLookingRight.png')
	Log = love.graphics.newImage('Images/Log.png')
	--Tables
	ColourStart = {0,0,0,1}
	ColourMenu = {0,0,0,1}
	ColorGuide = {0,0,0,1}
	ColourQuit = {0,0,0,1}
  wildlife = {'t','t','t',' ','f','f','f'}
  Positions = {{30,200}, {135,300}, {240,200}, {345,300}, {450,200},{555,300},{660,200},{765,300}}
	EndState = {'f','f','f',' ','t','t','t'}
  NumberInputs = {'1','2','3','4','5','6','7'}
  --Input Variables
	Selected = ''
  Vacant = '4'
end

function Quit()
	love.event.quit()
end

function Reset()
  wildlife = {'t','t','t',' ','f','f','f'}
  Vacant = 4
  Selected = ' '
end

function Movements(a,b)
  if not tonumber(a) then
		love.window.showMessageBox( 'Error', 'Please Select A Frog To Move', 'info', false )
  end
  if tonumber(a) then
    c = tonumber(a)
    d = tonumber(b)
    difference = c - d
    local function Swap()
      wildlife[c],wildlife[d] = wildlife[d],wildlife[c]
      Vacant = c
    end
    if wildlife[c] == ' ' then end
    if difference <= 2 and difference >= -2 then
    if c < d and wildlife[c] == 't' then
      Swap()
    end
    if c > d and wildlife[c] == 'f' then
      Swap()
    end
    if c > d and wildlife[c] == 't' then
      love.window.showMessageBox( 'Error', 'Frog Cannot Move In This Direction', 'info', false )
    end
    if c < d and wildlife[c] == 'f' then
      love.window.showMessageBox( 'Error', 'Frog Cannot Move In This Direction', 'info', false )
    end
  end
    Selected = ' '
  end
end

function love.keypressed(key)
	if key == 'escape' then
		Quit()
	end
  if GameActive then
    for i = 1,7,1 do
      if key == NumberInputs[i] then
        Selected = NumberInputs[i]
      end
    end
    if key == 'return' then
      Movements(Selected,Vacant)
    end
    if key == 'r' then
      Reset()
    end
    if key == 'backspace' then
      Selected = ' '
    end
  end
end

function love.update()
	MouseX = love.mouse.getX()
  MouseY = love.mouse.getY()
	if wildlife[1] == 'f' and wildlife[2] == 'f' and wildlife[3] == 'f' and wildlife[4] == ' ' and wildlife[5] == 't'and wildlife[6] == 't' and wildlife[7] == 't' then
		GameActive = false
		GameComplete = true
		Reset()
	end
	if MenuActive then
		if MouseX >= 50 and MouseX <= 278 and MouseY >= 429 and MouseY <= 473 then
		ColourStart[1] = 1
		ColourStart[2] = 1
		ColourStart[3] = 1
		else
		ColourStart[1] = 0
		ColourStart[2] = 0
		ColourStart[3] = 0
		end
		if MouseX >= 50 and MouseX <= 300 and MouseY >= 478 and MouseY <= 516 then
		ColorGuide[1] = 1
		ColorGuide[2] = 1
		ColorGuide[3] = 1
		else
		ColorGuide[1] = 0
		ColorGuide[2] = 0
		ColorGuide[3] = 0
		end
		if MouseX >= 50 and MouseX <= 142 and MouseY >= 522 and MouseY <= 560 then
		ColourQuit[1] = 240/255
		ColourQuit[2] = 0 
		ColourQuit[3] = 0
		else
		ColourQuit[1] = 0
		ColourQuit[2] = 0
		ColourQuit[3] = 0
		end
	end
	if GuideActive then
		if MouseX >= 62 and MouseX <= 172 and MouseY >= 483 and MouseY <= 519 then
			ColourMenu[1] = 1
			ColourMenu[2] = 1
			ColourMenu[3] = 1
		else
			ColourMenu[1] = 0
			ColourMenu[2] = 0
			ColourMenu[3] = 0
		end
		if MouseX >= 251 and MouseX <= 479 and MouseY >= 480 and MouseY <= 515 then
			ColourStart[1] = 1
			ColourStart[2] = 1
			ColourStart[3] = 1
		else
			ColourStart[1] = 0
			ColourStart[2] = 0
			ColourStart[3] = 0
		end
	end
	if GameActive then
		if MouseX >= 53 and MouseX <= 163 and MouseY >= 457 and MouseY <= 490 then
			ColourMenu[1] = 1
			ColourMenu[2] = 1
			ColourMenu[3] = 1
		else
			ColourMenu[1] = 0
			ColourMenu[2] = 0
			ColourMenu[3] = 0
		end
	end
	if GameComplete then
		if MouseX >= 152 and MouseX <= 262 and MouseY >= 410 and MouseY <= 444 then
			ColourMenu[1] = 1
			ColourMenu[2] = 1
			ColourMenu[3] = 1
		else
			ColourMenu[1] = 0
			ColourMenu[2] = 0
			ColourMenu[3] = 0
		end
		if MouseX >= 552 and MouseX <= 642 and MouseY >= 410 and MouseY <= 446 then
			ColourQuit[1] = 240/255
			ColourQuit[2] = 0
			ColourQuit[3] = 0
		else
			ColourQuit[1] = 0
			ColourQuit[2] = 0
			ColourQuit[3] = 0
		end
	end
end

function love.mousepressed(x, y, button)
	if button == 1 then
		if MenuActive then
			if ColourStart[1] == 1 then
				MenuActive = false
				GameActive = true
			end
			if ColorGuide[1] ~= 0 then
				MenuActive = false
				GuideActive = true
				GameActive = false
			end
			if MouseX >= 50 and MouseX <= 142 and MouseY >= 522 and MouseY <= 560 then
				Quit()
			end
		end
		if GuideActive then
			if MouseX >= 62 and MouseX <= 172 and MouseY >= 483 and MouseY <= 519 then
				GuideActive = false
				MenuActive = true
			end
			if MouseX >= 251 and MouseX <= 479 and MouseY >= 480 and MouseY <= 515 then
				GuideActive = false
				GameActive = true 
			end
		end
		if GameActive then
			if MouseX >= 53 and MouseX <= 163 and MouseY >= 457 and MouseY <= 490 then
				GameActive = false
				MenuActive = true
			end
		end
		if GameComplete then
			if MouseX >= 152 and MouseX <= 262 and MouseY >= 410 and MouseY <= 444 then
				GameComplete = false
				MenuActive = true
			end
			if MouseX >= 552 and MouseX <= 642 and MouseY >= 410 and MouseY <= 446 then
				Quit()
			end
		end
	end
end

function love.draw()
  love.graphics.setFont(Font)
	if MenuActive then
		love.graphics.draw(MenuBackground)
		
		love.graphics.setColor(ColourStart[1],ColourStart[2],ColourStart[3],ColourStart[4])
		love.graphics.print("Start Game", 50, 425)

		love.graphics.setColor(ColorGuide[1],ColorGuide[2],ColorGuide[3],ColorGuide[4])
		love.graphics.print("How To Play", 50, 470)

		love.graphics.setColor(ColourQuit[1],ColourQuit[2],ColourQuit[3],ColourQuit[4])
		love.graphics.print("Quit",50, 515)

		love.graphics.setColor(1,1,1,1)
	end
	if GuideActive then
		love.graphics.setBackgroundColor(39/255,144/255,165/255,1)
		love.graphics.setColor(0,0,0,1)
		love.graphics.print("Welcome To The Frog Game",120 ,10)
		love.graphics.setColor(1,1,1,0.5)
		love.graphics.rectangle("fill", 50,80,600,150,20,20,30)
		love.graphics.setColor(0,0,0,1)
		love.graphics.print("Rules:", 60, 80)
		love.graphics.setFont(SizeTwentyFive)		
		local text = [[

		-Frogs Cannot Move Backwards
		-Frogs Can Jump A Maxium Of 2 Spots
		]]
		love.graphics.print(text,0,120)
		love.graphics.setColor(1,1,1,0.5)
		love.graphics.rectangle("fill", 50,250,600,200,20,20,30)
		love.graphics.setFont(Font)
		love.graphics.setColor(0,0,0,1)
		love.graphics.print("Useful Keys:", 60, 250)
		love.graphics.setFont(SizeTwentyFive)
		local Speech = [[
		
		-"R" Restarts The Game
		-"Backspace" Clears Your Input
		-Number Keys 1-7 Are Used For Input
		-"Enter" Key Is Used To Submit Your Selection
		]]
		love.graphics.print(Speech, 0,290)
		love.graphics.setFont(Font)
		love.graphics.setColor(ColourMenu[1],ColourMenu[2],ColourMenu[3],ColourMenu[4])
		love.graphics.print("Menu", 60,475)
		love.graphics.setColor(ColourStart[1],ColourStart[2],ColourStart[3],ColourStart[4])
		love.graphics.print("Start Game", 250,475)
		love.graphics.setColor(1,1,1,1)
	end
  if GameActive then
		love.graphics.setBackgroundColor(39/255,144/255,165/255,1)
		love.graphics.setColor(0,0,0,1)
    love.graphics.print("Selected: "..Selected,300,450)
    love.graphics.print("Vacant: "..Vacant,300,500)
		love.graphics.setColor(ColourMenu[1],ColourMenu[2],ColourMenu[3],ColourMenu[4])
		love.graphics.print("Menu",50,450)
		love.graphics.setColor(1,1,1,1)
		for i = 1,7,1 do 
			love.graphics.draw(Log,Positions[i][1]-25,Positions[i][2]+20)
		end
		for i = 1,7,1 do
			love.graphics.print(NumberInputs[i],Positions[i][1]+40,Positions[i][2]+100)
		end
    for i = 1,7,1 do
      if wildlife[i] == 't' then
        love.graphics.draw(FrogRight,Positions[i][1],Positions[i][2])
      end
      if wildlife[i] == 'f' then
        love.graphics.draw(FrogLeft,Positions[i][1],Positions[i][2])
      end
    end
  end
	if GameComplete then
		love.graphics.setBackgroundColor(39/255,144/255,165/255,1)
		love.graphics.setColor(0,0,0,1)
		local text = [[
			Congratulations,
				You Have Completed
					The Frog Game]]
		love.graphics.print(text,0,50)
		love.graphics.setColor(ColourMenu[1],ColourMenu[2],ColourMenu[3],ColourMenu[4])
		love.graphics.print("Menu",150,400)
		love.graphics.setColor(ColourQuit[1],ColourQuit[2],ColourQuit[3],ColourQuit[4])
		love.graphics.print("Quit",550,400)
		love.graphics.setColor(1,1,1,1)
	end
end	