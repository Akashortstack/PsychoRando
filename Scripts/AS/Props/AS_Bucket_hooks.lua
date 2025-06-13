function AS_Bucket_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    function Ob:onPostBeginLevel()
        %Ob.Parent.onPostBeginLevel(self)
		--look for randomized item instead of Milka's Brain
		self.Brain = FindScriptObject(self.randoitem,1)
		if self.Brain then
			--stop uncollected animations to allow attaching
			if self.Brain.mover then
				DetachEntityFromParent(self.Brain)
				KillScript(self.Brain.mover)
				self.Brain.mover = nil
			end
			--raise the Y value from 25 to make it easier to see
			self.Brain:setPosition(self.px, self.py+75, self.pz)
			SetMaxViewDistance(self.Brain, 0)
			AttachEntityToEntity(self.Brain, self, 1)
			SetEntityCollideIgnoreEntity(self, self.Brain, -1)
			self:setEntityInterestLevel(kBRAIN_INTEREST)
		end
    end
end