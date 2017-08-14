import UIKit

class ProgressBar: UIView {
    
    private let arrowGreenImage = UIImage(named: "arrowGreen")
    private let arrowGrayImage = UIImage(named: "arrowGray")
    internal var myFrame: CGRect?
    private var images:[UIImageView] = []
    private let gapSize:CGFloat = 8.0
    private var viewHeight:CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.myFrame = frame
        initializeSubviews()
    }
    
    func initializeSubviews() {
        self.layoutIfNeeded()
        if myFrame == nil{
            myFrame = self.frame
        }
        viewHeight = myFrame?.height
        self.backgroundColor = UIColor.white
        let frameWidth = UIScreen.main.bounds.width * (myFrame?.width)! / 375
        let imageViewSize = Int(frameWidth / gapSize)
        let height = (viewHeight! - 8.0) / 2.0
        var index:CGFloat = 0
        
        for _ in 1...imageViewSize {
            let imageView = UIImageView(image: arrowGrayImage)
            imageView.frame = CGRect(x: Double(index), y: Double(height), width: 6.0, height: 8.0)
            index = index + gapSize
            self.addSubview(imageView)
            images.append(imageView)
        }
    }
    
    func startLoading(){
        var index = 0
        for imageView in images{
            imageView.image = arrowGreenImage
            let imageViewYPosition:CGFloat = ((viewHeight! - 8.0) / 2.0 ) + 4//((myFrame?.height)! - 5) / 2
            let imageViewXPosition = imageView.frame.origin.x
            let animation = CABasicAnimation(keyPath: "position")
            let startingPoint = NSValue(cgPoint: CGPoint(x: imageViewXPosition, y: imageViewYPosition))
            let endingPoint = NSValue(cgPoint: CGPoint(x: imageViewXPosition + gapSize, y: imageViewYPosition))
            animation.fromValue = startingPoint
            animation.toValue = endingPoint
            animation.repeatCount = Float.greatestFiniteMagnitude
            animation.duration = 0.5
            imageView.layer.add(animation, forKey: "linearMovement")
            
            index = index + 1
            if images.count == index{
                let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
                scaleAnimation.fromValue = 1.0
                scaleAnimation.toValue = 0.0
                scaleAnimation.repeatCount = Float.greatestFiniteMagnitude
                scaleAnimation.duration = 0.5
                imageView.layer.add(scaleAnimation, forKey: "scale")
            }
            else if index == 1{
                let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
                scaleAnimation.fromValue = 0.0
                scaleAnimation.toValue = 1.0
                scaleAnimation.repeatCount = Float.greatestFiniteMagnitude
                scaleAnimation.duration = 0.5
                imageView.layer.add(scaleAnimation, forKey: "scale")
            }
        }
        
    }
    
    func startLoadingReverse(){
        var index = 0
        for imageView in images{
            imageView.image = #imageLiteral(resourceName: "arrowBackGreen")
            let imageViewYPosition:CGFloat = ((viewHeight! - 8.0) / 2.0 ) + 4//((myFrame?.height)! - 5) / 2
            let imageViewXPosition = imageView.frame.origin.x
            let animation = CABasicAnimation(keyPath: "position")
            let startingPoint = NSValue(cgPoint: CGPoint(x: imageViewXPosition, y: imageViewYPosition))
            let endingPoint = NSValue(cgPoint: CGPoint(x: imageViewXPosition - gapSize, y: imageViewYPosition))
            animation.fromValue = startingPoint
            animation.toValue = endingPoint
            animation.repeatCount = Float.greatestFiniteMagnitude
            animation.duration = 0.5
            imageView.layer.add(animation, forKey: "linearMovement")
            
            index = index + 1
            if images.count == index{
                let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
                scaleAnimation.fromValue = 0.0
                scaleAnimation.toValue = 1.0
                scaleAnimation.repeatCount = Float.greatestFiniteMagnitude
                scaleAnimation.duration = 0.5
                imageView.layer.add(scaleAnimation, forKey: "scale")
            }
            else if index == 1{
                let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
                scaleAnimation.fromValue = 1.0
                scaleAnimation.toValue = 0.0
                scaleAnimation.repeatCount = Float.greatestFiniteMagnitude
                scaleAnimation.duration = 0.5
                imageView.layer.add(scaleAnimation, forKey: "scale")
            }
        }
        
    }
    
    func allGrey(){
        let height = ((myFrame?.height)! - 8) / 2
        var index:CGFloat = 0
        for imageView in images {
            imageView.image = #imageLiteral(resourceName: "arrowGray")
            imageView.frame = CGRect(x: index, y: height, width: 6.0, height: 8.0)
            index = index + 8
            imageView.layer.removeAllAnimations()
        }
    }
    
    func allGreen(){
        let height = ((myFrame?.height)! - 8) / 2
        var index:CGFloat = 0
        for imageView in images {
            imageView.image = #imageLiteral(resourceName: "arrowGreen")
            imageView.frame = CGRect(x: index, y: height, width: 6.0, height: 8.0)
            index = index + 8
            imageView.layer.removeAllAnimations()
        }
    }
    
    func allGreenReverse(){
        let height = ((myFrame?.height)! - 8) / 2
        var index:CGFloat = 0
        for imageView in images {
            imageView.image = #imageLiteral(resourceName: "arrowBackGreen")
            imageView.frame = CGRect(x: index, y: height, width: 6.0, height: 8.0)
            index = index + 8
            imageView.layer.removeAllAnimations()
        }
    }
}
