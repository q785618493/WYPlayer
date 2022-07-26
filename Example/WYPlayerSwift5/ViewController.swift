//
//  ViewController.swift
//  WYPlayerSwift5
//
//  Created by 785618493@qq.com on 07/26/2022.
//  Copyright (c) 2022 785618493@qq.com. All rights reserved.
//

import UIKit

import WYPlayerSwift5

class ViewController: UIViewController {

    var playerView:WYPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createView()
    }

    func createView() {
        self.title = "title"
        
        self.playerView = WYPlayerView.init(frame: self.view.bounds)
        self.playerView.play(url: "http://pili-live-hdl.qingyajiu.com/live/082ff56c982c506141070ad5f0f36bca.flv")
        self.playerView.prepareToPlay()
        self.view.addSubview(self.playerView)
    }
    
    // MARK: - 销毁播放器
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.playerView.pause()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - 屏幕宽度
func screenWidth() -> CGFloat {
    return UIScreen.main.bounds.width
}

// MARK: - 屏幕高度
func screenHeight() -> CGFloat {
    return UIScreen.main.bounds.height
}

// MARK: - 屏幕高度大于811为全面屏
func longScreen() -> Bool {
    return screenHeight() > 811.0
}
