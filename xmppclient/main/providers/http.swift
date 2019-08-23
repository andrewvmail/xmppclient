import Alamofire


class Http {
    init()  {
        AF.request("https://httpbin.org/get")
        AF.request("https://httpbin.org/get").responseJSON { resp in
            print("Request: \(String(describing: resp.request))")   // original url request
            // print("Response: \(String(describing: resp.resp))") // http urlresp
            print("Result: \(resp.result)")                         // resp serialization result

            if let json = resp.value {
                print("JSON: \(json)") // serialized jsonresp 
            }

            if let data = resp.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
}
