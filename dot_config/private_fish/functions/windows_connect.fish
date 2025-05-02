function windows_connect --wraps=xfreerdp /v:192.168.122.95 /u:HolyVM /p:123 /size:100% /d: /dynamic-resolution /gfx-h264:avc444 +gfx-progressive & 'alias windows_connect=xfreerdp /v:192.168.122.95 /u:HolyVM /p:123 /size:100% /d: /dynamic-resolution /gfx-h264:avc444 +gfx-progressive &'
    xfreerdp /v:192.168.122.95 /u:HolyVM /p:123 /size:100% /d: /dynamic-resolution /gfx-h264:avc444 +gfx-progressive &
end
