         Functions List
==============
### ToolBar:
*     imgui.BeginMainMenuBar()
```lua
if imgui.BeginMainMenuBar() then
   --Code
   imgui.EndMainMenuBar()
end
```

### Menu:
* imgui.BeginMenu(name)
```lua
if imgui.BeginMenu("Test") then
   --Code
   imgui.EndMenu()
end
```

* imgui.MenuItem(name,nil,checked)
```lua
if imgui.MenuItem("test",nil,true) then
   --OnClick Code
end
```

### Style:
* imgui.PushStyleColor(name,r,g,b,a)
```lua
imgui.PushStyleColor("TitleBgActive",0.01,0.66,0.96,0.87) --Uses float values: 1 -> 255, 0 -> 0
```
