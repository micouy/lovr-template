require 'dump'

function lovr.draw(pass)
    pass:text(dump({ hello = "world" }), vec3(0, 1, -1.5), 0.2, quat())
end
