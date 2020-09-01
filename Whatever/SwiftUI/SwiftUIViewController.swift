//
//  SwiftUIViewController.swift
//  Whatever
//
//  Created by Chen Yue on 27/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import UIKit
import SwiftUI

class SwiftUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		let swiftUIView: some View = SwiftUIView()
		let nextView = UIHostingController(rootView: swiftUIView)
		self.addChild(nextView)
		self.view.addSubview(nextView.view)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
