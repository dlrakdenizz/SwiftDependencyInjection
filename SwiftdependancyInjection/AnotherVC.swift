//
//  AnotherVC.swift
//  SwiftdependancyInjection
//
//  Created by Dilara Akdeniz on 30.09.2024.
//

import UIKit

class AnotherVC: UIViewController {
    
    private let providerProtocol : BackgroundProviderProtocol?
    
    //Alttaki iki kısım hatalardan kurtulmak için yapıldı
    init(providerProtocol : BackgroundProviderProtocol?){
        self.providerProtocol = providerProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = providerProtocol?.backgroundColor ?? .white
    }

}
