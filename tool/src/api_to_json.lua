local json = require('json')
local functions = vim.fn.api_info()
local f = io.open('api_info.json', 'w')
f:write(json.encode(functions))
f:close()