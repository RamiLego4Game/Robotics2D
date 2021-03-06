local BumpDebug = require("Helpers.bump_debug")
local Gamestate = require("Helpers.hump.gamestate")
local Gamera = require("Helpers.gamera")
local Tweens = require("Helpers.tween")
local Bump = require("Helpers.bump")

local Map = require("Engine.Map")
local TiledCompiler = require("Engine.TiledCompiler")

local DevPlay = {}

function DevPlay:init()
  --self.fadingTime = 0.5
  --self.showTime = 1
end

function DevPlay:enter(prev,skiptween)
  love.graphics.setBackgroundColor(75,75,75,255)

  --local mdata = TiledCompiler:compileTiled("/Tiled/Test.lua","/TiledCompileTest.lua")

  self.Map = Map(mdata)
  --[[local Map = _Maps["Level1"] Map.bump = Bump.newWorld(16) Map:robotics_init(Map.bump)
  self.camera = Gamera.new(0,0,Map.width*Map.tilewidth,Map.height*Map.tileheight)
  self.camera:setPosition((Map.width*Map.tilewidth)/2, (Map.height*Map.tileheight)/2)
  self.camera:setScale(2.0)]]
  self.camera = Gamera.new(0,0,self.Map.Width*self.Map.Tilesize,self.Map.Height*self.Map.Tilesize)
  self.camera:setPosition((self.Map.Width*self.Map.Tilesize)/2, (self.Map.Height*self.Map.Tilesize)/2)
  self.camera:setScale(2.0)

  self.alpha = {255}
  self.tween = Tweens.new(skiptween and 0.001 or self.fadingTime,self.alpha,{0})
end

function DevPlay:draw()
  --self.Map:draw()
  self.camera:draw(function()
    self.Map:draw()
  end)

  --LoveGlass:draw()

  love.graphics.setColor(0,0,0,self.alpha[1])
  love.graphics.rectangle("fill",0,0,_Width,_Height)
end

function DevPlay:debugBump(world)
  for k, rect in pairs(world.rects) do--.rects[item] = {x=x,y=y,w=w,h=h})
    love.graphics.setColor(255,0,0,50)
    love.graphics.rectangle("fill",rect.x,rect.y,rect.w,rect.h)
    love.graphics.setColor(255,0,0,75)
    love.graphics.setLineStyle("rough") love.graphics.setLineWidth(1)
    love.graphics.rectangle("line",rect.x,rect.y,rect.w,rect.h)
  end
end

function DevPlay:update(dt)
  self.Map:update(dt)
  self.tween:update(dt)
end

function DevPlay:keyreleased()
  local DPlay = require("States.DevPlay")
  Gamestate.switch(DPlay,true)
end

function DevPlay:leave()

end

return DevPlay
