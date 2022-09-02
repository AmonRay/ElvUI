local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule("Skins")

local function AllStrip(self)
    self.TopLeft:Hide();
    self.TopRight:Hide();
    self.BottomLeft:Hide();
    self.BottomRight:Hide();
    self.TopMiddle:Hide();
    self.MiddleLeft:Hide();
    self.MiddleRight:Hide();
    self.BottomMiddle:Hide();
    self.MiddleMiddle:Hide();
end

local function LoadSkin()
    -- print("Da")
    S:HandleTab(CollectionsJournalTab4)
    ToyBoxIconsFrameOverlayFrame:StripTextures()
    ToyBoxIconsFrame:StripTextures()
    ToyBoxIconsFrame:CreateBackdrop("Default")
    AllStrip(ToyBoxFilterButton)
    S:HandleButton(ToyBoxFilterButton)
    S:HandleEditBox(ToyBoxSearchBox)
    S:HandleNextPrevButton(ToyBoxPagingFrameNextPageButton,"right")
    S:HandleNextPrevButton(ToyBoxPagingFramePrevPageButton,"left")
    S:HandleStatusBar(ToyBoxProgressBar)


    
end


S:AddCallback("Sirus_ToyCollection", LoadSkin)
