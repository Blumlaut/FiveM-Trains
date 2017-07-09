Citizen.CreateThread(function()

function LoadTrainModels() -- f*ck your rails, too!
			tempmodel = GetHashKey("freight")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("freightcar")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("freightgrain")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("freightcont1")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("freightcont2")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("freighttrailer")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end

			tempmodel = GetHashKey("tankercar")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("metrotrain")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("s_m_m_lsmetro_01")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
		
			
end

LoadTrainModels()


TrainLocations = {
{2533.0,2833.0,38.0},
{2606.0,2927.0,40.0},
{2463.0,3872.0,38.8},
{1164.0,6433.0,32.0},
{537.0,-1324.1,29.1},
{219.1,-2487.7,6.0}
}


RegisterNetEvent("StartTrain")
function StartTrain()
	Citizen.Trace("a train has arrived") -- whee i must be host, lucky me
		randomSpawn = math.random(#TrainLocations)
		x,y,z = TrainLocations[randomSpawn][1], TrainLocations[randomSpawn][2], TrainLocations[randomSpawn][3] -- get some random locations for our spawn

	yesorno = math.random(0,100)
	if yesorno >= 50 then -- untested, but seems to work /shrug
		yesorno = true
	elseif yesorno < 50 then
		yesorno = false
	end
	DeleteAllTrains()
	Train = CreateMissionTrain(math.random(0,22), x,y,z,yesorno)
	MetroTrain = CreateMissionTrain(24,40.2,-1201.3,31.0,true) -- these ones have pre-defined spawns since they are a pain to set up
	MetroTrain2 = CreateMissionTrain(24,-618.0,-1476.8,16.2,true)
	CreatePedInsideVehicle(Train, 26, GetHashKey("s_m_m_lsmetro_01"), -1, 1, true)
	CreatePedInsideVehicle(MetroTrain, 26, GetHashKey("s_m_m_lsmetro_01"), -1, 1, true)
	CreatePedInsideVehicle(MetroTrain2, 26, GetHashKey("s_m_m_lsmetro_01"), -1, 1, true) -- create peds for the trains
	SetEntityAsMissionEntity(Train,true,true) -- dunno if this does anything, just throwing it in for good measure
	SetEntityAsMissionEntity(MetroTrain,true,true)
	SetEntityAsMissionEntity(MetroTrain2,true,true)
	
	
end
AddEventHandler("StartTrain", StartTrain)

end)
