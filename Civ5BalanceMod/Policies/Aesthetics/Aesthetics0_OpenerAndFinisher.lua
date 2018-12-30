-- Aesthetics0_OpenerAndFinisher
-- Author: OzlFX
-- DateCreated: 9/18/2016 2:44:08 PM
--------------------------------------------------------------
function BM_Aesthetics_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	-- Aesthetics Finisher
	if	(policyID == GameInfo.Policies["POLICY_FINE_ARTS"].ID and player:HasPolicy(GameInfo.Policies["POLICY_FLOURISHING_OF_ARTS"].ID)) or
		(policyID == GameInfo.Policies["POLICY_FLOURISHING_OF_ARTS"].ID and player:HasPolicy(GameInfo.Policies["POLICY_FINE_ARTS"].ID)) then

		-- The player has finished Aesthetics. Add a Leader's Monument to the capital, which gives 1 free Social Policy.
		local pCity = player:GetCapitalCity();
		pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_SCRIPTORIUM"], 1);
		pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_GALLERY"], 1);
		pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_CONSERVATORY"], 1);
		pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TOURIST_HOUSE"], 1);

	end

end
GameEvents.PlayerAdoptPolicy.Add(BM_Aesthetics_OnPolicyAdopted);