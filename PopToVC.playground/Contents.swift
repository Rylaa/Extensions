import UIKit


for controller in self.navigationController!.viewControllers as Array {
           if controller.isKind(of: HomeViewController.self) {
               self.navigationController!.popToViewController(controller, animated: true)
               break
           }
       }
