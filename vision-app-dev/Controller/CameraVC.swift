//
//  ViewController.swift
//  vision-app-dev
//
//  Created by Austin Rightnowar on 4/3/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController {
    
    var captureSession: AVCaptureSession!
    var cameraOutput: AVCapturePhotoOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    var photoData = Data?.self
    
    // O U T L E T S
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var captureImageView: RoundedShadowImageView!
    @IBOutlet weak var flashBtn: RoundedShadowButton!
    @IBOutlet weak var identificationLbl: UILabel!
    @IBOutlet weak var confidenceLbl: UILabel!
    @IBOutlet weak var roundedLblView: RoundedShadowView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDevice()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer.frame = cameraView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapCameraView))
//        tap.numberOfTapsRequired = 1
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        
        func setupDevice() {
            let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera!)
            if captureSession.canAddInput(input) == true {
                captureSession.addInput(input)
            }
            
            cameraOutput = AVCapturePhotoOutput()
            
            if captureSession.canAddOutput(cameraOutput) == true {
                captureSession.addOutput(cameraOutput!)
            }
            
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
            previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
            
            cameraView.layer.addSublayer(previewLayer!)
            captureSession.startRunning()
        } catch {
            debugPrint(error)
        }
    }
//    @objc func didTapCameraView() {
//        let settings = AVCapturePhotoSettings()
//        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
//        let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType, kCVPixelBufferWidthKey as String: 160, kCVPixelBufferHeightKey as String: 160]
//
//        settings.previewPhotoFormat = previewFormat
//
//        cameraOutput.capturePhoto(with: settings, delegate: self)
    


}

//extension CameraVC: AVCapturePhotoCaptureDelegate {
//        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//            if let error = error {
//                debugPrint(error)
//            } else {
//                photoData = photo.fileDataRepresentation()
//
//                let image = UIImage(data: photoData!)
//                self.captureImageView.image = image
//            }
//    }
//}
