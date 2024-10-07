이번 챕터에서 `@Published`, `ObservableObject`, `@ObservedObject`를 배웠다.

3개를 다 알아야 함께 사용할 수 있음

## 1. @Published
> Combine - `@propertyWrapper struct Published<Value>`

- Combine에 등장하는 것과 같은 역할을 함
- 해당 속성이 변경되면, 구독중인(= 바인딩중인) 내용이 같이 바뀜
    - 여기서 State와 유사할 수 있는데 State는 뷰 내부에서 @State 프로퍼티를 관리함
    - 반면 @Published는 `ObservableObject` 프로토콜을 통해 감지하게 됨
        `public protocol ObservableObject : AnyObject {}`
    - 여러 곳에서 상태 공유가 가능
- `ObservableObject`을 채택해야 하므로, AnyObject 즉 class로만 구현이 가능함

## 2. ObservableObject
> Combine - `protocol ObservableObject : AnyObject {}`

- @Published의 변경을 감지해서 `@ObservedObject` 프로퍼티들에게 값을 갱신해줌
- 클래스에서만 채택 가능함

## 3. @ObservedObject
> SwiftUICore - `struct ObservedObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {}`
- observable 객체를 구독하는 프로퍼티 래퍼
- @Published가 ObservableObject 프로토콜을 채택하니까 해당 프로퍼티를 구독하는 것이라 생각함
- observable 객체가 변경되면 이 프로퍼티 래퍼도 값이 변경되고, 즉 뷰를 새로 그릴 수 있게 감지할 수 있음
