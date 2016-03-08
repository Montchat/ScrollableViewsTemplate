//
//  ViewController.swift
//  ScrollableViewsTemplate
//
//  Created by Joe E. on 3/8/16.
//  Copyright © 2016 Joe Edwards. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //* use xib files to customize how you want the ui for each screen to work
    
    //adding our three default viewControllers to our scrollView
    let vc1 = VC1(nibName: "VC1", bundle: nil) ; let vc2 = VC2(nibName: "VC2", bundle: nil) ; let vc3 = VC3(nibName: "VC3", bundle: nil)
    
    let swipeGestureRecognizer = UISwipeGestureRecognizer() //adding ability to be able to do stuff if you want to swipe. you can get creative with this
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    func swipe(swipe:UISwipeGestureRecognizer) {
        if (swipe.state == .Began && swipe.direction == .Left) || (swipe.state == .Began && swipe.direction == .Right) {
            
        }
        
        if swipe.state == .Ended { }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSide = UIView(frame: view.frame) ; let rightSide = UIView(frame: view.frame)
        
        leftSide.frame.origin = view.frame.origin ; leftSide.backgroundColor = vc1.view.backgroundColor
        rightSide.frame.origin.x = view.frame.midX ; rightSide.backgroundColor = vc3.view.backgroundColor
        
        view.addSubview(leftSide); view.addSubview(rightSide)
        
        scrollView.addSubview(vc1.view) ; scrollView.addSubview(vc2.view) ; scrollView.addSubview(vc3.view)
        view.bringSubviewToFront(scrollView)
        
        vc2.view.frame.origin.x = view.frame.width ; vc3.view.frame.origin.x = view.frame.width * 2
        
        //Adjusting the size of the scrollViews
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: view.frame.height)
        //Set the views so that the main view is in the middle and the login and signUp are on the left and right respectively.
        scrollView.setContentOffset(vc2.view.frame.origin, animated: false)
        
        //Setting the delegates of the GestureRecoginzers above
        swipeGestureRecognizer.delegate = self
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController : UIGestureRecognizerDelegate {
    
}
