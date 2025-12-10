function CAJA_hooks(Ob)

    --FULL FUNCTION OVERRIDE
    --[[removing lots of conditional cutscene code based on Camp state]]
    function Ob:onPostBeginLevel()
        %Ob.Parent.onPostBeginLevel(self)

        --Always call this Intro, no other intros should ever be needed
        self:setState('ObservationIntro')

    end

end