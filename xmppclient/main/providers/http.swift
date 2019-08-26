import Alamofire


class Http {
    init() {
        // AF.request("https://httpbin.org/get")
        // AF.request("https://httpbin.org/get").responseJSON { resp in
        //     print("Request: \(String(describing: resp.request))")   // original url request
        //     // print("Response: \(String(describing: resp.resp))") // http urlresp
        //     print("Result: \(resp.result)")                         // resp serialization result
        //
        //     if let json = resp.value {
        //         print("JSON: \(json)") // serialized jsonresp
        //     }
        //
        //     if let data = resp.data, let utf8Text = String(data: data, encoding: .utf8) {
        //         print("Data: \(utf8Text)") // original server data as UTF8 string
        //     }
        // }
    }

    func post(url: String,
              params: [String: String?],
              cb: @escaping (_ error: [String: Any]?, _ result: [String: Any]?) -> ()) {

        print("post \(url)")

        AF.request(url,
                method: .post,
                parameters: params,
                encoding: JSONEncoding.default).responseJSON { resp in
            if let json = resp.value {
                if let response = json as? [String: Any] {
                    let err = response["error"] != nil
                    if err {
                        cb(response, nil)
                    } else {
                        cb(nil, response)
                    }
                }
            } else {
                cb(["": false], nil)
            }
        }
    }
}
