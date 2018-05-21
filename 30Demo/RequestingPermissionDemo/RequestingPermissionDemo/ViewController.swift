//
//  ViewController.swift
//  RequestingPermissionDemo
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit
import CoreLocation
import Photos
import AVFoundation
import Contacts

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
//    let photoManager = PHImageManager()
    let microManager = AVAudioSession.sharedInstance()
    let contactManager = CNContactStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestLocationAction(_ sender: UIButton) {
        let status = CLLocationManager.authorizationStatus()
        if status == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        if status == .denied || status == .restricted {
            let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
        
    }
    
    @IBAction func requestMicrophoneAction(_ sender: UIButton) {
        microManager.requestRecordPermission { (i) in
            debugPrint(i)
        }
    }
    
    @IBAction func requestCameraAction(_ sender: UIButton) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status == .notDetermined {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (i) in
                debugPrint(i)
            })
            return
        }
        if status == .denied || status == .restricted {
            if status == .denied || status == .restricted {
                let alert = UIAlertController(title: "Camera Services Disabled", message: "Please enable Camera Services in Settings", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                
                present(alert, animated: true, completion: nil)
                return
            }
        }
    
    }
    
    @IBAction func requestPhotoAction(_ sender: UIButton) {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) in
                debugPrint(status)
            })
            return
        }
        if status == .denied || status == .restricted {
            let alert = UIAlertController(title: "Photo Services Disabled", message: "Please enable Photo Services in Settings", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
    }
    
    @IBAction func requestContactAction(_ sender: UIButton) {
        let status = CNContactStore.authorizationStatus(for: .contacts)
        if status == .notDetermined {
            contactManager.requestAccess(for: .contacts, completionHandler: { (i, error) in
                guard error == nil else {
                    debugPrint(error!)
                    return
                }
                debugPrint(i)
            })
        }
        if status == .denied || status == .restricted {
            let alert = UIAlertController(title: "Contacts Services Disabled", message: "Please enable Contacts Services in Settings", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
    }
    
    
}

