GlobalAr = nil
ControllerCache = nil ---@type AActor|nil
HookActive = false
JuiceActive = false
SanityActive = false

function Log(Message)
    if type(GlobalAr) == "userdata" and GlobalAr:type() == "FOutputDevice" then
        GlobalAr:Log(Message)
    else
        print("[ETBCommandsMod] " .. Message .. "\n")
    end
end

function StartHook()
    if not HookActive then
        HookActive = true
        RegisterBeginPlayPostHook(
        ---@param Context RemoteUnrealParam<AActor>
        function(Context)
            local actor = Context:get()
            local actor_name = actor:GetFName():ToString():sub(1, 8)

            if actor_name:sub(1, 5) == "BPCha" then
                if ControllerCache ~= nil and ControllerCache:IsValid() and JuiceActive then
                    JuiceActive = false
                    if ControllerCache.Character:GetAddress() == actor:GetAddress() then
                        ProcessJuice(ControllerCache.Character, false)
                    end
                    return
                end
            end
            if actor_name:sub(1, 5) == "MP_PS" then
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