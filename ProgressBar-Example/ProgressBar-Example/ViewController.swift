import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar1: ProgressBar!
    @IBOutlet weak var progressBar2: ProgressBar!
    @IBOutlet weak var progressBar3: ProgressBar!
    @IBOutlet weak var progressBar4: ProgressBar!
    @IBOutlet weak var progressBar5: ProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.dance()
    }

    private func dance(){
        self.progressBar1.allGrey()
        self.progressBar2.allGreen()
        self.progressBar3.startLoading()
        self.progressBar4.startLoadingReverse()
        self.progressBar5.allGreenReverse()
    }

}

