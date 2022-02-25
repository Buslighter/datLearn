//
//  ViewController.swift
//  hw13 Animations
//
//  Created by gleba on 17.02.2022.
//

import UIKit

class ViewController: UIViewController {
    var id : Int = 1
    var constraintsAreOn = true
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var axisConstraint: NSLayoutConstraint!
    @IBOutlet var mainView: UIView!
        func animations(){
        let mainWidth = CGFloat(self.redSquare.frame.width)/2
            let w = self.view.layer.frame.width
        switch id{
        case 1:
            self.redSquare.layer.removeAllAnimations()
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.redSquare.backgroundColor = UIColor.yellow
            }, completion: {
                (isCompleted) in
                self.redSquare.backgroundColor = UIColor.red
            })
        case 2:
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.topConstraint.constant = 0
                self.axisConstraint.constant = w/2-self.redSquare.frame.size.width/2
                self.view.layoutIfNeeded()
            }, completion: {
                (isCompleted) in
                self.topConstraint.constant = 90
                self.axisConstraint.constant = 0
                
            })
            
        case 3:
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.redSquare.layer.cornerRadius = mainWidth
            }, completion: {
                (isCompleted) in
                self.redSquare.layer.cornerRadius = 0
            })
        case 4:
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse,animations: {
                self.redSquare.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi))
                
                
            }, completion: {
                (isCompleted) in
                self.redSquare.transform = CGAffineTransform(rotationAngle: 0)
                
            })
        case 5:
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.redSquare.alpha = 0
            }, completion: {
                (isCompleted) in
                self.redSquare.alpha = 1
            })
        case 6:
            self.redSquare.layer.removeAllAnimations()
            let widthCon = self.widthConstraint.constant
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.widthConstraint.constant = widthCon*2
                self.view.layoutIfNeeded()
            }, completion: {
                (isCompleted) in
                
                self.widthConstraint.constant = widthCon
                

            })
        case 7:
            UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat],animations: {
                self.redSquare.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi))
                
                
            }, completion: {
                (isCompleted) in
                
                self.redSquare.transform = CGAffineTransform(rotationAngle: 0)
                
            })
        default:
            print("error")
        }
    
    }
    
    @IBOutlet weak var CurrentNumberOfAnimation: UILabel!
    @IBAction func NextAnimation(_ sender: Any) {
        if id<7{
            id+=1} else{id = 1}
        animations()
    }
    @IBAction func PreviousAnimation(_ sender: Any) {
        if id>1{
            id-=1} else{id = 7}
        animations()
    }
    @IBOutlet weak var redSquare: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animations()
        
        // Do any additional setup after loading the view.
    }


}

