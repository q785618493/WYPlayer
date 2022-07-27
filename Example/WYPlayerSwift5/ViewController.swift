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
        
        /* 直播源，自己慢慢试哪个能用
         [
           {
             "address": "http://117.148.179.136/PLTV/88888888/224/3221231468/index.m3u8",
             "img": "http://cdn.youlxodxka.live/img/1.jpg",
             "title": "CCTV1综合"
           },
           {
             "address": "http://117.148.179.156/PLTV/88888888/224/3221232362/index.m3u8",
             "img": "http://cdn.youlxodxka.live/img/2.jpg",
             "title": "CCTV2财经"
           },
           {
             "address": "http://shbu.live.bestvcdn.com.cn:8080/live/program/live/cctv3hd/2300000/mnf.m3u8",
             "img": "http://cdn.youlxodxka.live/img/3.jpg",
             "title": "cctv3综艺"
           },
           {
             "address": "http://39.135.138.60:18890/PLTV/88888910/224/3221225621/index.m3u8",
             "img": "http://cdn.youlxodxka.live/img/4.jpg",
             "title": "CCTV4国际"
           },
           {
             "address": "http://117.148.179.165/PLTV/88888888/224/3221231702/index.m3u8",
             "img": "http://cdn.youlxodxka.live/img/5.jpg",
             "title": "CCTV5体育"
           },
           {
             "address": "http://117.148.179.136/PLTV/88888888/224/3221231459/1.m3u8",
             "img": "http://cdn.youlxodxka.live/img/5p.jpg",
             "title": "CCTV5+体育"
           },
           {
             "address": "http://39.134.65.175/PLTV/88888888/224/3221225814/index.m3u8",
             "img": "http://cdn.youlxodxka.live/img/6.jpg",
             "title": "CCTV6电影"
           },
           {
             "address": "http://shbu.live.bestvcdn.com.cn:8080/live/program/live/cctv7/1300000/mnf.m3u8",
             "img": "http://cdn.youlxodxka.live/img/7.jpg",
             "title": "CCTV7军农"
           },
           {
             "address": "http://39.135.138.58:18890/PLTV/88888888/224/3221225631/index.m3u8",
             "img": "http://cdn.youlxodxka.live/img/8.jpg",
             "title": "CCTV8电视剧"
           },
           {
             "address": "http://117.148.179.162/PLTV/88888888/224/3221231697/index.m3u8",
             "img": "http://cdn.youlxodxka.live/img/9.jpg",
             "title": "CCTV9纪录"
           },
           {
             "address": "http://shbu.live.bestvcdn.com.cn:8080/live/program/live/cctv10hd/4000000/mnf.m3u8",
             "img": "http://cdn.youlxodxka.live/img/10.jpg",
             "title": "CCTV10科技"
           },
           {
             "address": "http://shbu.live.bestvcdn.com.cn:8080/live/program/live/cctv11/1300000/mnf.m3u8",
             "img": "http://cdn.youlxodxka.live/img/11.jpg",
             "title": "CCTV11戏曲"
           },
           {
             "address": "http://shbu.live.bestvcdn.com.cn:8080/live/program/live/cctv12/1300000/mnf.m3u8",
             "img": "http://cdn.youlxodxka.live/img/12.jpg",
             "title": "CCTV12社会与法"
           },
           {
             "address": "http://111.40.196.30/PLTV/88888888/224/3221225504/index.m3u8",
             "img": "http://cdn.youlxodxka.live/img/13.jpg",
             "title": "CCTV13新闻"
           },
           {
             "address": "http://shbu.live.bestvcdn.com.cn:8080/live/program/live/cctvsehd/4000000/mnf.m3u8",
             "img": "http://cdn.youlxodxka.live/img/14.jpg",
             "title": "CCTV14少儿"
           },
           {
             "address": "http://shbu.live.bestvcdn.com.cn:8080/live/program/live/cctvyy/1300000/mnf.m3u8",
             "img": "http://cdn.youlxodxka.live/img/15.jpg",
             "title": "CCTV15音乐"
           },
           {
             "address": "http://117.148.179.167/PLTV/88888888/224/3221231772/index.m3u8",
             "img": "http://cdn.youlxodxka.live/img/17.jpg",
             "title": "CCTV17农村"
           },
           {
             "address": "http://hw-m-l.cztv.com/channels/lantian/channel01/1080p.m3u8",
             "img": "http://cdn.youlxodxka.live/img/zj.jpg",
             "title": "浙江卫视"
           },
           {
             "address": "http://shbu.live.bestvcdn.com.cn:8080/live/program/live/hddfws/2300000/mnf.m3u8",
             "img": "http://cdn.youlxodxka.live/img/df.jpg",
             "title": "东方卫视"
           },
           {
             "address": "http://shbu.live.bestvcdn.com.cn:8080/live/program/live/hnwshd/2300000/mnf.m3u8",
             "img": "http://cdn.youlxodxka.live/img/hn.jpg",
             "title": "湖南卫视"
           },
           {
             "address": "http://shbu.live.bestvcdn.com.cn:8080/live/program/live/jswshd/2300000/mnf.m3u8",
             "img": "http://cdn.youlxodxka.live/img/js.jpg",
             "title": "江苏卫视"
           },
           {
             "address": "http://live.xmcdn.com/live/1040/64.m3u8",
             "img": "http://cdn.youlxodxka.live/img/dt.png",
             "title": "环球资讯广播"
           },
           {
             "address": "http://live.xmcdn.com/live/1043/64.m3u8",
             "img": "http://cdn.youlxodxka.live/img/dt.png",
             "title": "中文环球广播"
           },
           {
             "address": "http://ls.qingting.fm/live/386.m3u8",
             "img": "http://cdn.youlxodxka.live/img/dt.png",
             "title": "中国之声"
           }
         ]
         **/
        
        self.playerView = WYPlayerView.init(frame: self.view.bounds)
        self.playerView.play(url: "http://117.148.179.136/PLTV/88888888/224/3221231468/index.m3u8")
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
