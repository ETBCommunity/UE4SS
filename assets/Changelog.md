v1.2.1
==============
TBD

Based on [`0bfec09`](https://github.com/UE4SS-RE/RE-UE4SS/tree/0bfec09ee30b7c4cda8aa151e2fdb15cbe6c10c9)

## Changes

- Reverted CheatManagerEnablerMod changes

### If you are replacing an old installation, also replace the Mods folder to get the latest changes.

#### If you want to develop mods, download the `zDev-UE4SS_...` version - it contains the pdb file for easier debugging.


v1.2.0
==============
TBD

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