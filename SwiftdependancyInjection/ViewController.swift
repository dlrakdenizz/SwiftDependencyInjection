//
//  ViewController.swift
//  SwiftdependancyInjection
//
//  Created by Dilara Akdeniz on 29.09.2024.
//


//Dependency Injection (DI), Swift'te ve diğer dillerde, bir sınıfın bağımlılıklarını (başka sınıflar, veriler veya servisler) dışarıdan almasını sağlayan bir tasarım desenidir. Bu desen, nesnelerin bağımlılıklarını (diğer nesneler) kendi içinde yaratmak yerine dışarıdan almalarını sağlar. DI, esneklik, test edilebilirlik ve kodun yeniden kullanılabilirliğini artırmak amacıyla kullanılır.

//Dependency demek projemizin çalışabilmesi için bağımlı olduğu yapılar demektir. O yüzden indirilen Frameworkler'de birer dependency'dir. (Swinject inen kısımda da Package Dependency yazıyor zaten)

import UIKit
import Swinject


class ViewController: UIViewController {
    
    //Swinject
    //Burada bir container oluşturuyoruz. Bu kısımda containerda bazı şeyleri register(kayıt) ediyoruz ve sonrasında kaydettiklerimizi başka yerlerde kullanabiliyoruz.
    //Aşağıdaki kodda ilk kısımda dedik ki BackgroundProviderClass'ı kaydettik ve eğer bir gün bu class oluşturulursa sana ben bunu kaydettim buna göre oluştur. İkinci kısımda da dedik ki eğer bir gün bir AnotherVC oluşturulmak istenirse senden bazı parametreler istenecek (providerProtocol gibi) sen bunu tanımlamayı biliyorsun çözümleyebilirsin(resolver.resolve ile) dedik
    //Ama her şeye rağmen bunun tam olarak çözümlenip çözümlenemeyeceğinden emin değiliz dolayısıyla AnotherVC kısmında protokolü option yaptık
    let container : Container = {
        let container = Container()
        container.register(BackgroundProvidingClass.self) { resolver in
            return BackgroundProvidingClass()
        }
        container.register(AnotherVC.self) { resolver in
            let vc = AnotherVC(providerProtocol: resolver.resolve(BackgroundProvidingClass.self))
            return vc
        }
        
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.backgroundColor = .systemBlue
        //Kodla buton ekledik
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.setTitle("Open Another VC", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func buttonClicked() {
        if let viewController = container.resolve(AnotherVC.self) { //if let dedik çünkü ya çözümleyemezse
            present(viewController, animated: true)
        }
    }


}

