//
//  ApiURL.swift
//  Lukandah
//
//  Created by Macbook Air (ios) on 14/06/22.
//

import Foundation

public var baseUrl = "http://93.188.167.68:8006/api/"

public struct Api {
    public static var Login = baseUrl + "users/login"
    public static var Signup = baseUrl + "users/create"
}
 
