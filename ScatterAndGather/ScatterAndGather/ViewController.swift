//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Jordan Christensen on 9/11/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var firstALabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    
    var lCenter: CGPoint?
    var firstACenter: CGPoint?
    var mCenter: CGPoint?
    var bCenter: CGPoint?
    var dCetner: CGPoint?
    var secondACenter: CGPoint?
    
    var isScattered = false
    
    var lambda = UIColor(red:0.79, green:0.00, blue:0.14, alpha:1.00)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        savePositions()
        setUI()
    }
    
    func setUI() {
        navigationController?.navigationBar.barTintColor = UIColor(red:0.79, green:0.00, blue:0.14, alpha:1.00)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func savePositions() {
        lCenter = lLabel.center
        firstACenter = firstALabel.center
        mCenter = mLabel.center
        bCenter = bLabel.center
        dCetner = dLabel.center
        secondACenter = secondALabel.center
        
        lLabel.layer.cornerRadius = 8
        firstALabel.layer.cornerRadius = 8
        mLabel.layer.cornerRadius = 8
        bLabel.layer.cornerRadius = 8
        dLabel.layer.cornerRadius = 8
        secondALabel.layer.cornerRadius = 8
    }
    
    func returnPositions() {
        guard let l = lCenter, let firstA = firstACenter, let m = mCenter, let b = bCenter, let d = dCetner, let secondA = secondACenter else { return }
        UIView.animate(withDuration: 1.5) {
            self.lLabel.center = l
            self.lLabel.textColor = self.lambda
            self.firstALabel.center = firstA
            self.firstALabel.textColor = self.lambda
            self.mLabel.center = m
            self.mLabel.textColor = self.lambda
            self.bLabel.center = b
            self.bLabel.textColor = self.lambda
            self.dLabel.center = d
            self.dLabel.textColor = self.lambda
            self.secondALabel.center = secondA
            self.secondALabel.textColor = self.lambda
            
            self.lLabel.transform = .identity
            self.firstALabel.transform = .identity
            self.mLabel.transform = .identity
            self.bLabel.transform = .identity
            self.dLabel.transform = .identity
            self.secondALabel.transform = .identity
            
            self.lambdaLogoImageView.alpha = 1.00
        }
        lLabel.backgroundColor = .clear
        firstALabel.backgroundColor = .clear
        mLabel.backgroundColor = .clear
        bLabel.backgroundColor = .clear
        dLabel.backgroundColor = .clear
        secondALabel.backgroundColor = .clear
    }
    
    func getRandomX() -> Int {
        // Returns a range of X: -75-305 to fit on screen. I got these numbers from just playing around with them to see what keeps the labels on the screen
        return Int.random(in: -75...305)
    }
    
    func getRandomY() -> Int {
        // Returns a range of Y: -200-450 to fit on screen
        return Int.random(in: -200...450)
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1.0)
    }
    
    @IBAction func toggleButtonTapped(_ sender: UIBarButtonItem) {
        if (!isScattered) {
            UIView.animate(withDuration: 1.5) {
                self.lambdaLogoImageView.alpha = 0.00
                
                self.lLabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                self.firstALabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                self.mLabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                self.bLabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                self.dLabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                self.secondALabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                
                
                
                self.lLabel.textColor = self.randomColor()
                self.lLabel.backgroundColor = self.randomColor()
                self.firstALabel.textColor = self.randomColor()
                self.firstALabel.backgroundColor = self.randomColor()
                self.mLabel.textColor = self.randomColor()
                self.mLabel.backgroundColor = self.randomColor()
                self.bLabel.textColor = self.randomColor()
                self.bLabel.backgroundColor = self.randomColor()
                self.dLabel.textColor = self.randomColor()
                self.dLabel.backgroundColor = self.randomColor()
                self.secondALabel.textColor = self.randomColor()
                self.secondALabel.backgroundColor = self.randomColor()
                
            }
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                    self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: 0...4))
                    self.firstALabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: 0...8))
                    self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: 0...4))
                    self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: 0...4))
                    self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: 0...4))
                    self.secondALabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: 0...4))
                })
            }, completion: nil)
        } else {
            returnPositions()
        }
        isScattered = !isScattered
    }
}

