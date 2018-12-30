-- CheckCityOnHill
-- Author: Ollie
-- DateCreated: 8/19/2017 5:32:14 PM
--------------------------------------------------------------

--GameEvents.PlayerCityFounded.Add(function (CheckCityOnHill)(playerID)
	--local pPlayer = Players[playerID]
		--for pCity in pPlayer:Cities() do
			--if (pCity:AtPlot(PlotTypes.PLOT_HILL)) then
				--pCity:ChangeFood(-1)
			--end
		--end
	--end
--end)

function CheckCityOnHill(iPlayer)

	local player = Player[iPlayer]
	if (player:IsEverAlive()) then

			local CityOnHill = false
			for pCity in player:Cities() do
				if (pCity:AtPlot(PlotTypes.PLOT_HILL)) then
					CityOnHill = true
				end
			end

		if (CityOnHill) then
			for pCity in player:Cities() do
				pCity:ChangeFood(-1)
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(CheckCityOnHill);