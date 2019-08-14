import UIKit
import ZKCarousel

class WelcomePageController: UIViewController {
    let carousel : ZKCarousel = {
        let carousel = ZKCarousel()

        let frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 1920, height: 1080))
        let cgImage = CIContext().createCGImage(CIImage(color: .black), from: frame)!
        let uiImage = UIImage(cgImage: cgImage)

        // Create as many slides as you'd like to show in the carousel
        let slide = ZKCarouselSlide(image: uiImage, title: "Hello There 👻", description: "Welcome to the ZKCarousel demo! Swipe left to view more slides!")
        let slide1 = ZKCarouselSlide(image: uiImage, title: "A Demo Slide ☝🏼", description: "lorem ipsum devornum cora fusoa foen sdie ha odab ebakldf shjbesd ljkhf")
        let slide2 = ZKCarouselSlide(image: uiImage, title: "Another Demo Slide ✌🏼", description: "lorem ipsum devornum cora fusoa foen ebakldf shjbesd ljkhf")

        // Add the slides to the carousel
        carousel.slides = [slide, slide1, slide2]

        return carousel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.carousel.frame = CGRect()
//
        self.view.addSubview(self.carousel)

//        WelcomePageView(self: self)

        self.view.backgroundColor = .lightGray;
    }
}

