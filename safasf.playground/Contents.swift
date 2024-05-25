import UIKit
var urlComponents = URLComponents(string: "http/api/auth")
var url = urlComponents!.url!

let userData = ["login": "piska", "password": "popa"]

do {
 let jsonData = try JSONSerialization.data(withJSONObject: userData, options: [])
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = jsonData
    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        print(data,response,error)
 // Handle response from server
 }
 task.resume()
} catch {
 print("Error converting data to JSON: \(error)")
}

