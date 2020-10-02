--[[
    Pause state feature

    Author: Matheus Pimentel Leal
    matheusp.eng@gmail.com

    The PauseState class is where we freeze our game entities when a specific key is hit by the player,
    Here we keep control over the bird's, the pipe's and the background's position on the screen at the
    time that the player had paused the game.
]]

PauseState = Class{__includes = BaseState}

function PauseState:init()
    --Initializing function of our Pause State
    
    --Declaring variables and importing classes
    self.bird = Bird()
    self.pipePairs = {}
end

function PauseState:Enter()
    --Enter funcition of our Pause State
    --This runs when we enter in our Pause State
end

function PauseState:Update()
    --Update function of our Pause State
    --Runs in every frame that the Pause State is active
    
    --Pipe logic
    PIPE_SPEED = 0
    --background + ground logic
    BACKGROUND_SCROLL_SPEED = 0
    GROUND_SCROOL_SPEED = 0
    --bird logic
end

function PauseState:Render()
    --Render function of our Pause State
    --Used to render images and texts into the screen while the Pause State is active
    love.graphics.setFont(flappyFont)
    love.graphics.printf('The Game is Paused. Press "P" to unpause.')

end

function PauseState:Exit()
    --End function of our Pause State
    --Runs whenever we exit our Pause State
end