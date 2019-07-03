//
//  main.swift
//  homework_4
//
//  Created by user155176 on 02/07/2019.
//  Copyright © 2019 user155176. All rights reserved.
//

import Foundation


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

class Car {
    let type:VehicleType
    let model:String
    let brand:String
    let dateOfRelease:Int
    let cost:Int
    var carId:String
    
    var engine:EngineStatus
    var windows:StatusOfWindows
    
    init(type: VehicleType, model: String, brand: String, dateOfRelease: Int,
         cost: Int, carId: String, engine: EngineStatus, windows: StatusOfWindows){
        
        self.type = type
        self.model = model
        self.brand = brand
        self.dateOfRelease = dateOfRelease
        self.cost = cost
        self.carId = UUID().uuidString
        
        self.engine = .engineOff
        self.windows = .rolledUp
    }
    
    enum EngineStatus: String{
        case engineOff = "Выключен", engineOn = "Заведен"
        init(){
            self = .engineOff
        }
        
    }
    enum StatusOfWindows: String{
        case rolledDown = "Опущены", rolledUp = "Подняты"
        init(){
            self = .rolledUp
        }
    }
    //enum LoadCargo:String{
        //}
    enum Action {
        case turnEngine(EngineStatus), switchWindows(StatusOfWindows)
    }
    
    func implement(action:Action){
        switch action {
        case .switchWindows(let switchWindows):
             windows = switchWindows
        case .turnEngine(let turnEngine):
            engine = turnEngine
        }
        
    }
    
    
    
}

class RacingCar: Car{
    let maxSpeed:Int
    let horsepower:Int
    
    var mode:String
 
    init(type: VehicleType, model: String, brand: String,
         dateOfRelease: Int, cost: Int, carId: String = UUID().uuidString,
         engine: EngineStatus, windows: StatusOfWindows,
         maxSpeed:Int, horsepower:Int, mode:String) {
        
        self.horsepower = horsepower
        self.maxSpeed = maxSpeed
        self.mode = mode
        
        super.init(type: type, model: model, brand: brand, dateOfRelease: dateOfRelease, cost: cost,carId: carId, engine: .engineOff, windows: .rolledUp)
    }
    
    enum RacingMode: String{
        case low, medium, speed
        
        init(){
            self = .low
        }
        
        var modes: String {
            switch self {
            case .low:
                return "Low as a turtle"
            case .medium:
                return "Median mode"
            case .speed:
                return "To infinity and beyond"
                
            }
        }
    }

    
    override func implement(action: Action) {      // tak i ne smog pridumat' chto mojno dobavit' tak kak novogo peredat' nevozmojno a so starim i tak vse yasno. togda vstaet vros v chem smisl etih perezapisivaniy?
      super.implement(action: action)
       // _  = RacingMode(
 print("Я не понимаю, что тут можно изменить, чтобы от этого был толк, только если она уже была пустой может))")
        }

    
    
}
    
class TruckCar: Car {
    let trailer:Bool
    let maxCarryingCapacity:Double
    
    var carryingCurrentCapacity:Double = 0
    var loading:Double = 0
    
    
    enum LoadingStatus:String{
        case empty = "Empty car", onGoing = "Loading cargo" , full = "Full"
        
        init(){
            self = .empty
        }
        
    }
    
    var loadingStat:LoadingStatus
    
    init(type: VehicleType, model: String, brand: String, dateOfRelease: Int, cost: Int, carId: String, engine: EngineStatus, windows: StatusOfWindows, trailer: Bool, maxCarryingCapacity: Double, carryingCurrentCapacity: Double, loading: Double,loadingStat:LoadingStatus) {
        
        self.trailer = trailer
        self.maxCarryingCapacity = maxCarryingCapacity
        self.carryingCurrentCapacity = 0
        self.loading = 0
        self.loadingStat = loadingStat

        super.init(type: type, model: model, brand: brand, dateOfRelease: dateOfRelease, cost: cost, carId: carId, engine: .engineOff, windows: .rolledUp)
    }
    
    func culcCarryingCapacity(carryingCurrentCapacity:Double, maxCarryingCapacity maxCapacity:Double, loading:Double ){
        if((carryingCurrentCapacity + loading) <= maxCapacity){
            self.carryingCurrentCapacity += loading
            
        } else {
            print("Opss, It's a bit to much for this car. Please, try again")
        }
    }
    
    override func implement(action: Car.Action) {    //я хотел добавить еще один передаваемый параметр, но как я понял из документации, так делать нельзя и в таком случае просто создается другая функция, если вы знаете како-нибудь способ, то сообщите пож. очень интересно.
        
       super.implement(action: action)
        
        if( self.carryingCurrentCapacity > 0 && self.loading > 0){
            print("Ongoing loading")
        } else  if(self.carryingCurrentCapacity == 0){
            print("empty")
        } else {
            print ("full")
        }
    
   
}
}


var testCar = Car(type: .truck, model: "cx-6", brand: "mazda" , dateOfRelease: 2000, cost: 100000, carId: "", engine: .engineOff, windows: .rolledUp)
print(testCar.windows)
testCar.implement(action: .switchWindows(.rolledDown))
print(testCar.windows)

var testRace = RacingCar(type: .racingCar, model: "gti", brand: "Ford", dateOfRelease: 1920, cost: 100000000, carId: "", engine: .engineOn, windows: .rolledUp, maxSpeed: 300, horsepower: 1000, mode:"speed")
print(testRace.implement(action: .turnEngine(.engineOff)))

var testTruck = TruckCar(type: .truck, model: "noname", brand: "volvo", dateOfRelease: 1995, cost: 100000, carId: "", engine: .engineOff, windows: .rolledDown, trailer: true, maxCarryingCapacity: 200, carryingCurrentCapacity: 0, loading: 10, loadingStat: .empty)

testTruck.culcCarryingCapacity(carryingCurrentCapacity: 100, maxCarryingCapacity: 200, loading: 100)
testTruck.implement(action: .turnEngine(.engineOff))
var testCargo = testTruck.culcCarryingCapacity(carryingCurrentCapacity: 100, maxCarryingCapacity: 100, loading: 100)
print(testTruck.implement(action: .turnEngine(.engineOn)))



