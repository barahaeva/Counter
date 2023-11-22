import UIKit

class ViewController: UIViewController {
    
    // MARK: IB Outlets
    @IBOutlet weak var changesMessage: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var changesView: UITextView!
    
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var reduceButton: UIButton!
    
    
    // MARK: Private Properties
    private var count = 0 {
        didSet {
            countLabel.text = "\(count)" // Спасибо Дмитрию за эту фишку ;)
        }
    }
    
    private var isShown = false
    
    
    // MARK: View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundButton(addButton)
        roundButton(reduceButton)
        changesMessage.alpha = 0
        changesView.alpha = 0
        
    }
    
    
    // MARK: IB Actions
    @IBAction private func showHistoryButton(_ sender: Any) {
        if isShown {
            changesView.alpha = 0
            isShown = false
        } else {
            changesView.alpha = 1
            isShown = true
        }
    }
    
    @IBAction private func addCount(_ sender: Any) {
        count += 1
        changesView.text += "\n \(Date().formatted()): Значение изменено на +1"
        changesMessage.text = "Значение изменено на +1"
        changesMessageAnimated()
    }
    
    @IBAction private func reduceCount(_ sender: Any) {
        if count > 0 {
            count -= 1
            changesView.text += "\n \(Date().formatted()): Значение изменено на -1"
            changesMessage.text = "Значение изменено на -1"
            changesMessageAnimated()
            
        } else {
            changesView.text += "\n \(Date().formatted()): Попытка уменьшить значение счётчика ниже 0"
            changesMessage.text = "Не удалось уменьшить значение"
            changesMessageAnimated()
        }
    }
    
    @IBAction private func resetCount(_ sender: Any) {
        count = 0
        changesView.text += "\n \(Date().formatted()): Значение сброшено"
        changesMessage.text = "Значение сброшено"
        changesMessageAnimated()
    }
    
    
    // MARK: Private Methods
    private func changesMessageAnimated() {
        changesMessage.alpha = 1
        UIView.animate(withDuration: 1.5) {
            self.changesMessage.alpha = 0
        }
    }
    
    private func roundButton(_ button: UIButton) {
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
    }
    
    
}

