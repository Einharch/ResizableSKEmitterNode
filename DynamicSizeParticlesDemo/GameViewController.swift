//
//  GameViewController.swift
//  DynamicSizeParticlesDemo
//
//  Created by 財弟 夫悧努 on 3/27/16.
//  Copyright (c) 2016 Einharch Crop. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController
{
    @IBOutlet weak var particlesView: SKView!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        particlesView.showsFPS              = true
        particlesView.showsNodeCount        = true
        particlesView.allowsTransparency    = true
        particlesView.ignoresSiblingOrder   = false

        if let scene = GameScene(fileNamed:"GameScene")
        {
            /* You should resize the view that has particles (to call sizeChanged:), in code or through IB constraints */
            scene.scaleMode = .ResizeFill
            scene.loadParticles(type: .Snow)

            particlesView.presentScene(scene)
        }
    }
}
