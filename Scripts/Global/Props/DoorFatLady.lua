function DoorFatLady(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.Trampoline')
		Ob.meshName = 'Characters/Fat_Lady.plb'

		Ob.animsDir = 'Anims/Fat_Lady/'
		Ob.animsTable = {
			idle = { fileName = 'Breathe_Idle' },
			confused = { fileName = 'Confusion' },
			jump1 = { fileName = 'Jump_1' },
			jump2 = { fileName = 'Jump_2' },
			psiReact = { fileName = 'Psi_reaction' },
			basicBraining = { fileName = 'Refuse_BasicBraining' },
			sing = { fileName = 'Sing' },
		}
		
		--edit for collision updates
		Ob.collSphereRadius = 740

		Ob.height = 100
		Ob.Confusion = 1
		Ob.disguise = 'Textures/Sprites/Clairvoyance Handlers/Raz_Candy.tga'
		Ob.bClairvoyancePlayerControl = 1
	end

	function Ob:onBeginLevel()
		--Need to set up some physics stuff so she can react with confusion and such (which means she
		--needs to check triggers)
		SetEntityCollideSphere(self, 200, 0, 80, 70)
		SetPhysicsFlag(self, PHYSICS_NOPHYSICS, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 1)
		SetEntityFlag(self, ENTITY_CHECKTRIGGERS, 1)

		self.idleAnimation = self:getAnimFileName(self.animsTable.idle)
		
		--We actually want to SKIP the Trampoline onBeginLevel because we have special physics needs
		%Ob.Parent.Parent.onBeginLevel(self)
		self:setScale(2.65)
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		
		--Preload all her anims
		self:preloadAnims()
		
		--Start in idle animation
		self:loadAnim(self.animsTable.idle, 0, 1)

		--Make her intersting!
		self:setEntityInterestLevel(kOBJECTMAJOR_INTEREST)
	end

	--Kind of copies Animator.lua
	function Ob:preloadAnims()
		for name, anim in self.animsTable do
			PreloadAnim(self, self:getAnimFileName(anim))
		end
	end

	--Override scriptbase's loadAnim
	function Ob:loadAnim(anim, iBlendTime, bLoop)
		return LoadAnim(self, self:getAnimFileName(anim), iBlendTime, bLoop)
	end	

	--Gets an anims full file name either from the table
	function Ob:getAnimFileName(anim)
		local animFileName
		if (anim) then
			if (type(anim) == 'table') then
				animFileName = anim.fileName
			elseif (self.animsTable[anim]) then
				animFileName = self.animsTable[anim].fileName
			else
				animFileName = anim
			end
		end

		if (animFileName and (not strfind(animFileName, '.jan'))) then
			return self.animsDir..animFileName..'.jan'
		else
			return animFileName
		end
	end

	--This puts the fat lady back in her idle animation whenever one of her animations completes (bounce,
	--psiReact, etc), unless she is confused, and then it will put her in her confusion anim, until she is
	--no longer confused.
	function Ob:onAnimCompleted()
		if (self.bSBConfused == 1) then
			self:loadAnim(self.animsTable.confused, 0.2, 1)
		else
			self:loadAnim(self.animsTable.idle, 0.2, 1)
		end
	end
	
	--****************************************************************************************
	--The next few functions handle all the FatLady's reactions
	--****************************************************************************************
	
	function Ob:damageReact()
		self:loadAnim(self.animsTable.psiReact, 0.2, 0)
	end
	
	function Ob:onNewMoveMelee(data, from)
		self:damageReact()
	end
	
	function Ob:onPsiBlast(data, from)
		self:damageReact()
	end

	function Ob:onBasicBraining(data, from)
		self:loadAnim(self.animsTable.basicBraining, 0.2, 0)
	end
	
	function Ob:onConfusion(data, from)
		%Ob.Parent.onConfusion(self, data, from)
		
		--Only go confused if we are idle
		if (GetCurrentAnimName(self) == self:getAnimFileName(self.animsTable.idle)) then
			self:loadAnim(self.animsTable.confused, 0.2, 1)
		end
	end

	function Ob:onConfusionDone(data, from)
		%Ob.Parent.onConfusionDone(self, data, from)
		
		--Only go back to idle if we are in confusion anim
		if (GetCurrentAnimName(self) == self:getAnimFileName(self.animsTable.confused)) then
			self:loadAnim(self.animsTable.idle, 0.2, 1)
		end
	end

  	function Ob:onClairvoyance(data, from)
		self:makeInvisible(1)
		Global.player:setClairvoyanceTarget(self, 1)
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 1)
	end 

	function Ob:onCancelClairvoyance()
		self:makeVisible()
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 0)
	end
	
	return Ob
end