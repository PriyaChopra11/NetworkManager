//
//  File.swift
//  
//
//  Created by Dewanshu Sharma on 2022-09-05.
//

import Foundation

public class NetworkURLRequestBuilder {
    
    private var url: URL
    private var parameters: [String:Any] = [:]
    private var httpMethodType: String = "POST"
    
    init(with url: URL) {
        self.url = url
    }
    
    public func setParameters(with parameters: [String:Any]) -> NetworkURLRequestBuilder {
        self.parameters = parameters
        return self
    }
    
    public func setHttpMethodType(type: String) -> NetworkURLRequestBuilder {
        self.httpMethodType = type
        return self
    }
    
    public func build() -> URLRequest {
        var request = URLRequest(url: self.url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let bodyData = try? JSONSerialization.data(
            withJSONObject: parameters,
            options: []
        )
        request.httpMethod = httpMethodType
        request.httpBody = bodyData
        return request
    }
}
