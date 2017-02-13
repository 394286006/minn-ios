
/**
 * @author minn
 * @QQ:3942986006
 */
import Foundation
import UIKit

public  class HttpService{
    
    
    var HTTPURL:String="http://192.168.1.104:8080/admin/";
    
    
    public  func get(method:String,param:String,callback:(AnyObject)->Void)->Void{
       
        let url: NSURL = NSURL(string: HTTPURL+method+"?"+param)!;
        let request: NSURLRequest = NSURLRequest(URL: url);
        let session: NSURLSession = NSURLSession.sharedSession();
        let dataTask: NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data, response, error)
            in
              var dict:NSDictionary? = nil;
            if(error == nil){
                do {
                    dict  = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.init(rawValue: 0)) as? NSDictionary;

                } catch let error as NSError {
                    dict=["success":0,"data":error.localizedDescription];
                }
                
            }else{
                dict=["success":0,"data":(error?.localizedDescription)!];
            }
            callback(dict!);
            
        }
        dataTask.resume()
        
    }
    
    public func post(method:String,param:AnyObject,callback:(NSDictionary)->Void)->Void{
        
        
        let url: NSURL = NSURL(string: HTTPURL+method)!;
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url);
        request.HTTPMethod = "POST";
        request.HTTPBody = param.dataUsingEncoding(NSUTF8StringEncoding);

        let session: NSURLSession = NSURLSession.sharedSession();
        let dataTask: NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data, response, error) in
           
             var dict:NSDictionary? = nil;
            if(error == nil){
               
                do {
                    dict  = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.init(rawValue: 0)) as? NSDictionary;
                } catch let error as NSError {
                    dict=["success":0,"data":error.localizedDescription];
                }
              
            }else{
                 dict=["success":0,"data":(error?.localizedDescription)!];
            }
         
            
              callback(dict!);
        }
        dataTask.resume()
        
    }
    
    
    func get2(method:String,param:String,callback:(NSDictionary)->Void){
        
        let url = NSURL(string:HTTPURL+method+"?"+param)
        let request: NSURLRequest = NSURLRequest(URL: url!)

        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{
    
            (response, data, error) -> Void in
            var dict:NSDictionary?=nil;
            if (error == nil) {
               
                 do{
                   dict = try NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments) as? NSDictionary
                   
                }catch let error as NSError {
                   dict=["success":0,"data":error.localizedDescription];
                }
                
            }else{
                    dict=["success":0,"data":(error?.localizedDescription)!];
                }
            callback(dict!);
           
            
        })
        
        
    }
    
    
    func post2(method:String,param:String,callback:(AnyObject)->Void){
        
        let url = NSURL(string:HTTPURL+method)
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url!);
        request.HTTPMethod = "POST";
        request.HTTPBody = param.dataUsingEncoding(NSUTF8StringEncoding);

        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{
            
            (response, data, error) -> Void in

            var dict:AnyObject?=nil;
            
            if (error == nil) {
                do{
                    dict = try NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments)
                    
                }catch let err as NSError {
                    dict=["success":0,"data":err.description];
                }
                
            }else{
                dict=["success":0,"data":(error?.localizedDescription)!];
            }
            callback(dict!);
            
            
        })
        
        
    }

    
    func post3(method:String,param:String,callback:(AnyObject)->Void){
        
        let url = NSURL(string:HTTPURL+method)
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url!);
        request.HTTPMethod = "POST";
        request.HTTPBody = param.dataUsingEncoding(NSUTF8StringEncoding);
         var data: NSData? = nil
         var dict:AnyObject?=nil;
        do{
            data = try  NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
        }catch {
            
        }
        do{
            dict = try NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.AllowFragments)
            
        }catch let err as NSError {
            dict=["sucess":0,"data":err.description];
        }
        
        callback(dict!)
        
    }
    
    
}