//
//  MyAlert.swift
//  minn-ios
//
//  Created by minn on 2/13/17.
//  Copyright © 2017 minn. All rights reserved.
//

import Foundation
import UIKit

public class MyAlert:UIAlertController{
    
    override init(title:String,msg:String){
         super.init();
        super.title=title;
        super.message=msg;
       
    }

    
}