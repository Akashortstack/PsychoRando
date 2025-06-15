--[[Hornet Nest Puzzle requires several in-depth changes to make the item (self.huntItem) work properly
since the item can be ANY collectible in the game now.]]

function HornetNest_hooks(Ob)

    --FULL FUNCTION OVERRIDE
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

		--edit moved to onPostBeginLevel()
		--[[if not self.huntItem then
			self:killSelf()
		else
			self.swarmEffects = SpawnScript('CA.Effects.HornetSwarmFX', 'SwarmEffects', '', 1)
			self.swarmEffects:attach(self)
			self.swarmEffects:run()
			GamePrint('FRIG')
			self.beeSound = LoadSound('Beehive')
			self:playSound(self.beeSound)
		end
		]]
        
        SetSimulationCullDistance( self, 6000)
        
		self:setState(nil)
	end

    --FULL FUNCTION OVERRIDE
    function Ob:onPostBeginLevel()
        --transplanted from onBeginLevel(), we want this called AFTER rando items have been placed
		if not self.huntItem then
			self:killSelf()
			return
		else
			self.swarmEffects = SpawnScript('CA.Effects.HornetSwarmFX', 'SwarmEffects', '', 1)
			self.swarmEffects:attach(self)
			self.swarmEffects:run()
			self.beeSound = LoadSound('Beehive')
			self:playSound(self.beeSound)
		end
        
		%Ob.Parent.onPostBeginLevel(self)

        --self.huntItem:bShowSelf(0)
		if Global:load('bPSIBlastHuntPuzzleSolved','CA') == 1 then
			self:onPsiBlast()
			return
		end
	end

    --FULL FUNCTION OVERRIDE
    function Ob:onCollide(data,from)
		if from == Global and self.bFalling == 1 then
			SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
			SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
			--find the rando item and set it's new position
            --TODO: Change to use hide() and show() instead?
			self.huntItem = FindScriptObject(self.huntItem)
			self.huntItem:setPosition(-19584, 613, 3026)
			self.bFalling = 0
			self:killSelf()
		end
	end
end