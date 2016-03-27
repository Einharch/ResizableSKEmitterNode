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

    func loadParticles(type type: ParticlesType)
    {
        particlesNode = ParticlesNode()

        particlesNode.loadParticles(type: .Snow)

        addChild(particlesNode)
    }

    override func didMoveToView(view: SKView)
    {
        loadParticles(type: .Snow)
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
    }
}
