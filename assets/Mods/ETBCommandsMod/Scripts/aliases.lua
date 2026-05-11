local PlayerCache = nil ---@type UObject|nil

local function ProcessAliases(FullCommand, Parameters, Ar)
    GlobalAr = Ar

    local command = FullCommand:sub(1, 2)

    if CacheFirstController() then
        if command == "dc" then
            if ControllerCache.Player ~= nil and ControllerCache.Player:IsValid() then
                PlayerCache = ControllerCache.Player
                UEHelpers.GetKismetSystemLibrary(false):ExecuteConsoleCommand(nil, FString("ToggleDebugCamera"), ControllerCache)
            else
                if PlayerCache ~= nil and PlayerCache:IsValid() then
                    UEHelpers.GetKismetSystemLibrary(false):ExecuteConsoleCommand(nil, FString("ToggleDebugCamera"), PlayerCache.PlayerController)
                else
                    Log("Couldn't execute alias on this map, please use the full command.")
                end
            end
        elseif command == "t" then
            UEHelpers.GetKismetSystemLibrary(false):ExecuteConsoleCommand(nil, FString("Teleport"), ControllerCache)
        end
    else
        Log("Couldn't execute alias on this map, please use the full command.")
    end

    return true
end

local function ProcessHelp(FullCommand, Parameters, Ar)
    GlobalAr = Ar

    Log([[All custom commands (Command : Alias), case-insensetive:
        give : g (Give an item directly into the inventory)
        drop : d (Drop an item on the ground)
        juice : j (Toggle infinite juice effect)
        sanity (Toggle infinite sanity)
        toggledebugcamera : dc (Toggle debug camera)
        teleport : t (Teleport to where you're looking)
        fullbright : fb (Toggle fullbright)
        noclip (Toggle noclip mode)
        help : aliases (This message)]])
    return true
end

RegisterConsoleCommandHandler("dc", ProcessAliases)
RegisterConsoleCommandHandler("t", ProcessAliases)
RegisterConsoleCommandHandler("aliases", ProcessHelp)
RegisterConsoleCommandHandler("help", ProcessHelp)