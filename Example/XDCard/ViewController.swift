//
//  ViewController.swift
//  XDCard
//
//  Created by 329720990@qq.com on 01/15/2024.
//  Copyright (c) 2024 329720990@qq.com. All rights reserved.
//

import UIKit
import XDCard

class ViewController: UIViewController {
    let cardStack = SwipeCardStack()
    let cardImages = [
          UIImage(named: "1"),
          UIImage(named: "2"),
          UIImage(named: "3"),
          UIImage(named: "4"),
          UIImage(named: "5")
      ]
    var list = [SwipeCard]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        list = cardImages.compactMap({$0}).map { img in
            return card(fromImage: img)
        }
        view.addSubview(cardStack)
        cardStack.frame = view.safeAreaLayoutGuide.layoutFrame
        cardStack.dataSource = self
        cardStack.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func card(fromImage image: UIImage) -> SwipeCard {
      let card = SwipeCard()
      card.swipeDirections = [.left, .right]
      card.content = UIImageView(image: image)
      
      let leftOverlay = UIView()
      leftOverlay.backgroundColor = .green
      
      let rightOverlay = UIView()
      rightOverlay.backgroundColor = .red
      
      card.setOverlays([.left: leftOverlay, .right: rightOverlay])
      
      return card
    }

}

extension ViewController: SwipeCardStackDataSource {
    
    func cardStack(_ cardStack: XDCard.SwipeCardStack, cardForIndexAt index: Int) -> XDCard.SwipeCard {
        return list[index]
    }
    
    func numberOfCards(in cardStack: XDCard.SwipeCardStack) -> Int {
        return list.count
    }
}

extension ViewController: SwipeCardStackDelegate {
    
    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
        
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didUndoCardAt index: Int, from direction: SwipeDirection) {
        
    }
    
    func didSwipeAllCards(_ cardStack: SwipeCardStack) {
        
    }

}

