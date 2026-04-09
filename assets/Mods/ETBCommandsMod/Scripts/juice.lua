function ProcessJuiceCommand(FullCommand, Parameters, Ar)
    GlobalAr = Ar

    if ControllerCache == nil or not ControllerCache:IsValid() then
        ControllerCache = FindFirstOf("MP_PlayerController_C") --[[@as AActor]]
        if ControllerCache == nil or not ControllerCache:IsValid() then
            Log("Couldn't find the player controller.")
            return true
        end
    end

    StartHook()

    return ProcessJuice(ControllerCache.Character, true)
end

function ProcessJuice(Character, bPrint)
    if Character == nil or not Character:IsValid() then
        Log("Player Character is invalid.")
        return true
    end

    if not JuiceActive then
        JuiceActive = true
        Character.CharacterMovement.MaxWalkSpeed = 675
        Character.IsBurnedOut = true
        if bPrint then Log("Infinite juice effect on") end
    else
        JuiceActive = false
        Character.CharacterMovement.MaxWalkSpeed = Character.WalkSpeed
        Character.IsBurnedOut = false
        if bPrint then Log("Infinite juice effect off") end
    end

    return true
end

RegisterConsoleCommandHandler("juice", ProcessJuiceCommand)
RegisterConsoleCommandHandler("j", ProcessJuiceCommand)