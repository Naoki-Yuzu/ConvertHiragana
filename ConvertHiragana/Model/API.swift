//
//  API.swift
//  ConvertHiragana
//
//  Created by デュフフくん on 2020/05/12.
//  Copyright © 2020 Naoki-Yuzu. All rights reserved.
//


import Alamofire
import SwiftyJSON

class HiraganaAPI {

    private let url: URL = URL(string: "https://labs.goo.ne.jp/api/hiragana")!
    private var parameters = [
        "app_id": GOO_API_KEY,
        "request_id": "record003",
        "sentence": "",
        "output_type": "hiragana"
    ]

    func convertToHiragana(sentence: String, completion: @escaping (String?) -> Void) {
        parameters["sentence"] = sentence

        AF.request(url, method: .post, parameters: parameters).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                let convertedText = json["converted"].stringValue
                completion(convertedText)
            case .failure(_):
                completion(nil)
            }
            
        }

    }


}
