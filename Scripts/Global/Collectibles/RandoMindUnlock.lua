function RandoMindUnlock(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')

		Ob.dependencies = {
			meshes = { 'GlobalModels/Objects/HeldObjects/brainPup.plb' }
		}
		Ob.collSphereRadius = 50
        Ob.interestFXName = 'Global.Effects.PsiPowerUpFX'

        Ob.pickupSpritePaths = {
            CoachMind = "Textures/ui/sayline heads/coach.dds",
            SashaMind = "Textures/ui/sayline heads/sasha_sayline.dds",
            MillaMind = "Textures/ui/sayline heads/milla.dds",
            LindaMind = "Textures/ui/sayline heads/lungfish.dds",
            BoydMind = "Textures/ui/sayline heads/boyd.dds",
            GloriaMind = "Textures/ui/sayline heads/gloria.dds",
            FredMind = "Textures/ui/sayline heads/fred.dds",
            EdgarMind = "Textures/ui/sayline heads/edgar.dds",
            OlyMind = "Textures/ui/sayline heads/kidcoach.dds",
        }

        Ob.displayNames = {
            CoachMind = "Adult Coach's Mind",
            SashaMind = "Sasha's Mind",
            MillaMind = "Milla's Mind",
            LindaMind = "Linda's Mind",
            BoydMind = "Boyd's Mind",
            GloriaMind = "Gloria's Mind",
            FredMind = "Fred's Mind",
            EdgarMind = "Edgar's Mind",
            OlyMind = "Kid Coach's Mind",
        }
		
	end	
	
	function Ob:onBeginLevel()

		self.meshName = 'GlobalModels/Objects/HeldObjects/brainPup.plb'

		--edit
		if Global.player.stats.APPlaceholder[self.Name] == 'collected' then
			self:killSelf()
		end
        
		%Ob.Parent.onBeginLevel(self)

		--edit to fix scale and orientation
		SetScale(self, 1.5,1.5,1.5)
		--self.mover:setOrientation(ApplyOrientation(0, 0, 0, self.mover:getOrientation()))
		self:setState(nil)

		--edit to add collect soundfx
		self.pickUpSound = LoadSound('YouWin')

        --edit to change Pickup Image and displayed item name
        self.pickupSpritePath = self.pickupSpritePaths[self.Name]
        self.displayName = self.displayNames[self.Name]
	end

	function Ob:beginStatePickup()
		self:beNotPickupable()
		if self.interestFX then 
			self.interestFX:stop(0, 0, 1)
			self.interestFX = nil
		end
	end

	function Ob:statePickup()

        Global.player.invDisplayer:invItemAdded(self,0,0,nil,1,0)

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'APPlaceholder', self.Name, 1)
		--edit for soundfx
		PlaySound(nil, self.pickUpSound)
        Global:saveGlobal('b'..self.Name..'found', 1)

		-- if in CASA, open the appropriate door
		if Global.levelScript:getLevelName() == 'CASA' then
			if self.Name == 'CoachMind' then
				local door = FindScriptObject('CU_BBdoor')
				door:open(1)
			end
			if self.Name == 'SashaMind' then
				local door = FindScriptObject('CU_SAdoor')
				door:open(1)
			end
			if self.Name == 'MillaMind' then
				local door = FindScriptObject('CU_MIdoor')
				door:open(1)
			end
			if self.Name == 'LindaMind' then
				local door = FindScriptObject('CU_LOdoor')
				door:open(1)
			end
			if self.Name == 'BoydMind' then
				local door = FindScriptObject('CU_MMdoor')
				door:open(1)
			end
			if self.Name == 'GloriaMind' then
				local door = FindScriptObject('CU_THdoor')
				door:open(1)
			end
			if self.Name == 'FredMind' then
				local door = FindScriptObject('CU_WWdoor')
				door:open(1)
			end
			if self.Name == 'EdgarMind' then
				local door = FindScriptObject('CU_BVdoor')
				door:open(1)
			end
			if self.Name == 'OlyMind' then
				local door = FindScriptObject('CU_MCdoor')
				door:open(1)
			end
			
		end

		self:killSelf()
	end

	function Ob:onItem(itemName, from)
		self:setState('Pickup')
	end

    function Ob:setPosition(x, y, z)
        y = y+100
		%Ob.Parent.setPosition(self, x, y, z)
		if self.interestFX ~= nil then
        	self.interestFX:setPosition(25, 0, 0)
		end
	end
	
	return Ob
end
