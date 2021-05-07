//
//  ViewController.swift
//  sliderMobile
//
//  Created by 羅承志 on 2021/4/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var doorImageView: UIImageView!
    @IBOutlet weak var doraAmonImageView: UIImageView!
    @IBOutlet weak var bigBearImageView: UIImageView!
    @IBOutlet weak var shizukaImageView: UIImageView!
    @IBOutlet weak var bigTigerImageView: UIImageView!
    @IBOutlet weak var husbandImageView: UIImageView!
    
    //bigBear飛行func
    func updateLocation(degrees: CGFloat) {
        bigBearImageView.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi / 180 * degrees).translatedBy(x: 0, y: -230)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //漸層背景色
        let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            gradientLayer.colors = [
                UIColor(red: 0, green: 115/255, blue: 230/255, alpha: 0.6).cgColor,
                UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 0.6).cgColor
            ]
        //insertSubLayer置於最底層，如使addSubLayer將置於頂層。
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //bigBear飛行起點
        updateLocation(degrees: 270)
    }
    
    //水平移動設定(+:左至右, -:右至左)
    @IBAction func sliderChange(_ sender: UISlider) {
        let speed = sender.value * 1.5
        doorImageView.frame.origin.x = CGFloat(100 + speed)
        doraAmonImageView.frame.origin.x = CGFloat(600 - speed)
        
        //照片透明度
        shizukaImageView.alpha = CGFloat(sender.value / 180)
        bigTigerImageView.alpha = CGFloat(sender.value / 180)
        husbandImageView.alpha = CGFloat(sender.value / 180)
        bigBearImageView.alpha = CGFloat(sender.value / 180)
        
        //飛半圓形sender.value/2，若飛圓形無需/2
        updateLocation(degrees: CGFloat(sender.value / 2) + 270)
    }
    
}

