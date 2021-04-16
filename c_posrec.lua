local path = nil
local recording = false

function a()
    if recording == false then
        recording = true
        outputChatBox("Starting...")
        if fileExists("save.txt") then
            path = fileOpen("save.txt")
            outputChatBox("The script began to write the coordinates")
            outputChatBox("Press 'F5' again if you want to stop")
            addEventHandler("onClientRender", getRootElement(), record)
        else
            path = fileCreate("save.txt")
            removeEventHandler("onClientRender", getRootElement(), record)
            outputChatBox("The script no longer writes the coordinates")
        end
    else
        fileClose(path)
        outputChatBox("Stopped")
        removeEventHandler("onClientRender", getRootElement(), record)
        recording = false
        end
    end
    bindKey("F5", "down", a)

    function record()
        local x, y, z = getElementPosition(localPlayer)
        if recording then
            fileWrite(path, "\n"..x..","..y..","..z.."")
        else
        end
        end