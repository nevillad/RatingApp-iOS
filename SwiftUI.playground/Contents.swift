import UIKit

var str = "Hello, playground"

struct User {
    var name: String
    lazy var reverdsedName: String = {
        String(name.reversed())
    }()
}
