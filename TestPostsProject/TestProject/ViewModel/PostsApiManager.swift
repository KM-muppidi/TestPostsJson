//
//  PostsApiManager.swift
//  BeingMe
//
//  Created by Kavya Mangala muppidi on 7/21/21.
//

import Foundation

typealias completionHanlder = (_ response: Any, _ status: Bool) -> Void

enum HttpCodeType: String {
    case get = "GET"
    case post = "POST"
//    case delete = "DELETE"
//    case put = "PUT"
}

struct PostsApiManager {
 
    static let shared = PostsApiManager()
    static let baseURL = "http://34.134.148.105/posts?"
   // let postsURL = baseURL + "posts?"
    
    private func apiCall(httpCodeType: HttpCodeType, authorization: String?, parameters: [String: Any], urlString: String, handler: @escaping completionHanlder) {
        
        var headers = [
            "content-type": "application/json",
            "accept": "application/json",
            ]
        
        if let auth = authorization {
            headers["Authorization"] = auth
        }
        
        var request = URLRequest(url: URL(string: urlString)! )
        request.allHTTPHeaderFields = headers
        
        if httpCodeType == HttpCodeType.post {
            
            var postData:Data?
            
            do {
                try  postData = JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                
            }
            request.httpMethod = HttpCodeType.post.rawValue
            request.httpBody = postData
//        } else if httpCodeType == HttpCodeType.put {
//            request.httpMethod = HttpCodeType.put.rawValue
        } else {
            request.httpMethod = HttpCodeType.get.rawValue
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if (error != nil) {
                print(error ?? "null error")
                handler(String(), false)
            } else {
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        handler(data ?? "null data", true)
                    } else {
                        handler(data ?? "null data", false)
                    }
                }
                
            }
        }.resume()
    }

    func getPostsAPI(param: [String: Any], handler: @escaping completionHanlder) {
        var endURL = ""
        for (key,value) in param {
            endURL += key + "=" + "\(value)" + "&"
        }
        let finalURL = "http://34.134.148.105/posts?" + endURL.dropLast()
            //PostsApiManager.baseURL + endURL.dropLast()
        apiCall(httpCodeType: HttpCodeType.get, authorization: nil, parameters: param, urlString: finalURL) { (data, status) in
            if status {
                do {
                    let response = try JSONDecoder().decode(PostsData.self, from: data as! Data)
                    handler(response, true)
                    print(response)
                }
                catch let error {
                    print(error)
                }
            } else {
                do {
                    // make sure this JSON is in the format we expect
                    
                    guard let responseDictionary: [String : Any] = try JSONSerialization.jsonObject(with: data as! Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]  else {
                        return
                    }
                    print(responseDictionary)
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                handler(data, false)
            }
        }
    }
}
