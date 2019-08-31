import Alamofire

enum SipError: Error {
    case libre
    case config
    case stack
    case modules
    case userAgent
    case call
}


class Sip {
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
        // var agent: OpaquePointer? = nil
        // var client: SipClient? = nil
        // do {
        //     client = try SipClient(agent: &agent)
        // } catch {
        //     print("error: \(error)")
        // }
    }

    // func post(url: String,
    //           params: [String: String?],
    //           cb: @escaping (_ error: [String: Any]?, _ result: [String: Any]?) -> ()) {
    //
    //     print("post \(url)")
    //
    //     AF.request(url,
    //             method: .post,
    //             parameters: params,
    //             encoding: JSONEncoding.default).responseJSON { resp in
    //         if let json = resp.value {
    //             if let response = json as? [String: Any] {
    //                 let err = response["error"] != nil
    //                 if err {
    //                     cb(response, nil)
    //                 } else {
    //                     cb(nil, response)
    //                 }
    //             }
    //         } else {
    //             cb(["": false], nil)
    //         }
    //     }
    // }
}


final class SipClient {

    required init?(agent: inout OpaquePointer?) throws {
        guard libre_init() == 0 else { throw SipError.libre }

        // Initialize dynamic modules.
        mod_init()

        // Make configure file.
        if let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            conf_path_set(path)
        }
        guard conf_configure() == 0 else { throw SipError.config }

        // Initialize the SIP stack.
        guard ua_init("SIP", 1, 1, 1, 0) == 0 else { throw SipError.stack }

        // Load modules.
        guard conf_modules() == 0 else { throw SipError.modules }

        let addr = "sip:momo:momo@momo.com:5060;transport=tcp;answermode=auto"

        // Start user agent.
        guard ua_alloc(&agent, addr) == 0 else { throw SipError.userAgent }

        // Make an outgoing call.
        guard ua_connect(agent, nil, nil, "sip:888@192.168.1.68:5060", nil, VIDMODE_OFF) == 0 else { throw SipError.call }

        // Start the main loop.
        re_main(nil)
    }

    func close(agent: OpaquePointer) {
        mem_deref(UnsafeMutablePointer(agent))
        ua_close()
        mod_close()

        // Close and check for memory leaks.
        libre_close()
        tmr_debug()
        mem_debug()
    }

}