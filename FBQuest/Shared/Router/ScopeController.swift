//
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import Swinject

protocol ScopeController {
    associatedtype Scope
    static var instance: Scope { get }
    var assemblies: [Assembly] { get }
    var container: Container { get }
    func registerScope()
}

extension ScopeController {
    func registerScope() {
        assemblies.forEach {
            $0.assemble(container: container)
        }
    }

    func resolve<T>(type: T.Type) -> T {
        guard let dependency = container.resolve(type) else {
            fatalError("Dependency \(String(describing: type)) not registered in AppScope")
        }

        return dependency
    }
}
