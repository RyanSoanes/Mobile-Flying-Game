//
//  GameScene.swift
//  Mobile Computing Project Sprite Kit
//
//  Created by Ryan Soanes on 15/12/2018.
//  Copyright © 2018 Ryan Soanes. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "plane1")
    let background = SKSpriteNode(imageNamed: "road1")
    
    override func didMove(to view: SKView) { //similar to viewDidLoad
        setupBackground()
        setupPlayer()
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(setupEnemy),
                SKAction.wait(forDuration: 1.0)
                ])
        ))
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func setupPlayer() {
        let f0 = SKTexture.init(imageNamed: "plane1")
        let f1 = SKTexture.init(imageNamed: "plane2")
        let f2 = SKTexture.init(imageNamed: "plane3")
        let f3 = SKTexture.init(imageNamed: "plane4")
        let f4 = SKTexture.init(imageNamed: "plane5")
        let f5 = SKTexture.init(imageNamed: "plane6")
        let f6 = SKTexture.init(imageNamed: "plane7")
        let f7 = SKTexture.init(imageNamed: "plane8")
        let f8 = SKTexture.init(imageNamed: "plane9")
        let f9 = SKTexture.init(imageNamed: "plane10")
        let f10 = SKTexture.init(imageNamed: "plane11")
        let f11 = SKTexture.init(imageNamed: "plane12")
        let f12 = SKTexture.init(imageNamed: "plane13")
        let f13 = SKTexture.init(imageNamed: "plane14")
        let f14 = SKTexture.init(imageNamed: "plane15")
        let frames: [SKTexture] = [f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14]
        player.position = CGPoint(x: size.width * 0.2, y: size.height * 0.5)
        let animation = SKAction.animate(with: frames, timePerFrame: 0.05)
        player.run(SKAction.repeatForever(animation))
        addChild(player)
    }
    
    func setupBackground() {
        let f0 = SKTexture.init(imageNamed: "road1")
        let f1 = SKTexture.init(imageNamed: "road2")
        let f2 = SKTexture.init(imageNamed: "road3")
        let f3 = SKTexture.init(imageNamed: "road4")
        let f4 = SKTexture.init(imageNamed: "road5")
        let f5 = SKTexture.init(imageNamed: "road6")
        let f6 = SKTexture.init(imageNamed: "road7")
        let f7 = SKTexture.init(imageNamed: "road8")
        let f8 = SKTexture.init(imageNamed: "road9")
        let f9 = SKTexture.init(imageNamed: "road10")
        let f10 = SKTexture.init(imageNamed: "road11")
        let f11 = SKTexture.init(imageNamed: "road12")
        let f12 = SKTexture.init(imageNamed: "road13")
        let f13 = SKTexture.init(imageNamed: "road14")
        let f14 = SKTexture.init(imageNamed: "road15")
        let f15 = SKTexture.init(imageNamed: "road16")
        let f16 = SKTexture.init(imageNamed: "road17")
        let f17 = SKTexture.init(imageNamed: "road18")
        let f18 = SKTexture.init(imageNamed: "road19")
        let frames: [SKTexture] = [f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18]
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = CGSize(width: size.width, height: size.height)
        let animation = SKAction.animate(with: frames, timePerFrame: 0.04)
        background.run(SKAction.repeatForever(animation))
        addChild(background)
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func setupEnemy() {
        let enemy = SKSpriteNode(imageNamed: "bird1")
        let f0 = SKTexture.init(imageNamed: "bird1")
        let f1 = SKTexture.init(imageNamed: "bird2")
        let f2 = SKTexture.init(imageNamed: "bird3")
        let f3 = SKTexture.init(imageNamed: "bird4")
        let f4 = SKTexture.init(imageNamed: "bird5")
        let f5 = SKTexture.init(imageNamed: "bird6")
        let f6 = SKTexture.init(imageNamed: "bird7")
        let f7 = SKTexture.init(imageNamed: "bird8")
        let f8 = SKTexture.init(imageNamed: "bird9")
        let f9 = SKTexture.init(imageNamed: "bird10")
        let frames: [SKTexture] = [f0, f1, f2, f3, f4, f5, f6, f7, f8, f9]
        let actualY = random(min: enemy.size.height/2, max: size.height - enemy.size.height/2)
        enemy.position = CGPoint(x: size.width + enemy.size.width/2, y: actualY)
        enemy.size = CGSize(width: size.width / 6, height: size.height / 4)
        let animation = SKAction.animate(with: frames, timePerFrame: 0.04)
        enemy.run(SKAction.repeatForever(animation))
        addChild(enemy)
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        let actionMove = SKAction.move(to: CGPoint(x: -enemy.size.width/2, y: actualY),
                                       duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        enemy.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
}

