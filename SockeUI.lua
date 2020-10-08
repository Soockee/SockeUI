-- Copyright (C) 2020 Simon Stockhause
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

SockeUI = {
    fontSize = 10, -- font size for default table
    colors = {
        white = "|cFFFFFFFF",
        gray = "|cFFBEB9B5",
        lightblue = "|cFF96C0CE",
        lightgreen = "|cFF98FB98",
        red = "|cFFFF0000",
        green = "|cFF00FF00",
        darkred = "|cFFC25B56",
        parent = "|cFFBEB9B5",
        error = "|cFFFF0000",
        ok = "|cFF00FF00",
        table = { 0.41, 0.80, 0.94, 1 },
        string = { 0.67, 0.83, 0.45, 1 },
        number = { 1, 0.96, 0.41, 1 },
        default = { 1, 1, 1, 1 },
    },
};

SockeUIMixin = {};

function SockeUI:initializePlayerFrame()
    PlayerFrame:ClearAllPoints();
	PlayerFrame:SetPoint("CENTER",UIParent,-400,150);
	PlayerFrame:SetUserPlaced(true);
end

function SockeUI:initializeTargetFrame()
    TargetFrame:ClearAllPoints();
	TargetFrame:SetPoint("CENTER",UIParent,-175,150);
	TargetFrame:SetUserPlaced(true);
end

function SockeUI:initializeFocusFrame()
    FocusFrame:ClearAllPoints();
	FocusFrame:SetPoint("CENTER",UIParent,230,40);
	FocusFrame:SetUserPlaced(true);
end
function SockeUI:initializeBuffPosition()
    --- Position and Resize Buffbar Top Left Corner 
    BuffFrame:ClearAllPoints();
	BuffFrame:SetPoint("TOPLEFT", MinimapCluster, -60, -20);
	BuffFrame:SetScale(0.3);
end

function SockeUI:HideActionbarGryphons()
    -- Remove Gryphons
	MainMenuBarArtFrame.LeftEndCap:Hide(); 
	MainMenuBarArtFrame.RightEndCap:Hide(); 
end

----------------------------------------------------------------------------------------------
-- UI LIFECICLE
-----------------------------------------------------------------------------------------------
function SockeUIMixin:OnLoad()
    self.parent = self:GetParent();
    self:RegisterEvent("ADDON_LOADED");
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
end
function SockeUIMixin:OnEvent(event, eventUnit, arg1)
    if event == "ADDON_LOADED" then
        self:UnregisterEvent("ADDON_LOADED");
    end
    
    if event == "PLAYER_ENTERING_WORLD" then
        SockeUI:initializePlayerFrame();
        SockeUI:initializeTargetFrame();
        SockeUI:initializeFocusFrame();
        SockeUI:initializeBuffPosition();
        --SockeUI:HideActionbarGryphons();

        SockeUI:Print("SockeIU Loaded")
        self.initialized = true;
        self:UnregisterEvent("PLAYER_ENTERING_WORLD");
    end
end

----------------------------------------------------------------------------------------------
-- UTIL
-----------------------------------------------------------------------------------------------

-- use this function all over my code instead of print
function SockeUI:Print(strText)
    print(self.colors.darkred .. "[Socke's Debug]: " .. self.colors.white .. strText)
end

