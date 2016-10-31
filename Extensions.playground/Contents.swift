//: Playground - noun: a place where people can play

import Cocoa

typealias Velocity = Double

extension Velocity {
    
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity { return self }
    
} // Velocity

protocol VehicleType {
    
    var topSpeed: Velocity { get }
    var numberOfDoor: Int { get }
    var hasFlatbed: Bool { get }
    
} // VehicleType

struct Car: CustomStringConvertible {
    
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    
    var gasLevel: Double {
        
        willSet {
            
            precondition(newValue <= 1.0 && newValue >= 0.0, "El nuevo valor tiene que estar entre 0 y 1.")
            
        } // willSet
        
    } // gasLevel
    
    var description: String {
        
        return String("\(make) modelo \(model) del año \(year)")
        
    } // description
    
} // Car

extension Car: VehicleType {
    
    var topSpeed: Velocity { return 200 }
    var numberOfDoor: Int { return 3 }
    var hasFlatbed: Bool { return false }
    
} // Car extension

extension Car {
    
    init(carMake: String, carModel: String, carYear: Int) {
        
        self.init(make: carMake, model: carModel, year: carYear, color: "Black", nickname: "N/A", gasLevel: 1.0)
        
    } // init
    
} // // Car extension

extension Car {
    
    enum CarKind: CustomStringConvertible {
        
        case Coupe, Sedan, Hatchback
        
        var description: String {
            
            switch self {
                
            case .Coupe:
                
                return "Coupe"
                
            case .Sedan:
                
                return "Sedan"
                
            case .Hatchback:
                
                return "Hatchback"
                
            } // swift
            
        } // description
        
    } // CarKind
    
    var kind: CarKind {
        
        if numberOfDoor == 2 {
            
            return .Coupe
            
        } else if numberOfDoor == 3 {
            
            return .Hatchback
            
        } else {
            
            return .Sedan
            
        } // else
        
    } // kind
    
} // Car extension

extension Car {
    
    mutating func emptyGas(amount: Double) {
        
        precondition(amount <= 1 && amount > 0, "La cantidad a consumir tiene que estar entre 0 y 1.")
        
        gasLevel -= amount
        
    } // emptyGas
    
    mutating func fillGas() {
        
        gasLevel = 1.0
        
    } // fillGas
    
} // Car extension

var myFirstCar = Car(carMake: "Skoda", carModel: "Fabia", carYear: 2015)

myFirstCar.fillGas()

print("El carro es un \(myFirstCar.kind) marca \(myFirstCar) y el nivel de combustible es de \(myFirstCar.gasLevel)")
