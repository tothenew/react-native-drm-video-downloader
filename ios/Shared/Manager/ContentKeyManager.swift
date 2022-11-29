/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 The `ContentKeyManager` class configures the instance of `AVContentKeySession` to use for requesting content keys
 securely for playback or offline use.
 */

import AVFoundation

class ContentKeyManager {
    
    // MARK: Types.
    
    /// The singleton for `ContentKeyManager`.
    static let shared: ContentKeyManager = ContentKeyManager()
    
    // MARK: Properties.
    
    /// The instance of `AVContentKeySession` that is used for managing and preloading content keys.
    var contentKeySession: AVContentKeySession
    
    /**
     The instance of `ContentKeyDelegate` which conforms to `AVContentKeySessionDelegate` and is used to respond to content key requests from
     the `AVContentKeySession`
     */
    var contentKeyDelegate: ContentKeyDelegate
    
    /// The DispatchQueue to use for delegate callbacks.
    var contentKeyDelegateQueue = DispatchQueue(label: "com.digimed.drmvideodownloader")
    
    // MARK: Initialization.
    
    private init() {
        contentKeySession = AVContentKeySession(keySystem: .fairPlayStreaming)
        contentKeyDelegate = ContentKeyDelegate()
        contentKeySession.setDelegate(contentKeyDelegate, queue: contentKeyDelegateQueue)
    }
    
    func createContentKeySession(){
        contentKeySession = AVContentKeySession(keySystem: .fairPlayStreaming)
        contentKeyDelegate = ContentKeyDelegate()
        contentKeySession.setDelegate(contentKeyDelegate, queue: contentKeyDelegateQueue)
    }
}
