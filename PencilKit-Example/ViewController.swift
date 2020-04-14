//
//  ViewController.swift
//  PencilKit-Example
//
//  Created by Lucas Fernandez Nicolau on 14/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit
import PencilKit

class ViewController: UIViewController, PKCanvasViewDelegate {

    let canvasView = PKCanvasView(frame: UIScreen.main.bounds)
    var toolPicker: PKToolPicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.addSubview(canvasView)
        canvasView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let window = view.window else { return }
        toolPicker = PKToolPicker.shared(for: window)
        toolPicker?.setVisible(true, forFirstResponder: canvasView)
        toolPicker?.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }

    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        // Using it for trolling purposes :D
        guard let toolPicker = toolPicker else { return }

        if let inkingTool = toolPicker.selectedTool as? PKInkingTool {
            canvasView.backgroundColor = inkingTool.color
        }
    }
}

