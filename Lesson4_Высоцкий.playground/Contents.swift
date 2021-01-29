import UIKit
import Foundation

enum ModelCar{
    case BMW, Mercedes, Audi, MAN, KAMAZ, RENO
}

enum WindowsCar{
    case open, close
}

enum EngineCar{
    case on, off
}

enum TrunkCar{
    case full(gruz:  Int), empty(gruz: Int)
}

enum LukeCar{
    case yes, no
}

enum TrailerTruckCar{
    case yes, no
}

enum Lift{
    case yes, no
}

class Car{
    let model : ModelCar
    let year : Int
    let volume : Int
    var windows : Bool
    var engine : Bool
    var trunk : Bool
    var wheel : Int
    var maxWheel: Int
    
    func changeWindows(action: WindowsCar) {
        switch action{
        case .open : windows = true
        case .close : windows = false
        }
    }
    
    func changeEngine(action: EngineCar) {
        switch action {
        case .on : engine = true
        case .off : engine = false
        }
    }
    
    func changeTrunk(action: TrunkCar){
        switch action {
        case .full(let gruz):
            if (gruz + wheel) <= maxWheel && wheel >= 0{
                wheel += gruz
            } else if gruz >= maxWheel + 1 {
                print ("Can't put!")
            }
            
            if wheel >= maxWheel {
                trunk = true
            }
            print(printInfo())
        case .empty(let gruz):
            print(printInfo())
            if  wheel >= maxWheel {
                wheel -= gruz
                
            }
            
            if wheel < maxWheel && wheel >= 0 {
                trunk = false
                print("Can't get it!")
            } else if wheel < 0 {
                wheel = 0
                trunk = false
                print("Can't!")
            }
        }
    }
    
    init(model : ModelCar, year: Int, volume: Int, windows : Bool, engine : Bool, trunk : Bool, wheel : Int, maxWheel: Int = 4) {
        self.model = model
        self.year = year
        self.volume = volume
        self.windows = windows
        self.engine = engine
        self.trunk = trunk
        self.wheel = wheel
        self.maxWheel = maxWheel
    }
    
    func printInfo(){
        print("----------------")
        print("Model car: \(model)")
        print("Year car: \(year)")
        print("Volume car: \(volume)")
        print("Windows car: \(windows ? "Open" : "Close") ")
        print("Engine car: \(engine ? "On" : "Off")")
        print("Trunk car: \(trunk ? "Full" : "Empty")")
        print("Wheel in car: \(wheel)")
        print("----------------")
    }
}

class sportCar: Car{
    var color : String
    var luke : Bool
    
    func changeLuke(isLukeExist: LukeCar){
        switch isLukeExist {
        case .yes : luke = true
        case .no : luke = false
        }
    }
    
    init(model: ModelCar, year: Int, volume: Int, windows: Bool, engine: Bool, trunk: Bool, wheel: Int, color: String, luke: Bool) {
        self.color = color
        self.luke = luke
        super.init(model: model, year: year, volume: volume, windows: windows, engine: engine, trunk: trunk, wheel: wheel)
    }
    
    override func printInfo(){
        print("----------------")
        print("Model car: \(model)")
        print("Year car: \(year)")
        print("Volume car: \(volume)")
        print("Windows car: \(windows ? "Open" : "Close") ")
        print("Engine car: \(engine ? "On" : "Off")")
        print("Trunk car: \(trunk ? "Full" : "Empty")")
        print("Wheel in car: \(wheel)")
        print("Color car: \(color)")
        print("Luke in car: \(luke ? "Yes" : "No")")
        
    }
}
var car1 = sportCar(model: .Audi, year: 2019, volume: 1956, windows: true, engine: true, trunk: true, wheel: 3, color: "Red", luke: false)
var car2 = sportCar(model: .BMW, year: 1998, volume: 1789, windows: false, engine: false, trunk: false, wheel: 0, color: "Blue", luke: true)
var car3 = sportCar(model: .Mercedes, year: 2010, volume: 2090, windows: true, engine: false, trunk: false, wheel: 3, color: "Black", luke: true)

car1.changeWindows(action: .close)
car1.changeEngine(action: .off)
car1.changeTrunk(action: .full(gruz: 1))
car2.changeWindows(action: .open)
car2.changeEngine(action: .on)
car2.changeTrunk(action: .full(gruz: 4))
car3.changeWindows(action: .close)
car3.changeEngine(action: .on)
car3.changeTrunk(action: .empty(gruz: 3))

class TruckCar: Car {
    var trailer : Bool
    var lift : Bool
    
    func trailer(isLukeExist: TrailerTruckCar){
        switch isLukeExist {
        case .yes : trailer = true
        case .no : trailer = false
        }
    }
    
    init(model: ModelCar, year: Int, volume: Int, windows: Bool, engine: Bool, trunk: Bool, wheel: Int, trailer: Bool, lift: Bool) {
        self.trailer = trailer
        self.lift = lift
        super.init(model: model, year: year, volume: volume, windows: windows, engine: engine, trunk: trunk, wheel: wheel, maxWheel: 60)
    }
    
    override func printInfo(){
        print("----------------")
        print("Model car: \(model)")
        print("Year car: \(year)")
        print("Volume car: \(volume)")
        print("Windows car: \(windows ? "Open" : "Close") ")
        print("Engine car: \(engine ? "On" : "Off")")
        print("Trunk car: \(trunk ? "Full" : "Empty")")
        print("Wheel in car: \(wheel)")
        print("Trailer in car: \(trailer ? "Yes" : "No")")
        print("Lift in car: \(lift ? "Yes" : "No")")
        
    }
}
var truckcar1 = TruckCar(model: .KAMAZ, year: 1990, volume: 4090, windows: true, engine: true, trunk: true, wheel: 56, trailer: true, lift: true)
var truckcar2 = TruckCar(model: .MAN, year: 2020, volume: 5000, windows: false, engine: false, trunk: false, wheel: 29, trailer: true, lift: false)
var truckcar3 = TruckCar(model: .RENO, year: 1978, volume: 6000, windows: true, engine: false, trunk: true, wheel: 15, trailer: false, lift: true)

truckcar1.changeWindows(action: .close)
truckcar1.changeEngine(action: .off)
truckcar1.changeTrunk(action: .full(gruz: 1))
truckcar2.changeWindows(action: .open)
truckcar2.changeEngine(action: .on)
truckcar2.changeTrunk(action: .full(gruz: 4))
truckcar3.changeWindows(action: .close)
truckcar3.changeEngine(action: .on)
truckcar3.changeTrunk(action: .empty(gruz: 3))

