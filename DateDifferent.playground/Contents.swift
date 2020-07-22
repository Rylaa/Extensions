import UIKit

// You can get two date difference 

func getMinutesDifferenceFromTwoDates(start: Date, end: Date) -> Int {
    let diff = Int(end.timeIntervalSince1970 - start.timeIntervalSince1970)
    let hours = diff / 3600
    let minutes = (diff - hours * 3600) / 60
    return minutes
}
