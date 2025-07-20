function Sedan_hooks(Ob)

    local onPostBeginLevel_original = Ob.onPostBeginLevel

    function Ob:onPostBeginLevel()
        --make all trunks open from beginning for easier item visibility
		self.startOpened = 1
        %onPostBeginLevel_original(self)
        
    end
end