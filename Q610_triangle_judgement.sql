select x, y, z, IF((x + y > z and x + z > y and z + y > x), 'Yes', 'No') as triangle
from triangle
