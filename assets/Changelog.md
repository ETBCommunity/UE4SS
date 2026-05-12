1.3.0
==============
TBD

Based on [`0bfec09`](https://github.com/UE4SS-RE/RE-UE4SS/tree/0bfec09ee30b7c4cda8aa151e2fdb15cbe6c10c9)

## Changes

- Added a new mod: `ConsoleKeybindsMod` - it adds Source engine-like bind command to the console. This one should be game-agnostic which means it can theoretically work in other games without any changes.
- - `bind <Key> <Command>` - bind a console command to a key (any command, engine or custom, doesn't matter)
- - `binds` - print all binds
- - `unbind <Key>` - unbind a key
- - `unbindall`
- - `listkeys` - get a list of all possible keys for bind (will freeze the game for some time)
- New commands in `ETBCommandsMod`:
- - `help` or `aliases` - prints all commands and aliases
- - `dc` - alias for `ToggleDebugCamera`
- - `t` - alias for `Teleport`
- - `fullbright` or `fb` - toggle between Unlit and Lit modes
- - `noclip` or `nc` - toggle source engine-like noclip (this one is very cool)
- - `getpos` - copy current coordinates
- - `setpos <X> <Y> <Z> <Pitch> <Yaw>` - teleport to coordinates
- Hopefully fixed crashes related to live view
- Added auto search refresh when switching to live view tab

### If you are replacing an old installation, also replace the Mods folder to get the latest changes (especially for this release).

#### If you want to develop mods, download the `zDev-UE4SS_...` version - it contains the pdb file for easier debugging.


v1.2.4
==============
13-04-2026

Based on [`0bfec09`](https://github.com/UE4SS-RE/RE-UE4SS/tree/0bfec09ee30b7c4cda8aa151e2fdb15cbe6c10c9)

## Changes

- Fixed ConsoleEnablerMod sometimes not working

### If you are replacing an old installation, also replace the Mods folder to get the latest changes.

#### If you want to develop mods, download the `zDev-UE4SS_...` version - it contains the pdb file for easier debugging.


v1.2.3
==============
11-04-2026

Based on [`0bfec09`](https://github.com/UE4SS-RE/RE-UE4SS/tree/0bfec09ee30b7c4cda8aa151e2fdb15cbe6c10c9)

## Changes

- GameThreadDispatcher is now like lua, also removed unnecessary functions that was added earlier

### If you are replacing an old installation, also replace the Mods folder to get the latest changes.

#### If you want to develop mods, download the `zDev-UE4SS_...` version - it contains the pdb file for easier debugging.


v1.2.2
==============
11-04-2026

Based on [`0bfec09`](https://github.com/UE4SS-RE/RE-UE4SS/tree/0bfec09ee30b7c4cda8aa151e2fdb15cbe6c10c9)

## Changes

- Separated InGameThread implementation to fix some Lua crashes (infinite loading now might still happen, in that case you need to ExecuteInGameThread)

### If you are replacing an old installation, also replace the Mods folder to get the latest changes.

#### If you want to develop mods, download the `zDev-UE4SS_...` version - it contains the pdb file for easier debugging.


v1.2.1
==============
10-04-2026

Based on [`0bfec09`](https://github.com/UE4SS-RE/RE-UE4SS/tree/0bfec09ee30b7c4cda8aa151e2fdb15cbe6c10c9)

## Changes

- Reverted CheatManagerEnablerMod changes

### If you are replacing an old installation, also replace the Mods folder to get the latest changes.

#### If you want to develop mods, download the `zDev-UE4SS_...` version - it contains the pdb file for easier debugging.


v1.2.0
==============
09-04-2026

Based on [`0bfec09`](https://github.com/UE4SS-RE/RE-UE4SS/tree/0bfec09ee30b7c4cda8aa151e2fdb15cbe6c10c9)

## Changes

- Fixed "The Black Screen of Doom" by making all process event calls in the main thread
- Fixed ETBCommandsMod picking incorrect player
- Small changes to ETBCommandsMod and CheatManagerEnablerMod

### If you are replacing an old installation, also replace the Mods folder to get the latest changes.

#### If you want to develop mods, download the `zDev-UE4SS_...` version - it contains the pdb file for easier debugging.


v1.1.0
==============
29-03-2026

Based on [`0bfec09`](https://github.com/UE4SS-RE/RE-UE4SS/tree/0bfec09ee30b7c4cda8aa151e2fdb15cbe6c10c9)

## Changes

- Added a new mod - ETBCommandsMod - it adds console commands `give`, `drop`, `juice`, `sanity`
- Made the function scan for the LoadMapMP hook more reliable

#### If you want to develop mods, download the `zDev-UE4SS_...` version - it contains the pdb file for easier debugging.


v1.0.0
==============
18-03-2026

Based on [`0bfec09`](https://github.com/UE4SS-RE/RE-UE4SS/tree/0bfec09ee30b7c4cda8aa151e2fdb15cbe6c10c9)

## Changes

- Removed/disabled unnecessary stuff
- Simplified the config file, all the game-specific options are hard-coded
- Fixed ConsoleEnablerMod and CheatManagerEnablerMod by replacing `RegisterHook` with `NotifyOnNewObject` (temporary, `RegisterHook` will be fixed later)
- Added a new hook - `LoadMapMP`, it behaves similarly to `LoadMap` but works in multiplayer
- Fixed BPModLoaderMod using the new `LoadMapMP` hook

#### If you want to develop mods, download the `zDev-UE4SS_...` version - it contains the pdb file for easier debugging.