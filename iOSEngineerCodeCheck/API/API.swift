//
//  API.swift
//  iOSEngineerCodeCheck
//
//  Created by 大谷空 on 2021/12/22.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation
import Alamofire

class API {

    static let shared = API()
    private let baseUrl = "https://api.github.com"

    func request<T: Decodable>(word: String, path: String, type: T.Type, completion: @escaping (T) -> Void) {

        let url = baseUrl + path + "?"
        let params = ["q": "\(word)"]
        let request = AF.request(url, method: .get, parameters: params)

        request.responseJSON { (response) in

            do {
                let decode = JSONDecoder()
                decode.keyDecodingStrategy = .convertFromSnakeCase

                if let data = response.data {
                    let value = try decode.decode(T.self, from: data)
                    completion(value)
                }
            } catch {
                print("変換に失敗: ", error)
            }
        }
    }
}
