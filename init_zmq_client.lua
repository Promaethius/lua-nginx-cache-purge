--[[
init_by_lua_file /etc/nginx/lua-nginx-cache-purge/init_zmq_client.lua;

# This module runs two lua workers that Sub and Dealer to the zmq server.
# Pub:
# By utilizing a shared dictionary, the Dealer client will loop and push new DICT items to the server.
# Sub: 
]]--

require "zhelpers"
local zmq      = require "lzmq"
local zthreads = require "lzmq.threads"
local ztimer   = require "lzmq.timer"
local zpoller  = require "lzmq.poller"

local include = [[
	require "zhelpers"
	local zmq      = require "lzmq"
	local zthreads = require "lzmq.threads"
	local ztimer   = require "lzmq.timer"
	local zpoller  = require "lzmq.poller"
]]

local init_task = include .. [[
	local ctx = zmq.context()
]]

local init_thread = include .. [[
	local ctx = zthreads.get_parent_ctx()
]]

if ngx != nil then
	zthreads.run(nil, pub_task):start(true)
	zthreads.run(nil, sub_task):start(true)
end
