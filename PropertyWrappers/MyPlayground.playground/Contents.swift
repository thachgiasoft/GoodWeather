//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

// UPPER CASE PROPERTY WRAPPER
//@propertyWrapper
//class UpperCase {
//
//    private(set) var value: String = ""
//
//    var wrappedValue: String {
//        get { value }
//        set {
//            value = newValue.uppercased()
//        }
//    }
//}
//
//struct Driver {
//    @UpperCase
//    var liscense: String
//
//    @UpperCase
//    var state: String
//}
//
//extension Driver {
//    init(liscense: String){
//        self.liscense = liscense
//    }
//}
//
//var driver = Driver(liscense: "ert567")
//driver.state = "la"
//
//print(driver.liscense)
//print(driver.state)

// URLENCODE PROPERTY WRAPPER
@propertyWrapper
class URLEncode {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                self.value = url
            }
        }
    }
}

struct Resource {
    @URLEncode
    var city: String
    
    var url: String {
        "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=imperial&appid=80bfc380493c28d43427b365a176cf96"
    }
}

extension Resource {
    init(city: String){
        self.city = city
    }
}

let resource: Resource = Resource(city: "Los Angeles")

print(resource.city)
print(resource.url)
