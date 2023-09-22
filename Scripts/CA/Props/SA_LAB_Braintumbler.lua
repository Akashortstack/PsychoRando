function SA_LAB_Braintumbler(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.Animator')
		Ob.animsDir = 'BrainTumbler'
		Ob.meshName = 'Levels/SA_SashaLab/Props/BrainTumbler.plb'
		Ob.animsTable = { idleUp = {fileName = 'Up', preload = 1, blendTime = 0, loop = 1},
		                  idleDown = {fileName = 'Down', preload = 1, blendTime = 0, loop = 1},
				  raise = {fileName = 'Raise', preload = 1, blendTime = 0, next = 'idleUp'},
				  lower = {fileName = 'Lower', preload = 1, blendTime = 0, next = 'idleDown'},
		}
		Ob.maxViewDistance = 1100
	end

-- ************************************************************************************************

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self:setAnim(self.animsTable.idleUp)
		SetPhysicsFlag(self,PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self,PHYSICS_COLLIDER, 0)
		
		SetEntityFlag(self, ENTITY_CAMERA_ALPHA, 1)
		self.rSasha = FindScriptObject('Sasha')

		local state = Global:load('CALevelState', 'CA')

		Global:save('TumblerLowered', 1)

		self.rUpCollision = SpawnScript('Global.Props.Geometry', self.Name..'UpCollision', 'self.meshName = \'Levels/CA_Campgrounds/Props/CASA_BrainTumblerCollisionUp.plb\'')
		self.rDownCollision = SpawnScript('Global.Props.Geometry', self.Name..'DownCollision', 'self.meshName = \'Levels/CA_Campgrounds/Props/CASA_BrainTumblerCollisionDown.plb\'')
		SetEntityCollideSphere(self, 0)
		if (Global:load('TumblerLowered') == 1) then
			self:setTumblerState('down')
		else
			self:setTumblerState('up')
		end
		RegisterTriggerVolume(self, 'tv_tumblerzone')
	end

-- ************************************************************************************************

	function Ob:onSwitchOn()
		self:setAnim(self.animsTable.lower)
	end

-- ************************************************************************************************

	function Ob:setTumblerState(sState)
		self:setAnim(self.animsTable.idleDown)
		self:setEntityInterestLevel(kPERSON_INTEREST)
		Global:save('TumblerLowered', 1)
		SetPhysicsFlag(self.rUpCollision,PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.rDownCollision,PHYSICS_COLLIDEE, 1)
		if Global:load('SLIN3Seen') == 1 then
			self.proximityLine = "/CAZF000TO/"--DIALOG=<<Press /YButton/ to activate Brain Tumbler>>
		else
			self.proximityLine = nil
		end
	end
	
-- ************************************************************************************************

	function Ob:onSwitchOff()
		self:setAnim(self.animsTable.raise)
	end
	
-- ************************************************************************************************

	function Ob:onItem(itemName)
		self:setState('EnterTumbler')
	end
	
	function Ob:stateEnterTumbler()
        self:playVideo('cutScenes/prerendered/CANI.xmv')

		self:goToCU(0)
	end
	
	function Ob:goToCU()
		self:setState('GoToCU')
	end

	function Ob:stateGoToCU(bSlowFade)
		--Fade out and place player at the CU locator
		local dest = FindScriptObject('PlayerCULocator')
		if bSlowFade == 1 then 
			Global.cutsceneScript:fadeToBlack(.5, 1)
		else
			Global.cutsceneScript:fadeToBlack(0, 0)
		end
		Global.player:setEverything(dest)

		Global.cutsceneScript:fadeIn(.5, 1)

		self:setState(nil)
	end

-- *********************************************************************************************

	function Ob:onEnteredTriggerVolume(data, from)
		%Ob.Parent.onEnteredTriggerVolume(self, data, from)
		if from == Global.player and data == 'tv_tumblerzone' then
			if Global:load('TumblerLowered') == 1 then
				SetMaxViewDistance(self, self.maxViewDistance)				
			end
		end
	end

	function Ob:onExitedTriggerVolume(data, from)
		%Ob.Parent.onExitedTriggerVolume(self, data, from)
		if from == Global.player and data == 'tv_tumblerzone' then
			if Global:load('TumblerLowered') == 1 then
				SetMaxViewDistance(self, 0)
			end
		end		
	end

-- *********************************************************************************************

	return Ob
end
