--[[Scavenger Squirrel requires several in-depth changes to make the item he holds (self.acorn) work properly
since the item can be ANY collectible in the game now. 

Using hide() and show() instead of bePickupable() and beNotPickupable(), since these work for both items AND props
]]

function ScavengerSquirrel_hooks(Ob)

    --FULL FUNCTION OVERRIDE
    function Ob:onPostBeginLevel()
		--check if the item has already been collected, kill squirrel if missing
		self.acorn = FindScriptObject(self.acorn)
		if self.acorn == nil then 
			self:killSelf() 
			self.noAcorn = 1
			return
		end
		
		%Ob.Parent.onPostBeginLevel(self)
		if (self.acorn ~= nil and self.noAcorn ~= 1) then
			self.acorn:setOrientation(0,0,0)
			self:setOrientation(0,0,0)

			--changed to hide()
			self.acorn:hide()
			self.acorn.bUseDefaultUncollectedAnim = 0
			--changed to show()
			self.acorn:show()

			local me = self
			self.acorn.onTKPickup = function(self)
				%me.onTKPickup(%me)
			end
			local x, y, z = self:getPosition()
			self.sphere = TriggerSphere_New(x, y, z, 800)
			Trigger_RegisterListener(self.sphere, self)
			self:setAnim(self.animsTable.idle)
			self.invisTestThread = SpawnScript('Locator', self.Name..'InvisTestThread')
			local me = self
			self.invisTestThread.stateCheckInvis = function(self)
				--function to "detach acorn" if Invisibility True in trigger volume
				if GetPlayerInvisibility() ~= 1 then
					%me:scare()
				else
					if %me.acorn then
						%me.acorn:show()
						%me.acorn:setPosition(10455, 0, -3724)
					end
					%me.acorn = nil
				end
			end
			self:setState(nil)
			LoadAnim(self.acorn, self.acornIdle)
		end
	end

    --FULL FUNCTION OVERRIDE
    function Ob:stateScare()
		self.bHidden = 1
		if self.acorn then
			--changed to hide()
			self.acorn:hide()
			self.acorn:setOrientation(0,0,0)
			--remove janky animations
			--LoadAnim(self.acorn, self.acornFlee , 0, 0)
		end
		self:setOrientation(0,0,0)
		self:playAnimBlocking(self.animsTable.flee)
		self:setState(nil)
	end

    --FULL FUNCTION OVERRIDE
    function Ob:beginStateEmerge()
		self.bHidden = 0
		self:show()
		if self.acorn and IsDead(self.acorn) == 1 then self.acorn = nil end
		if self.acorn then
			self.acorn:show()
			SetEntityAlpha(self.acorn, 1, .2)
			--remove janky animations
			--LoadAnim(self.acorn, self.acornEmerge , 0, 0)
		end
	end

    --FULL FUNCTION OVERRIDE
    function Ob:stateEmerge()
		self:playAnimBlocking(self.animsTable.emerge)
		self:setAnim(self.animsTable.idle)
		if self.acorn then
			--remove janky animations
			--LoadAnim(self.acorn, self.acornIdle)
			--changed to show()
			self.acorn:show()
		end
		self:setState(nil)
	end


end