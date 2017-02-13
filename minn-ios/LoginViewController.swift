
/**
 * @author minn
 * @QQ:3942986006
 */
import UIKit

class LoginViewController: UIViewController {

    var  loginHttpService:HttpService=HttpService();
    
    @IBOutlet weak var username:UITextField!
    
     @IBOutlet var password:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction()->Void{

        let usernametxt=username.text!;
        let passsordtxt=password.text!;
        if(usernametxt==""||passsordtxt==""){
            let alertview=UIAlertController(title: "提示",message: "用户名或密码不能为空",
                preferredStyle:UIAlertControllerStyle.Alert);
            let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default, handler: nil)
            alertview.addAction(okAction)
            self.presentViewController(alertview, animated: true, completion: nil);
            return;
        }
     
         loginHttpService.post2("j_spring_security_check",param: "username="+username.text!+"&password="+password.text!,callback:onInvoke);

    }
    
    func onInvoke(result:AnyObject)->Void{
        if((result.valueForKey("success") as! Int)==0){
         
            let alertview=UIAlertController(title: "提示",message: result.valueForKey("data") as? String,
                                            preferredStyle:UIAlertControllerStyle.Alert);
                       let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default, handler: nil)
            alertview.addAction(okAction)
            self.presentViewController(alertview, animated: true, completion: nil);
        }else{
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle());
        let mainViewController:MainViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("mainId")as! MainViewController;
        self.showViewController(mainViewController, sender: nil)
        }
    }
    
    
}

