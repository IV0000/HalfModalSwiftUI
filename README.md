# HalfModalSwiftUI
Based on [this](https://www.donnywals.com/using-uisheetpresentationcontroller-in-swiftui/) tutorial i've tried to create a custom privacy picker in SwiftUI.
To achieve this I've used UIViewRepresentable protocol to create a wrapper of the UIkit view in which I have used the UISheetPresentationController and a UIButton to show the modal.

![Simulator Screen Recording - iPhone 13 Pro - 2022-03-25 at 18 49 04](https://user-images.githubusercontent.com/94223094/160174724-c4d949ac-feff-4775-a378-c24098603029.gif#gh-dark-mode-only)


![Simulator Screen Recording - iPhone 13 Pro - 2022-03-25 at 18 23 03](https://user-images.githubusercontent.com/94223094/160170753-df745f2a-758a-40d3-80f2-8e2015b0f213.gif#gh-light-mode-only)

Note: In this gif the bottom corners of the modal are rounded (idk why). This is just an issue of the gif, in the simulator is all working fine.
