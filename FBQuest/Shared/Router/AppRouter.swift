//
//  Copyright © 2017 LubosLehota. All rights reserved.
//

class AppRouter {
    static let instance = AppRouter()
    var appScope: AppScopeController = AppScopeController.instance

    private init() {}
}
