# PackUTF8 module

Maked for packing string to datastore

## Example for usage

```lua

local UTF_8_Module = require(PathToModule)
local Packed = UTF_8_Module:Pack("ABC") -- Returns: #65##66##67#
local Depacked = UTF_8_Module:Unpack(Packed) -- Returns: ABC

```
**Disclaimer: work only with Luau in roblox**
