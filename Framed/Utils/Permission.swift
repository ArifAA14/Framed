//
//  Permission.swift
//  MyFirst
//
//  Created by Ali on 21/11/2024.
//

import AVFoundation

func requestScreenRecordingPermission () async throws {
    let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
    if authStatus == .denied {
        throw NSError(domain: "ScreenCaptureKit", code: -1, userInfo: [NSLocalizedDescriptionKey: "Screen recording permission denied."])

    }
    
    if authStatus == .notDetermined {
        await AVCaptureDevice.requestAccess(for: .video) { granted in
            if !granted {
                print("User declined screen recording permission.")
            }
        }
    }
}
