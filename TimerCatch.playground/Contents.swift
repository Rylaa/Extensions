import UIKit

// Uygulamada click olmadığında 5dk geri sayan ssession hatası verir foreground background kontrolü yapar
// Foreground background da time alıp bir biri ile karşılaştırır

class TimerApplication: UIApplication {
    private var timeoutInSeconds: TimeInterval {
        return 60*5
    }
    private var idleTimer: Timer?
    private func resetIdleTimer() {
        if let idleTimer = idleTimer {
            idleTimer.invalidate()
        }
        idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds,
                                         target: self,
                                         selector: #selector(TimerApplication.timeHasExceeded),
                                         userInfo: nil,
                                         repeats: false
        )
    }
    @objc private func timeHasExceeded() {
        NotificationCenter.default.post(name: NotifyName.timeOut,
                                        object: nil
        )
    }
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        if idleTimer != nil {
            self.resetIdleTimer()
        }

        if let touches = event.allTouches {
            for touch in touches where touch.phase == UITouch.Phase.began {
                self.resetIdleTimer()
            }
        }
    }
}


func sessionAlert() {
    DispatchQueue.global().async {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000), execute: {
            if let topVC = UIApplication.getTopViewController() {
              if app.session.getItem(key: .userIsLogin) as? Bool ?? false && BaseVC.sessionAlertState == 0 {
                  BaseVC.sessionAlertState += 1
                  let alertView = AlertView.initialization(topVC)
                  alertView.showAlert(message: Constants.securityText, buttonText: Constants.gotIt, alertType: .warning) { (AlertClicked) in
                      FilterVM.destroy()
                      app.session.setItem(key: .userIsLogin, item: false)
                      app.session.reset()
                      app.router.signInPage()
                      BaseVC.sessionAlertState = 0
                  }
              }
            }
        })
    }
}
@objc func applicationDidTimeout(notification: NSNotification) {
    sessionAlert()
}

func getMinutesDifferenceFromTwoDates(start: Date, end: Date) -> Int {
    let diff = Int(end.timeIntervalSince1970 - start.timeIntervalSince1970)
    let hours = diff / 3600
    let minutes = (diff - hours * 3600) / 60
    return minutes
}
