import UIKit
// Responsibility Single  (görev parçacığı)

// Wrong
struct DeveloperWorng {
    let name: String
    let salary: Decimal
    
    private let taxPercentage: Decimal
    
    func calculateTax() -> Decimal {
        return salary * taxPercentage
    }
}


// Right
struct DeveloperRight {
    let name: String
    let salary: Decimal
}

class TaxCalculator {
    private let taxPercentage: Decimal
    
    init(taxPercentage: Decimal) {
        self.taxPercentage = taxPercentage
    }
    
    func calculateTax(forSalary salary: Decimal) -> Decimal {
        return salary * taxPercentage
    }
}


// Open Close prencipe (değiştirelemez ama geliştirilebilir özelliği değişmeyecek aynı iş yapacak)
// Wrong neden worng dersek protocoke bağlıyız ve
protocol PaymentManagerProcotol {
    func visaPayment(_ amount: Decimal)
    func masterPayment(_ amount: Decimal)
    func cashierPayment(_ amount: Decimal)
}

class WorngPayment: PaymentManagerProcotol {
    func visaPayment(_ amount: Decimal) {
        
    }
    
    func masterPayment(_ amount: Decimal) {
        
    }
    
    func cashierPayment(_ amount: Decimal) {
        
    }
}

// Right

protocol PaymentMethodProtocol: AnyObject {
    func payAmount(_ amount: Decimal)
    
}

class visaPayment: PaymentMethodProtocol {
    
    func payAmount(_ amount: Decimal) {
        // Todo...
    }
    
}

class masterPayemnt: PaymentMethodProtocol {
    func payAmount(_ amount: Decimal) {
        // Todo...
    }
    
}

// Liskov prencipe Ortak özellik (Bunda bende çok zorlanıyorum)
// Ama şöyle denilebilir penguen kuş ama uçamaz, serçe kuş ama uçabilir 2 snin kuş protocolünde birleşmesi uçabilir uçamazda ayrılmasına deniyor diyebiliriz


// Wrong

protocol Birdprotocol {
    func fly()
    func walk()
}

class EagleWrong: Birdprotocol {
    func fly() {
        // "fly"
    }
    
    func walk() {
        // "walk"
    }
    
    
}

class Penguin: Birdprotocol {
    func fly() {
       // "penguin cant fly"
    }
    
    func walk() {
        // penguin is waking
    }
    
    
}


// Right

protocol BirdProtocol {
  func walk()
}

protocol FlyingProtocol {
  func fly()
}

protocol FlyingBirdProtocol: BirdProtocol, FlyingProtocol { }

class EagleRingt: FlyingBirdProtocol, BirdProtocol {

  func walk() {
    print("Eagle is walking.")
  }

  func fly() {
    print("Eagle is flying.")
  }
}

class PenguinRight: BirdProtocol {

  func walk() {
    print("Penguin is walking.")
  }
}

class Zoo {

  let birds: [FlyingBirdProtocol]
  
  init(birds: [FlyingBirdProtocol]) {
    self.birds = birds
  }

  func makeNoise() {
    for bird in birds {
      bird.fly()
    }
  }
}
