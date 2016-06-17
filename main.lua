io.stdout:setvbuf("no") _Version = "0.0.1 B0" _State = "WIP"
if os.getenv('DEBUG_MODE') then require('debugger')() ; end--require('debugger.plugins.ffi') end

--love.filesystem.write("DumpTest.lua",string.dump(love.filesystem.load("/Libs/Levels/Dev.lua")))

local GameSetup = require("Engine.SetupGame")
local Gamestate = require("Helpers.hump.gamestate")
local Splash = require("States.Splash")

function love.load(args)
  GameSetup:init()
  
  love.graphics.setBackgroundColor(250,250,250)
  
  Gamestate.registerEvents()
  Gamestate.switch(Splash)
end

function love.update(dt)
  
end

function love.draw()
  
end

function love.mousepressed(x,y,button,istouch)
  
end

function love.mousereleased(x,y,button,istouch)
  
end

function love.keypressed(key,isrepeat)
  
end

function love.keyreleased(key)
  
end

function love.textinput(text)
  
end

function love.threaderror(thread, errorstr)
  error("Thread error!\n"..errorstr)
  -- thread:getError() will return the same error string now.
end
