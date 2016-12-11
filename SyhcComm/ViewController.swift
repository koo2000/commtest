//
//  ViewController.swift
//  SyhcComm
//
//  Created by 麻野耕一 on 2016/12/11.
//  Copyright © 2016年 麻野耕一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonClicked(_ sender: Any) {
        print("hoge")

        dourl()
//        queue.async {
//            let url = NSURL(fileURLWithPath: "https://github.com")
//        }
    }
    
    func dourl() {
        var queue = DispatchQueue(label: "jp.classmethod.app.queue")
        queue.async() {
            let semapho = DispatchSemaphore(value: 0)
            print("enter?")
            print("enter!")
                print("async2")

                let requestURL: URL = URL(string: "https://github.com")!
                let request: NSMutableURLRequest = NSMutableURLRequest(url: requestURL)
                
                var task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                    if (error == nil) {
                        print("success!!")
                        print(response)
                    } else {
                        print("error occur!!")
                        print(error)
                    }
                    print("end")
                    semapho.signal()
                })
                print("fuga")
                task.resume()
                print("resumed")
            print("wait?")
            semapho.wait()
            print("end2")
        }

    }
}

