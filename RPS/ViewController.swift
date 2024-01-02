//
//  ViewController.swift
//  RPS
//
//  Created by Sanzhar Serikbay on 2023/03/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rpsImage1: UIImageView!
    @IBOutlet weak var rpsImage2: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    let images = [
        UIImage(named: "rock"),
        UIImage(named: "paper"),
        UIImage(named: "scissors")
    ]
    
    var isAnimating: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                rpsImage1.image = UIImage(named: "paper")
                rpsImage2.image = UIImage(named: "scissors")
        
        
    }
    
    @IBAction func playButtonTapped(_ sender: Any ) {
        
        print("User tapped play button")
        rpsImage1.image = images[randomImageIndex()]
        rpsImage2.image = images[randomImageIndex()]
        
        if let sender = sender as? UIButton {
            sender.alpha = 0.5
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
                sender.alpha = 1.0
            }
            // Если уже выполняется анимация, игнорируем дополнительные нажатия
            guard !isAnimating else { return }
            
            isAnimating = true
            playButton.isEnabled = false
            
            // Показываем рандомные изображения в течение 1 секунд
            animateRandomImages()
        }
        
        func animateRandomImages() {
            let totalAnimationFrames = 20 // Общее количество кадров анимации
            let animationDuration = 1.0 // Длительность анимации в секундах
            
            var animationFramesCount = 0
            var animationTimer: Timer?
            
            // Запускаем анимацию
            animationTimer = Timer.scheduledTimer(withTimeInterval: animationDuration / Double(totalAnimationFrames), repeats: true) { timer in
                self.rpsImage1.image = self.images[randomImageIndex()]
                self.rpsImage2.image = self.images[randomImageIndex()]
                
                animationFramesCount += 1
                if animationFramesCount >= totalAnimationFrames {
                    timer.invalidate()
                    showResult()
                }
            }
        }
        
        func showResult() {
            // По окончании анимации показываем результат
            
            // Пример: Показываем результат
            rpsImage1.image = images[randomImageIndex()]
            rpsImage2.image = images[randomImageIndex()]
            
            
            // Сброс состояния после окончания игры
            isAnimating = false
            playButton.isEnabled = true
        }
        
        //    func randomImageIndex() -> Int {
        //        return Int.random(in: 0..<images.count)
        
        func randomImageIndex() -> Int {
            return Int.random(in: 0..<images.count)
            
        }
        
        
    }
    
    
}
