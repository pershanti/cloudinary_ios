//
//  CLDRequestParams.swift
//
//  Copyright (c) 2016 Cloudinary (http://cloudinary.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

/**
 The CLDRequestParams class is a base class for all different request params object.
 It holds a dictionary of the actual params, the request's resource type, the request signature for signing a request using an externaly generated signature, and the subclass' representing action.
*/
@objc public class CLDRequestParams: NSObject {

    /**
     A dictionary of the params to be sent as part of the request.
    */
    internal var params: [String : AnyObject] = [:]
    
    /**
     The requst's resource type, if set it will be part of the requset URL. On most cases defaults to "image".
     */
    internal var resourceType: String?
    
    /**
     The request signature for signing a request using an externally generated signature. if no signature is assigned, the SDK will sign the request using the configured API secret.
     */
    internal var signature: CLDSignature?
    
    internal override init() {
        super.init()
    }
    
    //MARK: - Set Param
    
    /**
    A generic setter to manualy set a param.
    
    - parameter key:                The key of parameter to set.
    - parameter value:              The parameter value.
    
    - returns:                     The same instance of CLDUploadRequestParams.
    
    */
    public func setParam(key: String, value: AnyObject?) -> CLDRequestParams {
        params[key] = value
        return self
    }

    @objc(setResourceTypeFromUrlResourceType:)
    public func setResourceType(resourceType: CLDUrlResourceType) -> CLDRequestParams {
        return setResourceType(String(resourceType))
    }
    
    @objc(setResourceTypeFromString:)
    public func setResourceType(resourceType: String) -> CLDRequestParams {
        self.resourceType = resourceType
        return self
    }
    
    @objc(setSignatureWithSignature:)
    public func setSignature(signature: CLDSignature) -> CLDRequestParams {
        self.signature = signature
        return self
    }
    
    // MARK: - Get Param
    
    /**
     A generic getter to retrieve a param for a given key.
     
     - parameter key:               The key of the parameter to retrieve.
     
     - returns:                     The same instance of CLDUploadRequestParams.
     
     */
    public func getParam(key: String) -> AnyObject? {
        return params[key]
    }
}
