--*
--*              "HornetNest.lua"                
--*  
--*       from  P S Y C H O N A U T S
--*
--*  (c) 2003 Double Fine Productions, Inc.  
--*            All Rights Reserved.
--*        Proprietary and Confidential
--*
--*	Amy Unger

function HornetNest(Ob)

	if (Ob == nil) then
		Ob = CreateObject('ScriptBase')
		Ob.meshName = 'Levels/CA_Campgrounds/Props/CA_ScavHornetHive.plb'
		Ob.collSphereRadius = 60
		Ob.maxViewDistance = 4000
		--Ob.lookOffsetPosY = 
		Ob.interestLevel = kHELDOBJECT_INTEREST
		Ob.Telekinesis = kTKBEHAVIOR_NONE
		Ob.TIMER_SAFETY_FALL = '8001'
        Ob.huntItem = nil	-- Editable
		Ob.bFalling = 0		
	end	

-- ********************************************************************************************************
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self:loadMesh(self.meshName)
		SetMeshIsBackwards(self,1)
		SetEntityCollideSphere(self, self.collSphereRadius, 0, self.collSphereRadius, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 1)
		SetEntityAura(self, 102, 255, 0, 255)
		self:setEntityInterestLevel(self.interestLevel)
		self.huntItem = FindScriptObject(self.huntItem)
		SetEntityFlag(self, ENTITY_ZLOCK, 1)

		--edit remove or self.huntItem.bCollected == 1 
		if not self.huntItem then
			self:killSelf()
		else
			self.swarmEffects = SpawnScript('CA.Effects.HornetSwarmFX', 'SwarmEffects', '', 1)
			self.swarmEffects:attach(self)
			self.swarmEffects:run()
			GamePrint('FRIG')
			self.beeSound = LoadSound('Beehive')
			self:playSound(self.beeSound)
		end
        
        SetSimulationCullDistance( self, 6000)
        
		self:setState(nil)
	end
	
-- ********************************************************************************************************	
	function Ob:onPostBeginLevel()
		--edit remove or self.huntItem.bCollected == 1 
		if not self.huntItem then
			return
		end
		%Ob.Parent.onPostBeginLevel(self)
		-- hide the item for now
		--edit removed
		--self.huntItem:bShowSelf(0)
		if Global:load('bPSIBlastHuntPuzzleSolved','CA') == 1 then
			self:onPsiBlast()
			return
		end
	end

-- ********************************************************************************************************
	function Ob:onPsiBlast(data, from)
		if self.bFalling ~= 1 then
			Global:save('bPSIBlastHuntPuzzleSolved', 1,'CA')
			SetPhysicsFlag(self,PHYSICS_APPLYGRAVITY, 1)
			-- safety, in case we fall on something else like the bear or Raz-- break open after a second anyway
			self:callFunctionAfter(self.onCollide, 2000, nil, Global)
			self.bFalling = 1
		end
	end
-- ********************************************************************************************************		

	function Ob:onCollide(data,from)
		if from == Global and self.bFalling == 1 then
			SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
			SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
			--edit changed to just moving the item to new location
			self.huntItem = FindScriptObject(self.huntItem)
			self.huntItem:setPosition(-19584, 613, 3026)
			self.bFalling = 0
			self:killSelf()
		end
	end
	
	function Ob:onSimulationCulled( bCull )
		%Ob.Parent.onSimulationCulled(self, bCull)
		if (self.swarmEffects) then
			SetEntityFlag(self.swarmEffects, ENTITY_NOSIMULATE, bCull)
		end
    end

-- ********************************************************************************************************		
    return Ob
    
end
