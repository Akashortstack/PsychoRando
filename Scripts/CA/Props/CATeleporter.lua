
-- This script works exactly the same as Global.Props.Teleporter except that it is meant to be used 
-- In the campground levels.  It checks to see if it is nighttime yet. If so then it teleports you to
-- the nighttime version of the level instead of the daytime one.

function CATeleporter(Ob)
	if (not Ob) then
		Ob = CreateObject('Global.Props.Teleporter')
	end

-- ****************************************************************************
-- Message Handlers ***********************************************************
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		if self.destLevel and strfind(self.destLevel, '_NIGHT') then
			self.destLevel = strsub(self.destLevel, 1, strlen(self.destLevel)-6)
		end
		if self.destLevel and Global:load('CALevelState', 'CA') >= 7 and self.destLevel ~= 'CASA' and self.destLevel ~= 'CAJA' then
			self.destLevel = self.destLevel .. '_NIGHT'
		end
	end

-- ****************************************************************************	
	return Ob
   
end
