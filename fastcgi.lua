-- Check if file exists by opening the file in read-only. If the file 
function file_exists(path)
        -- TODO: Use a non-blocking, less memory intensive file check method rather than loading sections of the cache into memory.
        local file = io.open(path, "r")
        if file != nil then io.close(file) return true else return false end
end

function explode(d, p)
        local t, ll
        t={}
        ll=0
        if(#p == 1) then return {p} end
                while true do
                        l=string.find(p, d, ll, true) -- find the next d in the string
                        if l~=nil then -- if "not not" found then..
                                table.insert(t, string.sub(p, ll, l-1)) -- Save it in our array.
                                ll=l+1 -- save just after where we found it for searching next time.
                        else
                                table.insert(t, string.sub(p, ll)) -- Save what's left in our array.
                                break -- Break at end, as it should be, according to the lua manual.
                        end
                end
        return t
end

function purge(filename)
        if (file_exists(filename)) then
                os.remove(filename)
        end
end

function trim(s)
        return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function exec(cmd)
        local handle = io.popen(cmd)
        local result = handle:read("*all")
        handle:close()
        return trim(result)
end

function list_files(cache_path, purge_upstream, purge_pattern)
        local result = exec("/usr/bin/find " .. cache_path .. " -type f | /usr/bin/xargs --no-run-if-empty -n1000 /bin/grep -El -m 1 '^KEY: " .. purge_upstream .. purge_pattern .. "' 2>&1")
        if result == "" then
                return {}
        end
        return explode("\n", result)
end

-- Check if loaded into nginx lua module.
if ngx != nil then
        local cache_conf = ngx.var.fastcgi_cache_path
        -- TODO: Format the cache_path and extract path and level information from it.
        local cache_key = ngx.var.fastcgi_cache_key
        -- TODO: Check the key formatting.
        local ha = ngx.var.cache_ha
        local ha_forwarded = ngx.arg
        
        local files = list_files(ngx.var.lua_purge_path, ngx.var.lua_purge_upstream, ngx.var.request_uri)

        ngx.header["Content-type"] = "text/plain; charset=utf-8"
        ngx.header["X-Purged-Count"] = table.getn(files)
        
        -- Cycle through cache file table. Try to purge a file. If it fails, log the error
        for key, value in pairs(files) do
                if purge(value) != nil then ngx.log(ngx.ERROR, err) end
        end
        
        -- Check for HA mode.
        if ha == true then
                -- Grab a list of peers from the shared memory of the upstream dns module.
                local peers, err = ngx.shared.purge_upstream_peers.get
                -- Check for errors such as the shared mem space does not exist.
                if err != nil then
                        ngx.log(ngx.ERROR, err)
                else
                        -- If the list is not empty, create an async sub-request for each IP.
                        if peers != nil then
                                --
                        end                        
                end                        
        end
        
        -- Close thread.
        ngx.exit(ngx.OK)
end
