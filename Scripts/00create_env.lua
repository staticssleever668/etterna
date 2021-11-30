-- XXX(Yaroslav): We rely on this being the first script to run, but what if it's not?

local _ETTERNA_G = _ETTERNA_G

if _ETTERNA_G == nil then
	print("UH OH")
	return
end

if _ETTERNA_G.is_populated then
	print("Trying to repopulate global table!")
	return
end

local safe_variables = {
	-- Lua standard library.
	"_G",
	"_VERSION",
	"assert",
	"collectgarbage",
	"coroutine",
	"debug",
	"dofile",
	"error",
	"getfenv",
	"getmetatable",
	"io",
	"ipairs",
	"load",
	"loadfile",
	"loadstring",
	"math",
	"module",
	"next",
	"os",
	"package",
	"pairs",
	"pcall",
	"print",
	"rawequal",
	"rawget",
	"rawset",
	"require",
	"select",
	"setfenv",
	"setmetatable",
	"string",
	"table",
	"tonumber",
	"tostring",
	"type",
	"unpack",
	"xpcall",

	-- The envrionment itself. I don't think it should be used directly
	-- so we should try to make it work without this.
	"_ETTERNA_G",
}

for _, v in ipairs(safe_variables) do
	_ETTERNA_G[v] = _G[v]
end

_ETTERNA_G.is_populated = true
