local path = nil
local recording = false

function a()
if recording == false then
recording = true
outputChatBox("true")
if fileExists("save.txt") then
path = fileOpen("save.txt")
outputChatBox("event started")
addEventHandler("onClientRender", getRootElement(), record)
else
path = fileCreate("save.txt")
removeEventHandler("onClientRender", getRootElement(), record)
outputChatBox("event removed")
end
else
fileClose(path)
outputChatBox("false")
removeEventHandler("onClientRender", getRootElement(), record)
recording = false
end
end
bindKey("F5", "down", a)

function record()
local x, y, z = getElementPosition(localPlayer)
if recording then
fileWrite(path, ""..x..", "..y..", "..z.."")
else
end
end








--// The .txt file will save in the client mods folder