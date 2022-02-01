//1. protocol 만들기
//2. delegate 프로퍼티를 가지는 클래스 만들기
//3. delegate 받고 싶은 클래스 구조체에서 init 내부에 자기 자신을 2의 delegate에 할당하기
/*
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    // having AdvancedLifeSupport protocal as a date type
    // means.. whoever sets themselves as the delegate
    // any class or struct must have AdvancedLifeSupport adopted
    
    // 왜 protocol 채택이 요구되는가?
    // 그래야 delegate된 당사자한테 요구하려는 메소드를 그 당사자가 수행할 수 잇을테니까
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR() // it makes whoever set as delegate do something
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self // "I am going to listen for notifications from the one from EmergencyCallHandler"
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second")
    }
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second")
    }
    
    func useStethescope() {
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings 'staying alive' by BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr........")
    }
}



let erCallHandler = EmergencyCallHandler()
let paramedic = Paramedic(handler: erCallHandler)
let doc = Doctor(handler: erCallHandler)

erCallHandler.assessSituation()
erCallHandler.medicalEmergency()
*/
import Foundation

protocol FakeUITextFieldDelegate {
    func keyboardAppeared()
    func keyboardDismissed()
}

class FakeUITextField {
    var delegate: FakeUITextFieldDelegate?
    
    func startInput() {
        delegate?.keyboardAppeared()
    }
    
    func endInput() {
        delegate?.keyboardDismissed()
    }
}

class FakeViewController: FakeUITextFieldDelegate {
    
    init(fakeUItf: FakeUITextField) {
        fakeUItf.delegate = self
    }
    
    func keyboardAppeared() {
        print("keyboard appeared!")
    }
    
    func keyboardDismissed() {
        print("keyboard dismissed!")
    }
}

let fakeUITextField = FakeUITextField()
let fakeVC = FakeViewController(fakeUItf: fakeUITextField)

fakeUITextField.startInput()
