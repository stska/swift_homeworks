//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation
/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.
 */

//------------------------------------------------------------------------------часть с предыдущего задания
enum VehicleType:String{
    case sedan = "Седан", truck = "Грузовик", racingCar = "Гоночная машиа"
    
    var type:String {
        switch self {
        case .sedan:
            return "Седан"
        case .truck:
            return "Грузовик"
        case .racingCar:
            return "Гоночная машина"
        }
    }
}
enum EngineStatus: String{
    case engineOff = "Выключен", engineOn = "Заведен"
    
}
enum StatusOfWindows: String{
    case rolledDown = "Опущены", rolledUp = "Подняты"

}


enum Action {
    case turnEngine(EngineStatus), switchWindows(StatusOfWindows)
    //case turnEngineOff = "Заглущить мотор",turnEngineOn = "включить мотор", rollWindowsUp = "подрянять стекла" ,rollWindowsDown = "опустить стекла"

 }


enum RacingMode: String{
    case low = "easy", medium = "middle", speed = "vjuuuuuuuh"
    
}

//----------------------------------------------------------------------------- Новая часть

protocol Car {
    var model:String {get}
    var brand:String {get}
    var dateOfRelease:Int {get}
    var cost:Double {get}
    var carId:String {get}
    
   var engine:EngineStatus {get set}
   var windows:StatusOfWindows {get set}
    var type:VehicleType {get set}
 
    func implement(action:Action) -> ()
    
}
extension Car{
    
    mutating func actEngine(actionEngine:EngineStatus) ->() {
        switch actionEngine {
        case .engineOff:
            self.engine = EngineStatus(rawValue: actionEngine.rawValue)!
        case .engineOn:
            self.engine = EngineStatus(rawValue: actionEngine.rawValue)!
            
        }
    
}
    }

extension Car {
    mutating func windowsSwitch (actionWindows: StatusOfWindows) -> (){
        switch actionWindows {
        case .rolledDown:
            self.windows = StatusOfWindows(rawValue: actionWindows.rawValue)!
        case .rolledUp:
            self.windows = StatusOfWindows(rawValue: actionWindows.rawValue)!
            
        }
    }
}

extension RacingMode{                                                               //extension for enum RacingMode to convert to rawValue
    var test:RacingMode {return RacingMode(rawValue: self.rawValue)!}
    
}


class RacingCar: Car, CustomStringConvertible {
    
    var actionWindows: StatusOfWindows?
    var actionEngine: EngineStatus?
    var carId: String
    
    let model: String
    let brand: String
    let dateOfRelease: Int
    let cost: Double
    
    var engine: EngineStatus
    var windows: StatusOfWindows
    var type: VehicleType

    let maxSpeed:Int
    let horsepower:Int

    var mode:RacingMode
    
    var description: String {return "model: \(model), car ID: \(carId), brand: \(brand),Date of issue: \(dateOfRelease), cost: \(cost), engine status: \(engine), windowds status: \(windows), type of the car: \(type), max speed: \(maxSpeed), horsepower: \(horsepower),suspension mod: \(mode)"}
    
    init(model:String,brand:String,dateOfRelease: Int, cost:Double, cardId:String,
         engine:EngineStatus, windows: StatusOfWindows, type: VehicleType, maxSpeed:Int, horsepower:Int, mode:RacingMode  ) {
        self.horsepower = horsepower
        self.maxSpeed = maxSpeed
        self.mode = mode
        self.model = model
        self.brand = brand
        self.dateOfRelease = dateOfRelease
        self.cost = cost
        self.carId = UUID().uuidString
        self.engine = engine
        self.windows = windows
        self.type = type
        
    }
    
        func implement(action:Action){
            
             print("врум-врум")
    }
    
    
}

class TruckCar: Car, CustomStringConvertible {
    

    var carId: String
    
    let model: String
    let brand: String
    let dateOfRelease: Int
    let cost: Double
    
    var engine: EngineStatus
    var windows: StatusOfWindows
    var type: VehicleType
    
   var actionEngine:EngineStatus?
    var actionWindows:StatusOfWindows?
    
    let maxCarryingWeight:Double
    let trailer:Bool
    
    var description: String {return "model: \(model), car ID: \(carId), brand: \(brand),Date of issue: \(dateOfRelease), cost: \(cost), engine status: \(engine), windowds status: \(windows), type of the car: \(type), Max weight for transportation: \(maxCarryingWeight), Trailer: \(trailer) "}
    
    init(model:String,brand:String,dateOfRelease: Int, cost:Double, cardId:String,
         engine:EngineStatus, windows: StatusOfWindows, type: VehicleType, maxCarryingWeight: Double, trailer: Bool ) {
        
        self.trailer = trailer
        self.maxCarryingWeight = maxCarryingWeight
        self.model = model
        self.brand = brand
        self.dateOfRelease = dateOfRelease
        self.cost = cost
        self.carId = UUID().uuidString
        self.engine = engine
        self.windows = windows
        self.type = type
    }
    
    func implement(action:Action){
        
        print("something should be done here")
    }
}

var car = RacingCar(model:"aaaaa", brand: "mazda", dateOfRelease: 1566, cost: 44544444, cardId: "", engine: .engineOff, windows: .rolledDown, type: .racingCar, maxSpeed: 600, horsepower: 1000, mode: .speed )
print(car)
car.actEngine(actionEngine: .engineOn)
print(car.engine)
car.windowsSwitch(actionWindows: .rolledUp)
print(car.windows)
var test = car.mode.rawValue
print(test)


var truckCar =  TruckCar(model:"tank", brand: "SKANIA", dateOfRelease: 2010, cost: 10000, cardId: "Test number", engine: .engineOff, windows: .rolledUp, type: .truck, maxCarryingWeight: 2000, trailer: true)
print(truckCar)
truckCar.windowsSwitch(actionWindows: .rolledDown)
truckCar.actEngine(actionEngine: .engineOn)
