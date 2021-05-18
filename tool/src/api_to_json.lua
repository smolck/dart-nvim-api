local functions = vim.fn.api_info()
local f = io.open('api_info.json', 'w')
f:write(vim.fn.json_encode(functions))
f:close()
