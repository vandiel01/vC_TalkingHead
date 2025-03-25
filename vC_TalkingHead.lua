-- Completed 03/25/2025
-- https://github.com/vandiel01/vC_TalkingHead
-------------------------------------------------------
-- Simplified Gear iLevel in Character Pane
-------------------------------------------------------
function vC_CloseTalkingHead()
	TalkingHeadFrame:CloseImmediately()
end
-------------------------------------------------------
-- Register Events
-------------------------------------------------------
local vC_TH_RegEv = CreateFrame("Frame")
	vC_TH_RegEv:RegisterEvent("ADDON_LOADED")
	vC_TH_RegEv:SetScript("OnEvent", function(s, e, ...)
	if ( e == "ADDON_LOADED" ) then
		local vC_TH_Events = {
			"PLAYER_ENTERING_WORLD",
		}
		for i = 1, #vC_TH_Events do
			vC_TH_RegEv:RegisterEvent(vC_TH_Events[i])
		end
		vC_TH_RegEv:UnregisterEvent("ADDON_LOADED")
	end
	if ( e == "PLAYER_ENTERING_WORLD" ) then 
		TalkingHeadFrame:HookScript("OnShow", vC_CloseTalkingHead)			-- Close Any TalkingHead Banner
	end
end)

