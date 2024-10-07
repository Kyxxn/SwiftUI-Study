## @EnvironmentObject 정리
### @EnvironmentObject를 갖는 EnvironmentObjectSuperView 구조체
``` swift
struct EnvironmentObjectSuperView: View {
    @EnvironmentObject var demoData: DemoData
    
    var body: some View {
        NavigationLink(destination: SecondView()) {
            Text("Go to Second View")
        }
    }
}
```
- 부모 뷰에서 정의한 `ObservableObject`의 객체로, 서브뷰에 주입하여 서브뷰를 띄워준다.
- @EnvironmentObject를 프로퍼티로 갖는 뷰를 띄우기 위해 SceneDelegate에서 다음과 같이 설정한다.
    ``` swift
    let contentView = EnvironmentObjectSuperView()
    let demoData = DemoData()
    let mainWithSwiftUI = UIHostingController(rootView: contentView.environmentObject(demoData))
    window?.rootViewController = mainWithSwiftUI
    ```
    - SceneDelegate에서 `DemoData`를 만들었고, 해당 데이터를 `environmentObject(object:)` 메소드를 통해 넘겨줬다.
    - 이때, `DemoData`는 반드시 `ObservableObject` 프로토콜을 채택해야 함
- 자식 뷰들은 @EnvironmentObject 프로퍼티를 변경시키면 부모에서도 모두 뷰가 변경된다.
    - 내 코드 예제에서 `SecondView`의 값을 변경하고 돌아와도 부모뷰에서도 변경된 count 값이 보인다.
    - 전역적으로 데이터를 공유하는 형태, 뷰 간 데이터를 공유할 때 주로 쓴다고 함
