//
//  TopView.swift
//  CleanerApp
//
//  Created by Mohammad Noor on 12/12/24.
//

import UIKit


class TopView: UIView {
    
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    weak var viewController: UIViewController?
    
    var updateCountCompletion: ((Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("TopView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func updateImageCount(_ count: Int) {
        if let viewController = viewController, viewController is PhotoCleanUpController {
            countLabel.text = "\(count) images loaded"
        } else {
            print("Update not allowed from this view controller")
        }
    }
    
    func setUpdateCountCompletionHandler(for viewController: UIViewController) {
        self.viewController = viewController
        self.updateCountCompletion = { [weak self] count in
            self?.updateImageCount(count)
        }
    }
}
