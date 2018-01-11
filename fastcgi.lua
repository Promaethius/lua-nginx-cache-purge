local args = ngx.req.get_uri_args()
local debug = ngx.var.lua_debug
local fastcgi = ngx.var.fastcgi_cache_path

---Check if this is loaded within the nginx lua module
if ngx ~= nil then
    ---Parse key value pairs.
    for key, val in pairs(args) do
    
        ---Multiple keys with the same values are treated as a table.
        if type(val) == "table" then
            if debug == true then ngx.say(key, ": ", table.concat(val, ", "))
            ---Cycle through all table elements.
            for tableKey, tableVal in pairs(val)
        else
            if debug == true then ngx.say(key, ": ", val)
        end
    end
end
