local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule("Skins")

--Lua functions
local pairs = pairs
--WoW API / Variables

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.timer ~= true then return end

	local function Bar_OnValueChanged(self, value)
		local r, g, b = E:ColorGradient(value, 0,.65,0, .65,.65,0, .65,0,0)
		self:SetStatusBarColor(r, g, b)
		self.bg:SetVertexColor(r * 0.25, g * 0.25, b * 0.25)
	end

	hooksecurefunc("StartTimer_SetGoTexture", function(self)
		for _, b in pairs(TimerTracker.timerList) do
			if b.bar and not b.bar.isSkinned then
				print('da')
				b.bar:StripTextures()
				b.bar.timeText:FontTemplate(nil, 12, "OUTLINE")

				b.bar:SetStatusBarTexture(E.media.glossTex)
				E:RegisterStatusBar(b.bar)
				b.bar:CreateBackdrop()

				b.bar.bg = b.bar:CreateTexture("$parentBackgrund", "BORDER")
				b.bar.bg:SetAllPoints()
				b.bar.bg:SetTexture(E.media.blankTex)

				b.bar:HookScript("OnValueChanged", Bar_OnValueChanged)

				b.bar.isSkinned = true
			end
		end
	end)
end

S:AddCallback("Sirus_Timer", LoadSkin)