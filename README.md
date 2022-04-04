# HalfModalSwiftUI
Based on this [post](https://www.donnywals.com/using-uisheetpresentationcontroller-in-swiftui/) I've created a custom privacy picker in SwiftUI.

Since there is no native half modal in SwiftUI I've used `UIViewRepresentable` protocol to create a wrapper of the `UIKit` view. Then I have used the recently introduced `UISheetPresentationController` to create the half modal experience in UIKit. To present the modal I've used an `UIButton` to show the modal.

![Simulator Screen Recording - iPhone 8 Plus - 2022-04-04 at 11 12 18](https://user-images.githubusercontent.com/94223094/161512562-0721b7f5-6204-4bb7-8c69-5d95efe84955.gif#gh-light-mode-only)

![Simulator Screen Recording - iPhone 8 Plus - 2022-04-04 at 11 47 28](https://user-images.githubusercontent.com/94223094/161518983-5990e4d0-c6f9-475e-a551-c7f9d9668a25.gif#gh-dark-mode-only)

