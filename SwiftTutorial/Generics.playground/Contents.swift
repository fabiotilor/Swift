import Foundation

func perform<N: Numeric>(_ op: (N, N) -> N, on lhs: N, and rhs: N) -> N {
    return op(lhs, rhs)
}

perform(+, on: 10.7, and: 30)

protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person: CanJump, CanRun {
    func run() {
        "running"
    }
    func jump() {
        "jumping"

        }
}

func jumpandrun<T: CanJump & CanRun>(value: T){
    value.jump()
    value.run()
}

let person = Person()
jumpandrun(value: person)


extension [String] {
    func longestString() -> String? {
        self.sorted{(lhs: String, rhs: String) -> Bool in lhs.count > rhs.count}.first
    }
}

["Foo", "Bar Baz", "abc"].longestString()

protocol View {
    func addSubview(_ view: View)
}

extension View {
    func addSubView(_ view: View) {
        //empty
    }
}

struct Button: View {
    func addSubview(_ view: any View) {
        //empty
    }
}

protocol PresentableAsView {
    associatedtype ViewType: View
    func produceView() -> ViewType
    func configure(superView: View, thisView: ViewType)
    func present(view: ViewType, on superView: View)
}

extension PresentableAsView {
    func configure(superView: View, thisView: ViewType){
        //empty
    }
    func present(view: ViewType, on superview: View){
        superview.addSubView(view)
    }
}

struct MyButton: PresentableAsView {
    func produceView() -> Button {
        Button()
    }
}
