function dump(o, level)
    if level == nil then level = 1 end
    local indent = string.rep("  ", level) -- Two spaces per level

    if type(o) == 'table' then
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. indent .. '[' .. k .. '] = ' .. dump(v, level + 1) .. ',\n'
        end
        return s .. '}\n'
    else
        if type(o) == "number" then
            return string.format("%.2f", o)
        elseif type(o) == "userdata" and o:type() == "Vec4" then
            return string.format("vec4(%.2f, %.2f, %.2f, %.2f)", o:unpack())
        elseif type(o) == "userdata" and o:type() == "Vec3" then
            return string.format("vec3(%.2f, %.2f, %.2f)", o:unpack())
        else
            return tostring(o)
        end
    end
end
