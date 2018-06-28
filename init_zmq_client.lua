--[[
init_by_lua_file /etc/nginx/lua-nginx-cache-purge/init_zmq_client.lua;

# This module runs a lua worker that Subs to the zmq server and recieves commands to purge a particular uri.
]]--

if ngx != nil then

end
