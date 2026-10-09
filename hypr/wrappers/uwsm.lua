local uwsm = {}

---@param app string
function uwsm.exec(app)
    hl.exec_cmd("uwsm-app -- " .. app)
end

---@param apps string[]
function uwsm.exec_all(apps)
    for _, app in pairs(apps) do
        uwsm.exec(app)
    end
end

---@param app string
function uwsm.dsp(app)
    return hl.dsp.exec_cmd("uwsm-app -- " .. app)
end

---@param apps string[]
function uwsm.dsp_all(apps)
    for _, app in pairs(apps) do
        uwsm.dsp(app)
    end
end

return uwsm
