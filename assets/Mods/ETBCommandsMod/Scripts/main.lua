UEHelpers = require("UEHelpers")

GlobalAr = nil
ControllerCache = nil ---@type AActor|nil
local HookActive = false
JuiceActive = false
SanityActive = false

function Log(Message)
    if type(GlobalAr) == "userdata" and GlobalAr:type() == "FOutputDevice" then
        GlobalAr:Log(Message)
    else
        print("[ETBCommandsMod] " .. Message .. "\n")
    end
end

function CacheFirstController()
    if ControllerCache == nil or not ControllerCache:IsValid() then
        local NewControllerCache = UEHelpers.GetGameplayStatics(false):GetPlayerController(UEHelpers.GetWorldContextObject(), 0) --[[@as AActor]]
        if NewControllerCache == nil or not NewControllerCache:IsValid() or not NewControllerCache:IsA("/Game/Multiplayer/MP_PlayerController.MP_PlayerController_C") then
            return false
        end
        ControllerCache = NewControllerCache
    end
    return true
end

function StartHook()
    if not HookActive then
        HookActive = true
        RegisterBeginPlayPostHook(
        ---@param Context RemoteUnrealParam<AActor>
        function(Context)
            local actor = Context:get()
            local actor_name = actor:GetFName():ToString():sub(1, 8)

            if actor_name == "BPCharac" then
                if ControllerCache ~= nil and ControllerCache:IsValid() and JuiceActive then
                    JuiceActive = false
                    if ControllerCache.Character:GetAddress() == actor:GetAddress() then
                        ProcessJuice(ControllerCache.Character, false)
                    end
                    return
                end
            end
            if actor_name == "MP_PS_C_" then
                if ControllerCache ~= nil and ControllerCache:IsValid() and SanityActive then
                    SanityActive = false
                    if ControllerCache.PlayerState:GetAddress() == actor:GetAddress() then
                        ProcessSanity(ControllerCache.PlayerState, false)
                    end
                    return
                end
            end

            if actor_name == "GM_MainM" or actor_name == "Lobby_GM" then
                JuiceActive = false
                SanityActive = false
                return
            end
        end)
    end
end

require("give_drop")
require("juice")
require("sanity")
require("fullbright")
require("noclip")
require("aliases")