function BVMA_hooks(Ob)
    --[[When loading BVMA, save last level as BVES to prevent Rando Softlocks]]
    local onPostBeginLevel_original = Ob.onPostBeginLevel
    function Ob:onPostBeginLevel()
        %onPostBeginLevel_original(self)
        Global:save('lastSubLevel', 'BVES')
    end
end