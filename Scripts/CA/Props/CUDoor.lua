--	asdf.lua
--
--	for P S I C O N A U G H T S
--	(c) Joe's Mom
--	P&C
--
--	Door with logic to decide open/closed state based on level completion.
--

function CUDoor(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.SimpleDoor')

		Ob.level = 'NI' -- Editable
		Ob.levelLoadVolName = '' -- Editable
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self.llv = FindScriptObject(self.levelLoadVolName)
		self:open(1)
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
