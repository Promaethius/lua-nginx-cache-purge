--[[
Ran under LuaJIT2, this .lua provides a socket for the embedded nginx clients to send and receive information
on what is being purged from the workers. It does not care who has what resource since it will assume nginx
is either running with virtual server blocks or as a load balancer. Future work will include pub/sub to lists
based on the nginx virtual server blocks.
]]--
