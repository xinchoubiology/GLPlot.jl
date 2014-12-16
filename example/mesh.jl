using GLAbstraction, GLPlot, Reactive
using Meshes

window = createdisplay(w=1920, h=1280)


# volume of interest
x_min, x_max = -1, 15
y_min, y_max = -1, 5
z_min, z_max = -1, 5
scale = 8

b1(x,y,z) = box(   x,y,z, 0,0,0,3,3,3)
s1(x,y,z) = sphere(x,y,z, 3,3,3,sqrt(3))
f1(x,y,z) = min(b1(x,y,z), s1(x,y,z))  # UNION
b2(x,y,z) = box(   x,y,z, 5,0,0,8,3,3)
s2(x,y,z) = sphere(x,y,z, 8,3,3,sqrt(3))
f2(x,y,z) = max(b2(x,y,z), -s2(x,y,z)) # NOT
b3(x,y,z) = box(   x,y,z, 10,0,0,13,3,3)
s3(x,y,z) = sphere(x,y,z, 13,3,3,sqrt(3))
f3(x,y,z) = max(b3(x,y,z), s3(x,y,z))  # INTERSECTION
f(x,y,z) = min(f1(x,y,z), f2(x,y,z), f3(x,y,z))

const vol = Meshes.volume(f, x_min,y_min,z_min,x_max,y_max,z_max, scale)
const msh = Meshes.isosurface(vol, 0.0)

glplot(msh)

renderloop(window)