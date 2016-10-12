//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Poudel, Trilochan on 10/6/16.
//  Copyright © 2016 Stars99. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {
    
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rescheduleView: UIImageView!
    
    @IBOutlet weak var deleteIcon: UIImageView!
    
    var rescheduleViewImage: CGPoint!
    
    //Message View original center
    var messageViewOriginalCenter: CGPoint!

    //Message view outlet
    @IBOutlet weak var messageView: UIImageView!
    
    //Out let for  mailbox scrollview
    @IBOutlet weak var mailBoxScrollView: UIScrollView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mailBoxScrollView.contentSize = CGSize(width: 375, height: 1518)
        rescheduleView.alpha = 0
        deleteIcon.isHidden = true
        
        
    }
    
    //Action for pan gesture
    @IBAction func didPanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        
        if sender.state == .began {
            messageViewOriginalCenter = messageView.center

            }
 

else if sender.state == .changed {
            self.messageView.center = CGPoint(x: self.messageViewOriginalCenter.x + translation.x, y: self.messageViewOriginalCenter.y)
         
            
          if  translation.x < 60 {
            let backgroundColor = UIColor.yellow
           
             rightImage.backgroundColor = backgroundColor
            
             self.rescheduleView.alpha = 0.5
          }
            
           else if translation.x < 250 {
            let backgroundColor1 = UIColor.green
            rightImage.backgroundColor = backgroundColor1
            }
            
            
          else if translation.x < 255 {
            let backGroundColorRed = UIColor.red
           rightImage.backgroundColor = backGroundColorRed
              deleteIcon.isHidden = false
            
            }
         
            
        }
        
        
        else if sender.state == .ended {
                UIView.animateKeyframes(withDuration: 0.5, delay: 0.1, options: [], animations: { 
                self.messageView.center = self.messageViewOriginalCenter
                    
                    self.rescheduleView.alpha = 1
                    
                    }, completion: { (Bool) in
                        
                        
               UIView.animateKeyframes(withDuration: 1.0, delay: 1.0, options: [], animations:  {
                
                 self.rescheduleView.alpha = 0.3
                 self.rescheduleView.isHidden = true
                
                 self.rescheduleView.alpha = 0.01
                            
                    })


                })
            
        
    }
}

}

