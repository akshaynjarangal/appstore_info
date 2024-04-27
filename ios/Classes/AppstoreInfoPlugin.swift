import Flutter
import UIKit
import StoreKit

public class AppstoreInfoPlugin: NSObject, FlutterPlugin, SKStoreProductViewControllerDelegate {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "appstore_info", binaryMessenger: registrar.messenger())
        let instance = AppstoreInfoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "presentAppStore":
            if let arguments = call.arguments as? [String: Any],
               let appID = arguments["appID"] as? String {
                presentAppStore(appID: appID, result: result)
            } else {
                result(FlutterError(code: "INVALID_PARAMETERS", message: "Invalid parameters", details: nil))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func presentAppStore(appID: String, result: @escaping FlutterResult) {
    let storeProductViewController = SKStoreProductViewController()

    let parameters = [SKStoreProductParameterITunesItemIdentifier: appID]

    storeProductViewController.loadProduct(withParameters: parameters) { (loaded, error) -> Void in
        if loaded {
            // Product loaded successfully
            if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
                // Present SKStoreProductViewController modally
                rootViewController.present(storeProductViewController, animated: true, completion: nil)
                result(true)
            } else {
                // Unable to present SKStoreProductViewController
                print("Error: Unable to find root view controller.")
                result(false)
            }
        } else {
            // Product loading failed
            if let error = error {
                print("Error loading product: \(error.localizedDescription)")
            } else {
                print("Unknown error loading product.")
            }
            result(false)
        }
    }
}

}
