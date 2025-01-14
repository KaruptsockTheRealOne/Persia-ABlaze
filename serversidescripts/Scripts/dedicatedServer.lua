net.set_name('ABlaze Server')
local res = net.start_server(serverSettings)
if res ~= 0 then
    log.write('Dedicated Server', log.DEBUG, 'Failed to start server with code: ', res)
end
