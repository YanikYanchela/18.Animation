import UIKit

class ViewController: UIViewController {
    
    let ball = UIImageView(frame: CGRect(x: 125, y: 450, width: 150, height: 100))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        stackView()
        setupBall()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func stackView() {
        let horizontStackView = UIStackView()
        horizontStackView.axis = .horizontal
        horizontStackView.alignment = .center
        horizontStackView.distribution = .fillEqually
        horizontStackView.backgroundColor = .lightText
        horizontStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontStackView.layer.cornerRadius = 20
        
        let buttonView1 = UIView()
        let buttonView2 = UIView()
        let buttonView3 = UIView()
        let buttonView4 = UIView()
        setupView(view: buttonView1)
        setupView(view: buttonView2)
        setupView(view: buttonView3)
        setupView(view: buttonView4)
        
        let button1 = UIButton()
        button1.setTitle("Jump", for: .normal)
        setupButton(button: button1)
        button1.addTarget(self, action: #selector(animateBallJump(_:)), for: .touchUpInside)
      
        
        let button2 = UIButton()
        button2.setTitle("Spring", for: .normal)
        setupButton(button: button2)
        button2.addTarget(self, action: #selector(springAnimation(_:)), for: .touchUpInside)
       
        
        let button3 = UIButton()
        button3.setTitle("Reverse", for: .normal)
        setupButton(button: button3)
        button3.addTarget(self, action: #selector(jaBall(_:)), for: .touchUpInside)
      
        let button4 = UIButton()
        button4.setTitle("Zoom", for: .normal)
        setupButton(button: button4)
        button4.addTarget(self, action: #selector(sizeBall(_:)), for: .touchUpInside)
      
        
        horizontStackView.addArrangedSubview(buttonView1)
        horizontStackView.addArrangedSubview(buttonView2)
        horizontStackView.addArrangedSubview(buttonView3)
        horizontStackView.addArrangedSubview(buttonView4)
        
        buttonView1.addSubview(button1)
        buttonView2.addSubview(button2)
        buttonView3.addSubview(button3)
        buttonView4.addSubview(button4)
        
        view.addSubview(horizontStackView)
        
        NSLayoutConstraint.activate([
            horizontStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            horizontStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Add constraints for buttons inside buttonViews
            button1.topAnchor.constraint(equalTo: buttonView1.topAnchor, constant: 10),
            button1.bottomAnchor.constraint(equalTo: buttonView1.bottomAnchor, constant: -10),
            button1.trailingAnchor.constraint(equalTo: buttonView1.trailingAnchor, constant: -10),
            button1.leadingAnchor.constraint(equalTo: buttonView1.leadingAnchor, constant: 10),
            
            button2.topAnchor.constraint(equalTo: buttonView2.topAnchor, constant: 10),
            button2.bottomAnchor.constraint(equalTo: buttonView2.bottomAnchor, constant: -10),
            button2.trailingAnchor.constraint(equalTo: buttonView2.trailingAnchor, constant: -10),
            button2.leadingAnchor.constraint(equalTo: buttonView2.leadingAnchor, constant: 10),
            
            button3.topAnchor.constraint(equalTo: buttonView3.topAnchor, constant: 10),
            button3.bottomAnchor.constraint(equalTo: buttonView3.bottomAnchor, constant: -10),
            button3.trailingAnchor.constraint(equalTo: buttonView3.trailingAnchor, constant: -10),
            button3.leadingAnchor.constraint(equalTo: buttonView3.leadingAnchor, constant: 10),
            
            button4.topAnchor.constraint(equalTo: buttonView4.topAnchor, constant: 10),
            button4.bottomAnchor.constraint(equalTo: buttonView4.bottomAnchor, constant: -10),
            button4.trailingAnchor.constraint(equalTo: buttonView4.trailingAnchor, constant: -10),
            button4.leadingAnchor.constraint(equalTo: buttonView4.leadingAnchor, constant: 10)
        ])
    }
    
    func setupView(view: UIView) {
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 85)
            
        ])
    }
   
    func setupButton(button: UIButton) {
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 2, height: 2.5)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { finished in
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
            }
        }
        
       
    }
    func setupBall(){
        ball.image = UIImage(named: "basket")
        ball.contentMode = .scaleAspectFill
        
       
        ball.layer.shadowColor = UIColor.black.cgColor
        ball.layer.shadowOpacity = 0.9
        ball.layer.shadowRadius = 5
        ball.layer.shadowOffset = CGSize(width: 3, height: 3)
        
       
        
        view.addSubview(ball)
    }
    
   @objc func animateBallJump(_ sender: UIButton) {
        // Изначальное положение шара
       let originalCenter = self.ball.center

        // Задаем новое положение шара (например, вверх относительно изначального центра)
        let jumpTargetCenter = CGPoint(x: originalCenter.x, y: originalCenter.y - 350)
      
        // Выполняем анимацию прыжка
       UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.ball.center = jumpTargetCenter
        }) { finished in
            
            UIView.animate(withDuration: 0.4) {
                self.ball.center = originalCenter
                
            }
        }
    }

    @objc func springAnimation(_ sender: UIButton) {
        // Изначальное положение шара
        let originalCenter = self.ball.center
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                
                self.ball.center = CGPoint(x: 100, y: 300)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.8) {
               
                self.ball.center = CGPoint(x: 300, y: 300)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.5) {
                
                self.ball.center = originalCenter
            }
        }, completion: nil)
    }
    
    @objc func jaBall(_ sender: UIButton){
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.ball.transform = CGAffineTransform(rotationAngle: .pi)
            
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.ball.transform = .identity
            }
        }
    }
    
    @objc func sizeBall(_ sender: UIButton){
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.ball.transform = CGAffineTransform(scaleX: 3, y: 3)
        }) { _ in
            UIView.animate(withDuration: 0.5){
                self.ball.transform = .identity
            }
        }
    }
    
  
}
