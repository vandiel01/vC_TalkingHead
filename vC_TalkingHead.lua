-- Completed 03/24/2025
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
local vC_RegEv = CreateFrame("Frame")
	vC_RegEv:RegisterEvent("ADDON_LOADED")
	vC_RegEv:SetScript("OnEvent", function(s, e, ...)
	if ( e == "ADDON_LOADED" ) then
		local vC_Events = {
			"PLAYER_ENTERING_WORLD",		-- Action To Do When Loading into WoW
		}
		for i = 1, #vC_Events do
			vC_RegEv:RegisterEvent(vC_Events[i])
		end
		vC_RegEv:UnregisterEvent("ADDON_LOADED")
	end
	-- Repair Gear
	if ( e == "PLAYER_ENTERING_WORLD" ) then 
		TalkingHeadFrame:HookScript("OnShow", vC_CloseTalkingHead)			-- Close Any TalkingHead Banner
	end
end)

