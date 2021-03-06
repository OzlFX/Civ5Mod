function addTreasureFleetsBuilding(player, iX, iY)
	local plot = Map.GetPlot(iX, iY);
	local cCity = plot:GetPlotCity();
	cCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TREASURE_FLEETS"], 1)
end

function MP_Exploration_TreasureFleets_OnCityCaptureComplete(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	if (player:IsEverAlive()) then
		if (player:HasPolicy(GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID)) then
			addTreasureFleetsBuilding(player, iX, iY)
		end
	end
end
GameEvents.CityCaptureComplete.Add(MP_Exploration_TreasureFleets_OnCityCaptureComplete)

function MP_Exploration_TreasureFleets_OnFoundCity(iPlayer, iX, iY)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		if (player:HasPolicy(GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID)) then
			addTreasureFleetsBuilding(player, iX, iY)
		end
	end
end
GameEvents.PlayerCityFounded.Add(MP_Exploration_TreasureFleets_OnFoundCity)

function MP_Patronage_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]
	if (policyID == GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID) then
		for loopCity in player:Cities() do
			loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TREASURE_FLEETS"], 1)
		end
	end

end
GameEvents.PlayerAdoptPolicy.Add(MP_Patronage_OnPolicyAdopted)