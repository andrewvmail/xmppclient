import UIKit
import ZKCarousel
import paper_onboarding

class WelcomePageController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        controller().navigation.isNavigationBarHidden = true
    }

    @IBOutlet var skipButton: UIButton! = UIButton()

    fileprivate let items = [
        OnboardingItemInfo(informationImage: Asset.hotels.image,
                title: "Hotels",
                description: "All hotels and hostels are sorted by hospitality rating",
                pageIcon: Asset.key.image,
                color: UIColor(red: 0.40, green: 0.56, blue: 0.71, alpha: 1.00),
                titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),

        OnboardingItemInfo(informationImage: Asset.banks.image,
                title: "Banks",
                description: "We carefully verify all banks before add them into the app",
                pageIcon: Asset.wallet.image,
                color: UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00),
                titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),

        OnboardingItemInfo(informationImage: Asset.stores.image,
                title: "Stores",
                description: "All local stores are categorized for your convenience",
                pageIcon: Asset.shoppingCart.image,
                color: UIColor(red: 0.61, green: 0.56, blue: 0.74, alpha: 1.00),
                titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        skipButton.isHidden = true

        setupPaperOnboardingView()

        skipButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.frame = CGRect(x: view.bounds.maxX - 100, y: 0, width: 100, height: 100)
        skipButton.addTarget(self, action: #selector(self.skipButtonTapped(_:)), for: .touchUpInside)
        skipButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        view.addSubview(skipButton)
        view.bringSubviewToFront(skipButton)
    }

    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)

        // Add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                    attribute: attribute,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: attribute,
                    multiplier: 1,
                    constant: 0)
            view.addConstraint(constraint)
        }
    }
}

// MARK: Actions
extension WelcomePageController {

    @IBAction func skipButtonTapped(_: UIButton) {
        run(sequence: navSequence, name: "nav", props: "PhoneVerificationPage")
    }
}

// MARK: PaperOnboardingDelegate
extension WelcomePageController: PaperOnboardingDelegate {

    func onboardingWillTransitonToIndex(_ index: Int) {
        skipButton.isHidden = index == 2 ? false : true
    }

    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {

        // configure item

        //item.titleLabel?.backgroundColor = .redColor()
        //item.descriptionLabel?.backgroundColor = .redColor()
        //item.imageView = ...
    }
}

// MARK: PaperOnboardingDataSource
extension WelcomePageController: PaperOnboardingDataSource {

    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return items[index]
    }

    func onboardingItemsCount() -> Int {
        return 3
    }

    //    func onboardinPageItemRadius() -> CGFloat {
    //        return 2
    //    }
    //
    //    func onboardingPageItemSelectedRadius() -> CGFloat {
    //        return 10
    //    }
    //    func onboardingPageItemColor(at index: Int) -> UIColor {
    //        return [UIColor.white, UIColor.red, UIColor.green][index]
    //    }
}


//MARK: Constants
private extension WelcomePageController {

    static let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
    static let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
}

// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen
#if os(OSX)
import AppKit.NSImage
internal typealias AssetColorTypeAlias = NSColor
internal typealias AssetImageTypeAlias = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
import UIKit.UIImage
internal typealias AssetColorTypeAlias = UIColor
internal typealias AssetImageTypeAlias = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length
// MARK: - Asset Catalogs
// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
    internal static let banks = ImageAsset(name: "Banks")
    internal static let hotels = ImageAsset(name: "Hotels")
    internal static let key = ImageAsset(name: "Key")
    internal static let shoppingCart = ImageAsset(name: "Shopping-cart")
    internal static let stores = ImageAsset(name: "Stores")
    internal static let wallet = ImageAsset(name: "Wallet")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name
// MARK: - Implementation Details
internal struct ColorAsset {
    internal fileprivate(set) var name: String

    #if swift(>=3.2)
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
    internal var color: AssetColorTypeAlias {
        return AssetColorTypeAlias(asset: self)
    }
    #endif
}

internal extension AssetColorTypeAlias {
    #if swift(>=3.2)
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
    convenience init!(asset: ColorAsset) {
        let bundle = Bundle(for: BundleToken.self)
        #if os(iOS) || os(tvOS)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(OSX)
        self.init(named: asset.name, bundle: bundle)
        #elseif os(watchOS)
        self.init(named: asset.name)
        #endif
    }
    #endif
}

internal struct DataAsset {
    internal fileprivate(set) var name: String

    #if (os(iOS) || os(tvOS) || os(OSX)) && swift(>=3.2)
    @available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
    internal var data: NSDataAsset {
        return NSDataAsset(asset: self)
    }
    #endif
}

#if (os(iOS) || os(tvOS) || os(OSX)) && swift(>=3.2)
@available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
internal extension NSDataAsset {
    convenience init!(asset: DataAsset) {
        let bundle = Bundle(for: BundleToken.self)
        self.init(name: asset.name, bundle: bundle)
    }
}
#endif

internal struct ImageAsset {
    internal fileprivate(set) var name: String

    internal var image: AssetImageTypeAlias {
        let bundle = Bundle(for: BundleToken.self)
        #if os(iOS) || os(tvOS)
        let image = AssetImageTypeAlias(named: name, in: bundle, compatibleWith: nil)
        #elseif os(OSX)
        let image = bundle.image(forResource: name)
        #elseif os(watchOS)
        let image = AssetImageTypeAlias(named: name)
        #endif
        guard let result = image else { fatalError("Unable to load image named \(name).") }
        return result
    }
}

internal extension AssetImageTypeAlias {
    @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
    @available(OSX, deprecated,
               message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    convenience init!(asset: ImageAsset) {
        #if os(iOS) || os(tvOS)
        let bundle = Bundle(for: BundleToken.self)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(OSX) || os(watchOS)
        self.init(named: asset.name)
        #endif
    }
}

private final class BundleToken {}
