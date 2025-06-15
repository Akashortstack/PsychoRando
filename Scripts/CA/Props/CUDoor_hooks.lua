--[[This checks what Mind items the player has collected and opens the corresponding door portals when entering CASA
Overwrites any other logic for opening/closing doors from the Vanilla game]]

function CUDoor_hooks(Ob)

    --FULL FUNCTION OVERRIDE
    function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self.llv = FindScriptObject(self.levelLoadVolName)
        --check the door's corresponding level with matching Mind found, close if false
		if self.level == 'BB' and Global:loadGlobal('bCoachMindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'SA' and Global:loadGlobal('bSashaMindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'MI' and Global:loadGlobal('bMillaMindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'LO' and Global:loadGlobal('bLindaMindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'MM' and Global:loadGlobal('bBoydMindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'TH' and Global:loadGlobal('bGloriaMindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'WW' and Global:loadGlobal('bFredMindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'BV' and Global:loadGlobal('bEdgarMindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'MC' and Global:loadGlobal('bOlyMindfound') ~= 1 then
			self:close(1)
		else
            --Matching mind found, open door
			self:open(1)
		end

	end
end