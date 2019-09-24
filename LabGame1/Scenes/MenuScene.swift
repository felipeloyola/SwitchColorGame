//
//  MenuScene.swift
//  LabGame1
//
//  Created by Felipe Loyola on 9/24/19.
//  Copyright © 2019 Felipe Loyola. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red:44/255,green:62/255, blue:80/255, alpha:1.0)
        addLogo()
        addLabel()
        
    }
    
    func addLogo(){
        let logo = SKSpriteNode(imageNamed: "logo")
        logo.size = CGSize(width: frame.width/4, height: frame.width/4)
        logo.position = CGPoint(x:frame.midX, y:frame.midY+frame.size.height/4)
        addChild(logo)
    }
    
    func addLabel(){
        let playLabel = SKLabelNode(text:"Tap to Play!")
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontSize = 50.0
        playLabel.fontColor = UIColor.white
        playLabel.position = CGPoint(x:frame.midX, y:frame.midY)
        addChild(playLabel)
        animate(label: playLabel)
        
        let higthscoreLabel = SKLabelNode(text:"Higthscore:\(UserDefaults.standard.integer(forKey: "Highscore"))")
        
        higthscoreLabel.fontName = "AvenirNext-Bold"
        higthscoreLabel.fontSize = 40.0
        higthscoreLabel.fontColor = UIColor.white
        higthscoreLabel.position = CGPoint(x:frame.midX, y:frame.midY-higthscoreLabel.frame.size.height*4)
        addChild(higthscoreLabel)
        
        let recentScoreLabel = SKLabelNode(text:"Recent Score:\(UserDefaults.standard.integer(forKey: "Recentscore"))")
        recentScoreLabel.fontName = "AvenirNext-Bold"
        recentScoreLabel.fontSize = 40.0
        recentScoreLabel.fontColor = UIColor.white
        recentScoreLabel.position = CGPoint(x:frame.midX, y:frame.midY-recentScoreLabel.frame.size.height*2)
        addChild(recentScoreLabel)
    }
    
    func animate(label:SKLabelNode){
        //let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        //let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
        let sequence = SKAction.sequence([scaleUp,scaleDown])
        label.run(SKAction.repeatForever(sequence))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size:view!.bounds.size)
        view!.presentScene(gameScene)
        
    }
}
