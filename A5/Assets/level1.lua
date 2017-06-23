rootnode = gr.node('lua');

stone = gr.material({0.8, 0.7, 0.7}, {0.0, 0.0, 0.0}, 0)
green = gr.material({0.1, 0.9, 0.1}, {0.0, 0.0, 0.0}, 0)
hide = gr.material({0.84, 0.6, 0.53}, {0.3, 0.3, 0.3}, 20)
red = gr.material({0.7, 0.1, 0.1}, {0.0, 0.0, 0.0}, 0)

rootnode:rotate('y', -5.0);
rootnode:scale( 0.5, 0.5, 0.5 );
rootnode:translate(0.0, 0.0, -10.0);

PLATFORM = {2, 0.5, 2}

function createPlatform(x, y, z)
  platform = gr.mesh('cube', 'platform-' .. tostring(x) .. ',' .. tostring(y));
  platform:set_material(stone);
  platform:scale(table.unpack(PLATFORM));
  platform:translate(x, y, z);
  return platform;
end

p1 = createPlatform(-PLATFORM[1]/2, 0, 0);
p2 = createPlatform(1, 0.5, -(PLATFORM[3] + 1));
p3 = createPlatform(0.5, 1, -(PLATFORM[3] + 1) * 2);

rootnode:add_child(p1);
rootnode:add_child(p2);
rootnode:add_child(p3);

return rootnode;