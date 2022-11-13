//
//  NetworkCalls.swift
//  sandwich
//
//  Created by nate wert on 11/12/22.
//

import Foundation

let URLBASE = "PASTE URL BASE HERE"

class NetworkCalls {
    static func testRequests() async -> String {
        guard let url = URL(string: URLBASE) else {
            return "Error creating url"
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        var resp: URLResponse
        
        do {
            (_, resp) = try await URLSession.shared.data(for: request)
        } catch {
            return "Unable to make request"
        }
        
        let httpResponse = resp as? HTTPURLResponse
        if httpResponse?.statusCode != 200 {
            return "test request failed"
        }
        
        return "test request succeeded"
    }
    
    static func makeSandwich() async -> String {
        guard let url = URL(string: URLBASE + "/open") else {
            return "Error creating url"
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        var resp: URLResponse
        
        do {
            (_, resp) = try await URLSession.shared.data(for: request)
        } catch {
            return "Unable to make request"
        }
        
        var httpResponse = resp as? HTTPURLResponse
        if httpResponse?.statusCode != 200 {
            return "Request to open door failed"
        }
        
        guard let squeeze = URL(string: URLBASE + "/squeeze") else {
            return "Error creating squeeze url"
        }
        
        var request2 = URLRequest(url: squeeze)
        request2.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request2.httpMethod = "GET"
        
        do {
            (_, resp) = try await URLSession.shared.data(for: request2)
        } catch {
            return "Unable to make request to squeeze"
        }
        
        httpResponse = resp as? HTTPURLResponse
        if httpResponse?.statusCode != 200 {
            return "Request to squeeze contents failed"
        }
        
        guard let close = URL(string: URLBASE + "/close") else {
            return "Error creating close url"
        }
        
        var request3 = URLRequest(url: close)
        request3.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request3.httpMethod = "GET"
        
        do {
            (_, resp) = try await URLSession.shared.data(for: request3)
        } catch {
            return "Unabel to make request to close"
        }
        
        httpResponse = resp as? HTTPURLResponse
        if httpResponse?.statusCode != 200 {
            return "Request to close failed"
        }
        
        return "Successfully made a sandwich"
    }
    
    static func refillContainers() async -> String {
        guard let url = URL(string: URLBASE + "/refill") else {
            return "Error creating refill url"
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        var resp: URLResponse
        
        do {
            (_, resp) = try await URLSession.shared.data(for: request)
        } catch {
            return "Unable to make refill request"
        }
        
        let httpResponse = resp as? HTTPURLResponse
        if httpResponse?.statusCode != 200 {
            return "refill request failed"
        }
        
        return "refill request succeeded"
    }

}
