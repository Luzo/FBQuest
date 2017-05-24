//
//  Copyright © 2017 LubosLehota. All rights reserved.
//

import Swinject

final class AppScopeController: ScopeController {
    static let instance: AppScopeController = AppScopeController()
    let container: Container = Container()
    var assemblies: [Assembly] {
        return [
            ViewControllerAssembly(),
            PresenterAssembly(),
            InteractorAssembly()
        ]
    }
    
    private init() {
        registerScope()
    }
}
