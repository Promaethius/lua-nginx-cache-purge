# lua-nginx-cache-purge

Based on code from Tit Petric. Found at https://scene-si.org/2017/01/08/improving-nginx-lua-cache-purges/

- Reformatted to not use external dependancies such as /usr/bin/find
- Use zmq library for upstream cluster purging
- Include debug capabilities
- Use https://github.com/DreamLab/ngx_cache_purge to perform actual purging. (Much more effecient which also clears memory based meta-cache which openresty does not have a LUA API to perform.)
