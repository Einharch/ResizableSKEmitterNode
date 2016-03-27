# ResizableSKEmitterNode
A demo showcasing how to dynamically resize SKEmitter node to fir many devices and orientations 

# Thinking
1) Best way to update the emitter node is preferably to subclass it

2) Hold reference to it, and update somewhere where the size changes (in case of rotation, split-screen or so)

3) Reposition the particles, for example, something falling should be at the top (MaxY)

4) Resize the particle's frame (ScaleRange vector), genereally to qt least equal the parent frame's width

5) Rescale the texture of the particles, by playing with the scale factor or dynamically loading different textures

(keeping in mind that while an iPad is bigger than an iPhone, if the app/game doesn't require fullscreen, it's possible to have a 1/3 split)
