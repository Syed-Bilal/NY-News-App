//
//  NetworkResponse.swift
//  NY App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation

func handleResponse<T: Decodable>(response: T?, error: Error?, completion: @escaping completion<T>) {
    
    if error != nil {
        completion(.ERROR, nil, error)
        print("\(error?.localizedDescription ?? "" )")
    } else {
        completion(.SUCCESS, response, nil)
    }
}
