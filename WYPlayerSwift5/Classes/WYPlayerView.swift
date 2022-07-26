//
//  WYPlayerView.swift
//  playLive
//
//  Created by macWangYuan on 2022/7/25.
//

import UIKit

import IJKMediaFramework

class WYPlayerView: UIView {
    public var url:URL?
    var player:IJKFFMoviePlayerController?
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initCommon()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initCommon()
    }
    
    func initCommon() {
        self.toPlay()
        
    }
    
    public func play(url:String) {
        if url.hasPrefix("http") || url.hasPrefix("rtmp") {
            self.url = URL.init(string: url)
        }
        else {
            self.url = URL.init(fileURLWithPath: url)
        }
        self.toPlay()
    }
    
    func toPlay() {
        IJKFFMoviePlayerController.checkIfFFmpegVersionMatch(true)
        
        guard let options = IJKFFOptions.byDefault() else {
            return
        }
        
        // 开启硬解码
        options.setPlayerOptionValue("1", forKey: "videotoolbox")

        // 帧速率(fps) （可以改，确认非标准桢率会导致音画不同步，所以只能设定为15或者29.97）
        options.setPlayerOptionIntValue(Int64(29.94), forKey: "r")

        // -vol——设置音量大小，256为标准音量。（要设置成两倍音量时则输入512，依此类推
        options.setPlayerOptionIntValue(Int64(256), forKey: "vol")

        // 最大fps
        options.setPlayerOptionIntValue(Int64(60), forKey: "max-fps")

        // 跳帧开关
        options.setPlayerOptionIntValue(Int64(0), forKey: "framedrop")

        // 指定最大宽度
        options.setPlayerOptionIntValue(Int64(UIScreen.main.bounds.width), forKey: "videotoolbox-max-frame-width")

        // 自动转屏开关
        options.setPlayerOptionIntValue(Int64(0), forKey: "auto_convert")

        // 重连次数
        options.setFormatOptionIntValue(Int64(1), forKey: "reconnect")

        // 超时时间，timeout参数只对http设置有效，若果你用rtmp设置timeout，ijkplayer内部会忽略timeout参数。rtmp的timeout参数含义和http的不一样。
        options.setFormatOptionIntValue(Int64(30 * 1000 * 1000), forKey: "timeout")
        
//        options?.setValue("ijklas", forKey: "iformat")
//        options?.setValue("ijklas", forKey: "iformat")
//        options?.setValue("ijklas", forKey: "iformat")
        guard let url = self.url else {
            return
        }
        self.player?.view.removeFromSuperview()
        self.player = IJKFFMoviePlayerController.init(contentURL: url, with: options)
        self.player?.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        self.player?.view.frame = self.bounds
        self.player?.scalingMode = .aspectFit
        self.player?.shouldAutoplay = true;
        self.autoresizesSubviews = true
        if let view = self.player?.view {
            self.backgroundColor = .clear
            self.addSubview(view)
        }
        
    }
    
    public func prepareToPlay() {
        self.player?.prepareToPlay()
    }
    
    public func pause() {
        self.player?.pause()
        self.player?.stop()
        self.player?.shutdown()
        self.player?.view.removeFromSuperview()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
