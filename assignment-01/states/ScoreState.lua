--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--this is where we access our images for the medals
local gold_medal_image = love.graphics.newImage('gold_medal.png')
local silver_medal_image = love.graphics.newImage('silver_medal.png')
local bronze_medal_image = love.graphics.newImage('bronze_medal.png')


--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    -- This is where we try to award medals for the player based on their score
    if self.score >= 5 and self.score <= 10 then
        love.graphics.draw(bronze_medal_image, 240, 132, 0, 0.3, 0.3)
        love.graphics.printf('You have won a bronze medal!', 0, 120, VIRTUAL_WIDTH, 'center')
    end
    if self.score >= 11 and self.score <= 20 then
        love.graphics.draw(silver_medal_image, 240, 132, 0, 0.3, 0.3)
        love.graphics.printf('You have won a silver medal!', 0, 120, VIRTUAL_WIDTH, 'center')
    end
    if self.score >= 21 then
        love.graphics.draw(gold_medal_image, 240, 132, 0, 0.3, 0.3)
        love.graphics.printf('You have won a gold medal!', 0, 120, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('or press esc to exit the game :D', 0, 175, VIRTUAL_WIDTH, 'center')
end