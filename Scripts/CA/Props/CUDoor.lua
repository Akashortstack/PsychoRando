
function CUDoor(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.SimpleDoor')

		Ob.level = 'NI' -- Editable
		Ob.levelLoadVolName = '' -- Editable
		Ob.mindUnlocksTable = {
			Coach = BB,
            Sasha = SA,
            Milla = MI,
            Linda = LO,
            Boyd = MM,
            Gloria = TH,
            Fred = WW,
            Edgar = BV, 
            Oly = MC,
		}
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self.llv = FindScriptObject(self.levelLoadVolName)
		--edit close doors if we haven't found their mind yet
		if self.level == 'BB' and Global:loadGlobal('bCoachmindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'SA' and Global:loadGlobal('bSashamindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'MI' and Global:loadGlobal('bMillamindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'LO' and Global:loadGlobal('bLindamindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'MM' and Global:loadGlobal('bBoydmindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'TH' and Global:loadGlobal('bGloriamindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'WW' and Global:loadGlobal('bFredmindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'BV' and Global:loadGlobal('bEdgarmindfound') ~= 1 then
			self:close(1)
		elseif self.level == 'MC' and Global:loadGlobal('bOlymindfound') ~= 1 then
			self:close(1)
		else
			self:open(1)
		end

	end

	function Ob:open(bImm, bBl)
		%Ob.Parent.open(self, bImm, bBl)
		self.llv:enable()
	end

	function Ob:close(bImm, bBl)
		%Ob.Parent.close(self, bImm, bBl)
		self.llv:disable()
	end

	return Ob
end
