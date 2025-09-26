# Void-Check-CID
Simple FiveM resource for QBCore using ox_lib notifications. Adds a `/checkcid` command that shows the player's Citizen ID and copies it to clipboard.

## Requirements
- qb-core
- ox_lib

## Installation
1. Place the `Angles-CheckCID` folder into your server's `resources` directory.
2. Ensure both `qb-core` and `ox_lib` are started before this resource.
3. In your `server.cfg`, add:
   ```
   ensure qb-core
   ensure ox_lib
   ensure Angles-CheckCID
   ```

## Usage
- In chat, run:
  ```
  /checkcid
  ```
- You'll get an ox_lib notification like `Citizen ID: ID7671D1` and your raw CID will be copied to the clipboard.

## Notes
- The script reads `QBCore.Functions.GetPlayerData().citizenid`.
- Uses `lib.notify` and `lib.setClipboard` from ox_lib.
