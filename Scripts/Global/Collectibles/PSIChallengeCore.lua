--EDIT These have been changed to replicate the effect of PsiChallenge Markers in the shop
function PSIChallengeCore(Ob)

	if (Ob == nil) then
		Ob = CreateObject('Global.Props.ShopItem')
		Ob.meshName = 'GlobalModels/CO_Collectibles/Co_PSIChallengeMarker02.plb'
		Ob.collSphereRadius = 20
		Ob.collSphereYOff = 20 -- Editable
		Ob.initialState = nil
		Ob.inventoryscale = 1
		Ob.heldscale = 0.2
		Ob.displayName = "/GLZB000TO/"--DIALOG=<<PSI Challenge Marker>>
		Ob.sItemExplanation = "/GLZB058TO/" --DIALOG=<<Used to make PSI CHALLENGE MARKERS.>>
		--edit
		Ob.pickupSpriteName = 'PsiChallengeMarker'
		Ob.shelfIdleAnim = 'Anims/PSIChallenge/ShelfIdle.jan'	-- used to make cards go away so that mesh looks like core not marker
		
		-- SHOP STUFF
		--edit increase price
		Ob.iPrice = 100
		Ob.iNumStock = -1 -- Editable
		--edit Name change, Needs Localization!
		Ob.sItemDescription = "Psi Challenge Marker" --DIALOG=<<PSI Challenge Marker>>
		--edit to "hold" more than 99
		Ob.iNumDartCanCarry = 999
		Ob.tShopCamInfo = {
			x = 6280,
			y = 167,
			z = -6359,
			rx = 0, 
			ry = -165,
			rz = 0,
		}
		--edit to make look like Marker in Shop
		Ob.spinAnim = 'Anims/PSIChallenge/Spin.jan'
		
		-- END SHOP STUFF
		Ob.dependencies = {
			scripts = {'Global.Effects.PsiCoreFX',},
		}
		
	end	

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		self.iNumStock = -1

	end

	function Ob:onBeginLevel()
        %Ob.Parent.onBeginLevel(self)
		--edit
		self:loadAnim(self.spinAnim, 0.2, 1)
		--self:loadAnim(self.shelfIdleAnim, 0, 0)	-- 0 blend time and no looping, just want to initilize the position of the mesh
		
		--edit Scale
		self:setScale(0.6)

		self.psiCoreFX = SpawnScript('Global.Effects.PsiCoreFX')
		if GetCurrentLevelName() ~= 'CALI' then
			self.psiCoreFX:attach(self, nil, 1)
		end
		self.rCollectedSoundHandle = LoadSound('PsiCore')
		SetSimulationCullDistance( self, 6000)
		self:setState(nil)
	end

	function Ob:onAddedToInventory()
		-- play the sound
        %Ob.Parent.onAddedToInventory(self)
		self:playSound(self.rCollectedSoundHandle, 0, 0, 1)		
		if self.psiCoreFX ~= nil then 
			self.psiCoreFX:stop()
			self.psiCoreFX:killSelf()
		end

		--edit give player a Psi Challenge Marker 
		self:sendMessage(Global.player, 'PSIChallengeMarker', self.value, 1)
		--self:sendMessage(Global.player, 'CollectedPSICore', 1)
		
		-- remove self from the inventory
		Global.player:removeFromInventory(self)
		--edit no need for this
		--Global:saveGlobal('PsiCoreCollected', 1) 
		self:killSelf()
	end
	
	function Ob:onSimulationCulled( bCull )
		%Ob.Parent.onSimulationCulled(self, bCull)
		if (self.psiCoreFX) then
			SetEntityFlag(self.psiCoreFX, ENTITY_NOSIMULATE, bCull)
		end
    end
    
    return Ob
    
end
