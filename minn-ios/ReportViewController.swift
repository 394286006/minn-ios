
/**
 * @author minn
 * @QQ:3942986006
 */
import UIKit


class ReportViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         let url = NSURL(string: "http://fmfl.iteye.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)

   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}