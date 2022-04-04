//
//  HalfModal.swift
//  HalfModalSwiftUI
//
//  Created by Ivan Voloshchuk on 25/03/22.
//

import SwiftUI

struct HalfModal<T>: UIViewRepresentable where T: View{
    
    // Declaration of variables needed for HalfModal
    
    @Binding var label: String
    let content: T
    
    /// Detent represent the size of the modal we are going to create. It can be either medium or large
    let detents: [UISheetPresentationController.Detent]
    
    /// The grabber is the symbol that indicates that the sheet is resizable
    let grabber: Bool
    
    ///  I use @ViewBuilder to put a custom content on the half modal that will appear without the necessity of using Storyboards
    init(label: Binding<String>,detents: [UISheetPresentationController.Detent],grabber : Bool, @ViewBuilder content: () -> T) {
        _label = label
        self.content = content()
        self.grabber = grabber
        self.detents = detents
    }
    
    // Creating the UIButton
    func makeUIView(context: UIViewRepresentableContext<HalfModal>) -> UIButton {
        
        /// Button customization
        let button = UIButton(type: .system)
        button.setTitle(label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .default)
        let image = UIImage(systemName: "person.circle.fill", withConfiguration: imageConfiguration)
        button.setImage(image, for: .normal)
        
        /// Action on button press
        button.addAction(UIAction { _ in
            
            /// Definining a UIHostingController to host the SwiftUI view (in this case it is the content view)
            let hostingController = UIHostingController(rootView: content)
            
            /// Defining my half modal viewController
            let viewController = HalfModalController(detents: detents,grabber: grabber)
            
            /// Add as a child of the current view controller.
            viewController.addChild(hostingController)
            
            /// Add the SwiftUI view to the view controller view hierarchy.
            viewController.view.addSubview(hostingController.view)
            
            /// It setups the constraints of the view to fit the SwiftUI boundaries
            hostingController.view.pinToEdges(viewController.view)
            
            /// Notify the hosting controller that it has been moved to the view controller.
            hostingController.didMove(toParent: viewController)
            
            /// Present the half modal on button tap
            button.window?.rootViewController?.present(viewController, animated: true)
            
        }, for: .touchUpInside)
        
        return button
    }
    
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        /// Update the button view when the binding label changes
        uiView.setTitle(label, for: .normal)

    }
    
    func makeCoordinator() -> Void {
        return ()
    }
}

extension UIView {
    
    /// This function is needed to fit the content of the half modal on every screen size
    func pinToEdges(_ other: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: other.leftAnchor).isActive = true
        topAnchor.constraint(equalTo: other.topAnchor).isActive = true
        rightAnchor.constraint(equalTo: other.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: other.bottomAnchor).isActive = true
    }
}



class HalfModalController: UIViewController {
    
    let detents: [UISheetPresentationController.Detent]
    let grabber: Bool
    
    init(detents: [UISheetPresentationController.Detent],grabber : Bool) {
        self.detents = detents
        self.grabber = grabber
        super.init(nibName: nil, bundle: nil)
    }
    
    /// init(coder:) is called only when you create your views from storyboard. It will never be invoked since we are going with no-storyboard so we can safely fatal out.
    required init?(coder: NSCoder) {
        fatalError("No Storyboards")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sheetController = self.presentationController as? UISheetPresentationController {
            sheetController.detents = detents
            sheetController.prefersGrabberVisible = grabber
        }
    }
}

