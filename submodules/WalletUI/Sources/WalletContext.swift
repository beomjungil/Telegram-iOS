import Foundation
import UIKit
import SwiftSignalKit
import Display
import WalletCore

public enum WalletContextGetServerSaltError {
    case generic
}

public protocol WalletContext {
    var storage: WalletStorageInterface { get }
    var tonInstance: TonInstance { get }
    var keychain: TonKeychain { get }
    var presentationData: WalletPresentationData { get }
    
    var supportsCustomConfigurations: Bool { get }
    
    var inForeground: Signal<Bool, NoError> { get }
    
    func getServerSalt() -> Signal<Data, WalletContextGetServerSaltError>
    
    func presentNativeController(_ controller: UIViewController)
    
    func idleTimerExtension() -> Disposable
    func openUrl(_ url: String)
    func shareUrl(_ url: String)
    func openPlatformSettings()
    func authorizeAccessToCamera(completion: @escaping () -> Void)
    func pickImage(present: @escaping (ViewController) -> Void, completion: @escaping (UIImage) -> Void)
}