//
//  Test.swift
//  MeetingNow
//
//  Created by Andrew Chen on 4/12/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class TestController: UIViewController {
    
    let parameters:[String: String] = [
        "foo": "baz"
    ]
    
    @IBAction func getButtonTapped(_ sender: UIButton) {
        AF.request("http://localhost:3000/users/register", method: .post, parameters: parameters).validate().responseJSON{ response in
            switch response.result {
            case .success:
                print("validation gud")
            case .failure(let error):
                print(error)
            }
        }
//        AF.request("localhost:3000/dang", .post).validate().responseJSON { response in
//            switch response.result {
//            case .success:
//                print("Validation Successful")
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    @IBAction func postButtonTapped(_ sender: UIButton) {
        print("Post Button Tapped")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
