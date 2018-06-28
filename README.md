# lua-nginx-cache-purge

Based on code from Tit Petric. Found at https://scene-si.org/2017/01/08/improving-nginx-lua-cache-purges/

- Reformatted to not use external dependancies such as /usr/bin/find
- Use zmq library for upstream cluster purging
- Include debug capabilities
