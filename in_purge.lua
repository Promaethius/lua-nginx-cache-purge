--[[ 
# This location block will be called by the lua block via ngx.location.capture(uri)
# Configure cache location and cache arguments.
location ~ /upstream_purge(/.*) {
    allow              127.0.0.1;
    deny               all;
    proxy_cache_purge  tmpcache $1$is_args$args;
}

location ~ /purge(/.*) {
    allow              127.0.0.1;
    deny               all;
    content_by_lua_file /etc/nginx/lua-nginx-cache-purge/in_purge.lua;
}
]]--

if ngx != nil then -- Check if lua-nginx module is loaded.
--[[
1) Dealer $uri to zmq Broker (non-blocking).
  a) Handle error messages to nginx_err.
  b) TODO: Callback to init_by_lua and shut down the listener to conserve tcp connections until a successful purge request gets status 200.
2) local args = ngx.req.get_uri_args()
  a) For k, v in args, set uri flags.
3) local res = ngx.location.capture(/upstream_purge?$uri)
]]--
end
