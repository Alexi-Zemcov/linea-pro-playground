//
//  ViewController.swift
//  lineaproplayground
//
//  Created by Alexey on 5/26/22.
//

import UIKit

class ViewController: UIViewController, DTDeviceDelegate {
    
    private let scanner : DTDevices = DTDevices()
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Check state", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        self.scanner.delegate = self
        self.scanner.connect()

        super.viewDidLoad()

        view.addSubview(button)
        button.addTarget(
            self,
            action: #selector(didTapButton),
            for: .touchUpInside
        )
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 30,
            y:view.frame.size.height-65-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 50
        )
    }
    
    @objc func didTapButton(){
         checkConnectionState()
     }
    func checkConnectionState(){
        let variable = self.scanner.btConnectedDevices
        
        
        
        if self.scanner.connstate == 2 {
            /*
                CONNECTED
            */
            self.button.setTitle("Connected", for: .normal)
        } else if self.scanner.connstate == 1{
            /*
                NOT CONNECTED AND WILL NOT TRY TO EITHER (Your accessory is probably not attached
            */
            self.button.setTitle("Not connected at all", for: .normal)
        } else {
            /*
                CONNECTING
            */
            self.button.setTitle("Trying to connect", for: .normal)
        }
    }
    
}

