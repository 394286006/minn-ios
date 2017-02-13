
/**
 * @author minn
 * @QQ:3942986006
 */
import UIKit

class MainViewController:UIViewController {
    
    @IBOutlet weak var userMonitor:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logAnalysisAction(){
        
        let alertview=UIAlertController(title: "日志",message: "alert日志测试",
            preferredStyle:UIAlertControllerStyle.Alert)
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default, handler: nil)
        alertview.addAction(cancelAction)
        alertview.addAction(okAction)
        self.presentViewController(alertview, animated: true, completion: nil);
       
    }
    
}
