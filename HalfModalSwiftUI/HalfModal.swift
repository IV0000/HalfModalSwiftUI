//
//  HalfModal.swift
//  HalfModalSwiftUI
//
//  Created by Ivan Voloshchuk on 25/03/22.
//

import SwiftUI

struct HalfModal<T>: UIViewRepresentable where T: View{
    @Binding var label: String
    let content: T
    let detents: [UISheetPresentationController.Detent]
    let grabber: Bool
    
    init(label: Binding<String>,detents: [UISheetPresentationController.Detent],grabber : Bool, @ViewBuilder content: () -> T) {
        _label = label
        self.content = content()
        self.grabber = grabber
        self.detents = detents
    }
    
    //Button
    func makeUIView(context: UIViewRepresentableContext<HalfModal>) -> UIButton {
        
        /// Customize your button here.
        let button = UIButton(type: .system)
        button.setTitle(label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .default)
        let image = UIImage(systemName: "person.circle.fill", withConfiguration: imageConfiguration)
        button.setImage(image, for: .normal)
        button.addAction(UIAction { _ in
            
            let hostingController = UIHostingController(rootView: content)
            let viewController = HalfModalController(detents: detents,grabber: grabber)
            viewController.addChild(hostingController)
            viewController.view.addSubview(hostingController.view)
            hostingController.view.pinToEdgesOf(viewController.view)
            hostingController.didMove(toParent: viewController)
            
            button.window?.rootViewController?.present(viewController, animated: true)
        }, for: .touchUpInside)
        
        return button
    }
    
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        //Update the button view when the binding label changes
        uiView.setTitle(label, for: .normal)

    }
    
    func makeCoordinator() -> Void {
        return ()
    }
}

extension UIView {
    func pinToEdgesOf(_ other: UIView) {
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

