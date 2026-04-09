function ProcessSanityCommand(FullCommand, Parameters, Ar)
    GlobalAr = Ar

    if ControllerCache == nil or not ControllerCache:IsValid() then
        ControllerCache = FindFirstOf("MP_PlayerController_C") --[[@as AActor]]
        if ControllerCache == nil or not ControllerCache:IsValid() then
            Log("Couldn't find the player controller.")
            return true
        end
    end

    StartHook()

    return ProcessSanity(ControllerCache.PlayerState, true)
end

function ProcessSanity(State, bPrint)
    if State == nil or not State:IsValid() then
        Log("Player State is invalid.")
        return true
    end

    if not SanityActive then
        SanityActive = true
        State.ShouldLowerSanity = false
        State.Sanity = 100.0
        if bPrint then Log("Infinite sanity on") end
    else
        SanityActive = false
        State.ShouldLowerSanity = true
        if bPrint then Log("Infinite sanity off") end
    end

    return true
end

RegisterConsoleCommandHandler("sanity", ProcessSanityCommand)