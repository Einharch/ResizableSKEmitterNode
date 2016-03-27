//
//  Particles.swift
//  DynamicSizeParticlesDemo
//
//  Created by 財弟 夫悧努 on 3/27/16.
//  Copyright © 2016 Einharch Crop. All rights reserved.
//

import UIKit
import SpriteKit

/* Enum with particles type, nice to use as a switch if you have many particles such as fire/rain/fog/leafs, etc */
enum ParticlesType
{
    case Snow
}

class ParticlesNode: SKNode
{
    var type        : ParticlesType = .Snow
    var particles   : SKEmitterNode!

    /* Some convenience method to load a particle, maybe to change it on the fly (careful with addChild in that case) */
    func loadParticles(type type:ParticlesType)
    {
        self.type = type

        let path    = NSBundle.mainBundle().pathForResource("\(type)Particle", ofType: "sks")
        particles   = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKEmitterNode

        addChild(particles)
    }

    /* If application/game can rotate to portrait and landscape, get the frame */
    func update(size size: CGSize)
    {
        /* Create variables for any dynamic parameter */
        var birthrate   : CGFloat   = 10
        var lifetime    : CGFloat   = 8
        var speed       : CGFloat   = 40
        var scale       : CGFloat   = 0.1
        var scaleRange  : CGFloat   = 0.1

        /* Edit variables in Iterface Idiom, scaling particles to have the same size/ratio on all screens */
        /* If application doesn't require fullscreen, think about split-screen sizes as well */
        /* In case working with split-screens and so, it's possible to finetune by using a ratio (h/w) */
        if(UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        {
            scale       = 0.2
            scaleRange  = 0.2

            if (size.width > size.height)
            {
                birthrate   = 15
                lifetime    = 10
                speed       = 40
            }
            else
            {
                birthrate   = 10
                lifetime    = 20
                speed       = 60
            }
        }
        else
        {
            scale       = 0.1
            scaleRange  = 0.1
            if (size.width > size.height)
            {
                lifetime    = 8
            }
            else
            {
                lifetime    = 16
            }
        }

        /* Scale the particles to fit the screen width */
        particles.particlePositionRange = CGVectorMake(size.width, size.height / 5)

        particles.particleBirthRate     = birthrate
        particles.particleLifetime      = lifetime
        particles.particleScale         = scale
        particles.particleScaleRange    = scaleRange
        particles.particleSpeed         = speed

        /* Advance the simulation to not have any weirdness when rotating */
        particles.advanceSimulationTime(Double(lifetime))
    }
}
