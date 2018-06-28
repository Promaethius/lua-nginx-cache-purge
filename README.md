# lua-nginx-cache-purge
- Use zmq library for upstream cluster purging
- Include debug capabilities
- Use https://github.com/DreamLab/ngx_cache_purge to perform actual purging. (Much more effecient which also clears memory based meta-cache which openresty does not have a LUA API to perform.)
