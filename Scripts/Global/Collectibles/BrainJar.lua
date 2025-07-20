-- This represents the brain while it is in the Jar.  When attacked, the Jar explodes and leaves
-- behind the actual collectible Brain object.


function BrainJar(Ob)

	if not Ob then
		Ob = CreateObject('Global.Props.Geometry')
		Ob.meshName = 'GlobalModels/CO_Collectibles/Co_BrainJT.plb'

		--Timer ID for destruction completion.
		Ob.TIMER_FINISHDESTROY = '15999'

		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = {
				'Global.Collectibles.Brain',
				'Global.Effects.BrainJarExplodeFX',
			},
			textures = {
				'Textures/icons/InventoryItems/BrainJar.dds',
			}
		}
	end
	
--************************************************************************************************* 
	function Ob:onBeginLevel()	  

		Global.player.stats.totalBrainsInLevel = Global.player.stats.totalBrainsInLevel + 1

		SetEntityCollideSphere(self,50,0,50,0)

		-- for legacy brains
		local prefixLoc = strfind(self.Name, 'BrainJar')
		if prefixLoc == 1 then
			local name = strsub(self.Name, 9)
			if name and name ~= '' then self.who = name end
		end

		%Ob.Parent.onBeginLevel(self)

  		SetBaseTexture(self, 
    				'Textures/icons/InventoryItems/co_brainpolaroid' .. self.who .. '.dds', 
    				'textures/collectibles/co_brainpolaroidjt.tga')		
  
		
		local hintCount = Global:loadGlobal('BrainJarHintCount')
		if hintCount ~= 1 then
			-- if there variable is non zero and greater then zero 
			-- then we have not seen the hint yet
			self:proxHintOn()
		end
		
		self:setEntityInterestLevel(kBRAIN_INTEREST)
		
		self:setState(nil)
	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel( self )
		Global.levelScript.numBrainsInLevel = Global.levelScript.numBrainsInLevel + 1
		--This has to be in onPostBeginLevel because raz gets brains in Dart:onBeginLevel (in preparePlayer())
		if (Global.player.stats.brains[strlower(self.who)] ~= nil) then
			self:killSelf()			
		end
		-- too complex to properly detail cull.  Since we don't have time to simplify the object, use this hack.
		SetEntityFlag(self, ENTITY_DETAIL_CULLING, 0)
	end

	function Ob:onNewMoveMelee()
		--Play destroy animation
		--Create Brain object
		--Destroy self
		local fx = SpawnScript('Global.Effects.BrainJarExplodeFX',self.Name..'_explode','',1)
		fx:attach(self)
		fx:runThenPool()
		--self:createTimer(200, self.TIMER_FINISHDESTROY)
		
		if self.proximityLine ~= nil then 
			-- if there is a hint line then kill All the brains hint lines
			local hintCount = Global:loadGlobal('ArrowheadHintCount')
			Global:saveGlobal('BrainJarHintCount', 1)
			foreach_entity_oftype('Global.Collectibles.BrainJar', function(ent) ent:proxHintOff() end)  
		end

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'BrainJar', self.Name, 1)

		local brain = SpawnScript('Global.Collectibles.Brain','Brain'..self.who,'self.who=\''..self.who..'\'',1)
		brain:setPosition(self:getPosition())
		brain:onItem('', Global.player)
		self:killSelf()
		
	end

	function Ob:onTimer(id)
		%Ob.Parent.onTimer(self,id)
		if(id == self.TIMER_FINISHDESTROY) then
--			GamePrint('Got timer message.')
			local brain = SpawnScript('Global.Collectibles.Brain','Brain'..self.who,'self.who=\''..self.who..'\'',1)
			brain:setPosition(self:getPosition())
			self:killSelf()
		end
	end
	
	function Ob:onActivate(data, from)
	    if (from == Global.player) then
			Global.player:sayLine("/ASBD002RA/",0, 1, nil, 1, nil, 1) -- I don't think I can fit that jar in my backpack, but if I busted out the brain... I'll bet they compress nicely
	    end
	end
    
	function Ob:proxHintOn()
		--edit to make text appear in all levels. *STILL NEEDS LOCALIZATION*
		self.proximityLine = "Punch jar to free brain." --DIALOG=<<Punch jar to free brain.>>
		Global.player:myProximityHintChanged(self)
	end

	function Ob:proxHintOff()
		self.proximityLine = nil
		Global.player:myProximityHintChanged(self)
	end

	return Ob
end
