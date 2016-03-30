//
//  GameScene.swift
//  DynamicSizeParticlesDemo
//
//  Created by 財弟 夫悧努 on 3/27/16.
//  Copyright (c) 2016 Einharch Crop. All rights reserved.
//

import SpriteKit

class GameScene: SKScene
{
    //var particlesNode = ParticlesNode()
    var particlesNode : ParticlesNode!
    var wall =  SKSpriteNode()

    func loadParticles(type type: ParticlesType)
    {
        // FIRST ADD THE PARTICLES

        particlesNode = ParticlesNode()

        particlesNode.loadParticles(type: .Snow)

        addChild(particlesNode)

        // THEN ADD A VIEW (WALL WITH TRASPARENT WINDOWS FOR EX.)

        wall = SKSpriteNode(imageNamed: "Square")

        wall.size = size
        wall.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))

        addChild(wall)
    }

    override func didMoveToView(view: SKView)
    {
        // While we can call this method here, if we put all asets loading methods in here, the level wil take time to load/appear, and some animations won't be finished, requiring a Loading Screen
        // It's also possible to prefetch all textures and create all nodes by calling the method from the parent view, or using the Atlas preload methods

        //loadParticles(type: .Snow)
    }


    override func didChangeSize(oldSize: CGSize)
    {
        if (particlesNode != nil)
        {
            particlesNode.update(size: size)

            /* Reposition the particles */
            /* unless their parent node has constraints or in a convenience method such as update(frame:) */
            particlesNode.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMaxY(frame))
        }

        wall.size = size
        wall.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
    }
}
