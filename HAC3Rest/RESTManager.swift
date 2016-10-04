//
//  RESTManager.swift
//  HAC3Rest
//
//  Created by Héctor Cuevas Morfín on 9/2/16.
//  Copyright © 2016 HC. All rights reserved.
//

import Foundation


public enum method:String{
    
    case POST
    case GET
    case PATH
    case DELETE
}


public func NSLog(string:String)
{
    let name = Bundle.main.infoDictionary!["CFBundleName"] as! String
    print("\(Date())\(name)  \(string)")
}

public class RESTMAnager: NSObject {
    
     public override init() {
    }
    
    public func testMethod(){
        print("TestMEthod preinted")
    }
    
    public func request(requestMethod:method,url: URL,parameters:Dictionary<String,Any>?,headers:[String:String]?,completion:@escaping (_ result : Any) -> Void)
    {
       // let postData = JSONSerialization.dataWithJSONObject(parameters, options: nil, error: nil)
        
        var request = URLRequest(url: url)
        request.httpMethod = requestMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

       
        if(parameters != nil)
        {
            do{
                print(parameters!)
                let bodyPost = try JSONSerialization.data(withJSONObject: parameters!, options:.prettyPrinted)
                
                request.httpBody = bodyPost
                
            }catch let error {
                print(error)
            }
        }
     
        let task = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            guard error == nil else{
                print(error)
                let response2:[String:AnyObject] = ["error": error as AnyObject]
                completion(response2 )
                return
            }
            
            guard let data = data else {
                print("data is empty")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            print(json)
            
            
            completion(json)
            
        }
        
        task.resume()
        
       
    }

}
