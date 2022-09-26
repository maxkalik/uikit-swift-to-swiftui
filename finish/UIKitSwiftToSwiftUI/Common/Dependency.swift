//
//  Dependency.swift
//  UIKitSwiftToSwiftUI
//
//  Created by Maksim Kalik on 9/22/22.
//

import Foundation

protocol DependencyDelegate: AnyObject {
    func appDependencyDidUpdate()
}

protocol Dependency {
    var delegate: DependencyDelegate? { get set }
    var name: String { get set }
    
    func updated()
}

final class AppDependency: Dependency {
    
    var delegate: DependencyDelegate?
    var name: String = ""

    func updated() {
        delegate?.appDependencyDidUpdate()
    }
}
