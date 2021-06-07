//
//  popUpViewController.swift
//  memorygame
//
//  Created by user196688 on 5/31/21.
//

import UIKit

class popUpViewController: UIViewController {
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DoneButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    @objc func buttonAction(sender: UIButton!){
        let textValue = textField.text
        UserDefaults.standard.setValue(textValue, forKey: "scoreBoardName")
        if(textValue != ""){
            CollectionViewController().gameDone()
        }
        BackToMenu()
    }
    func BackToMenu(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "FirstController")as! FirstController
        self.addChild(controller)
        controller.view.frame = self.view.frame
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
    }

            
}
