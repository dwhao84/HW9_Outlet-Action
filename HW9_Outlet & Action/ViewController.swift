//
//  ViewController.swift
//  HW9_Outlet & Action
//
//  Created by Dawei Hao on 2023/3/7.
//

import UIKit
import AVFAudio

class ViewController: UIViewController, UITextFieldDelegate {
    
    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var buyer: UITextField!
    @IBOutlet weak var buyerCity: UITextField!
    @IBOutlet weak var buyerPing: UITextField!
    @IBOutlet weak var blessingWord: UITextView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var shareBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var speakButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func transformText(_ sender: Any) {
        print("sucess")
        if buyer == nil {
            buyer.text = ""
            buyer.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            print(buyer.text!)
        }
        if buyerCity == nil {
            buyerCity.text = ""
            buyerCity.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            print(buyerCity.text!)
        }
        if buyerPing == nil {
            buyerPing.text = ""
            buyerPing.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            print(buyerPing.text!)
        }
        blessingWord.text = ("恭喜您，\(buyer.text!)!\n恭喜您買了一間位在\(buyerCity.text!)\(buyerPing.text!)坪的房子。\n買房子是一個重要的里程碑，代表著您追求夢想和安定生活的決心和勇氣。\n願您的新家充滿快樂、和諧和溫馨，也祝福您在這裡創造出更多美好的回憶和成就。")
        
        print(blessingWord.text!)
    }
    
    @IBAction func showFireWork(_ sender: Any) {
        print("sucess")
        let imageView = UIImageView(frame:CGRect(x: 0, y: 50, width: 390, height: 300))   //Call ImageView
        imageView.contentMode = .scaleToFill                       //contentMode for ImageView
        view.addSubview(imageView) //add imageView
        var images = [UIImage]()
        for i in 1...9 {
            images.append(UIImage(named: "fireWork_\(i)")!)
        }
        imageView.animationImages = images
        imageView.animationRepeatCount = 2
        imageView.animationDuration = 1.5
        imageView.startAnimating()
    }
    
    
    @IBAction func speakContent(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: blessingWord.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 0.9
        synthesizer.speak(utterance)
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        let text = "My Dream Inspire"
            let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            present(activityViewController, animated: true, completion: nil)
        }
    }


