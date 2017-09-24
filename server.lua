trainspawned = false
PlayerCount = 0
list = {}


RegisterServerEvent("hardcap:playerActivated")
RegisterServerEvent("playerDropped")

function ActivateTrain ()
	if (PlayerCount) == 1 and not trainspawned then
		TriggerClientEvent('StartTrain', GetHostId())
		trainspawned = true
	else
		SetTimeout(15000,ActivateTrain)
		if (PlayerCount) == 0 then
			trainspawned = false
		end
	end
end
--snippet from hardcap to make PlayerCount work

-- yes i know i'm lazy
AddEventHandler('hardcap:playerActivated', function()
  if not list[source] then
    PlayerCount = PlayerCount + 1
    list[source] = true
		if (PlayerCount) == 1 then -- new session?
			SetTimeout(15000,ActivateTrain)
		end
  end
end)

AddEventHandler('playerDropped', function()
  if list[source] then
    PlayerCount = PlayerCount - 1
    list[source] = nil
  end
end)


