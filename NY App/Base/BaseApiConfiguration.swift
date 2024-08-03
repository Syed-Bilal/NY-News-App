//
//  BaseApiConfiguration.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation

protocol BaseApiConfiguration {
    var path: String { get }
}

extension BaseApiConfiguration {
    var path: String { return path }
}
