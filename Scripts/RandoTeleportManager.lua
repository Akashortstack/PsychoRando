function RandoTeleportManager(Ob)
	if not Ob then
		Ob = CreateObject('ScriptBase')
		-- Some of the warningText messages are used by multiple levels, so store them here.
		Ob.lakeMessage = "The Lake is Closed! Find the Oarsman's Badge!"
		Ob.receptionMessage = "Reception Area Closed! Find the Squirrel Dinner!"
		Ob.cabinsMessage = "Kids' Cabins Closed! Find Lili's Bracelet!"
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self:CloseLevelTeleports()
	end

	function Ob.CloseTeleporter(teleporterName, warningText, dx, dy, dz, dox, doy, doz)
		local teleporter = fso(teleporterName)
		-- Store the original data on the teleporter itself
		if teleporter.originalData == nil then
			teleporter.originalData = {
				destLevel = teleporter.destLevel,
				warningText = teleporter.warningText,
				dx = teleporter.dx,
				dy = teleporter.dy,
				dz = teleporter.dz,
				dox = teleporter.dox,
				doy = teleporter.doy,
				doz = teleporter.doz,
			}
		end
		teleporter.destLevel = nil
		teleporter.warningText = warningText
		teleporter.dx = dx
		teleporter.dy = dy
		teleporter.dz = dz
		teleporter.dox = dox
		teleporter.doy = doy
		teleporter.doz = doz
	end

	function Ob.OpenTeleporter(teleporterName)
		local teleporter = fso(teleporterName)
		local originalData = teleporter.originalData
		if originalData then
			for k, v in originalData do
				teleporter[k] = v
			end
		end
	end

	function Ob:CloseLevelTeleports()
		local levelName = Global.levelScript:getLevelName()
		-- There is no need to close Kids' Cabins (CAKC) teleports because it only has a teleport back to CAMA.
		-- There is no need to close Boathouse+Lake (CABH) teleports because it only has teleports to CAMA and CAGP.
		-- There is no need to close Reception Area (CARE) teleports because it only has teleports to CAMA and CAGP.
		if levelName == 'CAMA' then
			self:CloseCAMATeleports()
		elseif levelName == 'CAGP' then
			self:CloseCAGPTeleports()
		end
	end

	function Ob:CloseCAMATeleports()
		--require Oarsman's Badge for Lake access
		if Global:loadGlobal('bGotOrsmansBadge') ~= 1 then
			for _, teleporterName in {'CAMAtoCABH1', 'CAMAtoCABH2'} do
				self.CloseTeleporter(teleporterName, self.lakeMessage, 391, 4160, 5929, 0, -81, 0)
			end
		end

		--require Squirrel Dinner for Reception access
		if Global:loadGlobal('bGotSquirrelDinner') ~= 1 then
			self.CloseTeleporter('CAMAtoCARE1', self.receptionMessage, -18521, 644, 12800, 0, -4, 0)
		end

		--require Lili's Bracelet for Cabins access
		if Global:loadGlobal('bGotLiliBracelet') ~= 1 then
			for _, teleporterName in {'CAMAtoCAKC1', 'CAMAtoCAKC2'} do
				self.CloseTeleporter(teleporterName, self.cabinsMessage, -8949, 4294, 5116, 0, 6, 0)
			end
		end
	end

	function Ob:CloseCAGPTeleports()
		--require Oarsman's Badge for Lake access
		if Global:loadGlobal('bGotOrsmansBadge') ~= 1 then
			self.CloseTeleporter('CAGPtoCABH1', self.lakeMessage, 7673, -7, 1816, 0, 119, 0)
		end

		--require Squirrel Dinner for Reception access
		if Global:loadGlobal('bGotSquirrelDinner') ~= 1 then
			self.CloseTeleporter('CAGPtoCARE1', self.receptionMessage, -4637, 569, -1043, 0, 93, 0)
		end
	end

	-- Call when receiving Oarsman's Badge
	function Ob:OpenTeleportsToCABH()
		local levelName = Global.levelScript:getLevelName()
		if levelName == 'CAMA' then
			for _, teleporterName in {'CAMAtoCABH1', 'CAMAtoCABH2'} do
				self.OpenTeleporter(teleporterName)
			end
		elseif levelName == 'CAGP' then
			self.OpenTeleporter('CAGPtoCABH1')
		end
	end

	-- Call when receiving Squirrel Dinner
	function Ob:OpenTeleportsToCARE()
		local levelName = Global.levelScript:getLevelName()
		if levelName == 'CAMA' then
			self.OpenTeleporter('CAMAtoCARE1')
		elseif levelName == 'CAGP' then
			self.OpenTeleporter('CAGPtoCARE1')
		end
	end

	-- Call when receiving Lili's Bracelet
	function Ob:OpenTeleportsToCAKC()
		local levelName = Global.levelScript:getLevelName()
		if levelName == 'CAMA' then
			for _, teleporterName in {'CAMAtoCAKC1', 'CAMAtoCAKC2'} do
				self.OpenTeleporter(teleporterName)
			end
		end
	end

	return Ob
end