local enabled = false

local function ProcessFullbright(FullCommand, Parameters, Ar)
    GlobalAr = Ar

    if not enabled then
        enabled = true
        UEHelpers.GetKismetSystemLibrary(false):ExecuteConsoleCommand(UEHelpers.GetWorldContextObject(), FString("PREVVIEWMODE"), nil)
    else
        enabled = false
        UEHelpers.GetKismetSystemLibrary(false):ExecuteConsoleCommand(UEHelpers.GetWorldContextObject(), FString("NEXTVIEWMODE"), nil)
    end

    return true
end

RegisterConsoleCommandHandler("fullbright", ProcessFullbright)
RegisterConsoleCommandHandler("fb", ProcessFullbright)