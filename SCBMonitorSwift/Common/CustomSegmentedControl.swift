import UIKit

protocol CustomSegmentedControlDelegate: AnyObject {
    func change(to index:Int)
}

final class CustomSegmentedControl: UIView {
    // MARK: - Properties
    
    private lazy var buttonTitles: [String] = []
    private lazy var buttons: [UIButton] = []
    private lazy var selectorView = UIView()
    private lazy var unSelectorView = UIView()
    
    var textColor: UIColor = UIColor(red: 223.0 / 255, green: 223.0 / 255, blue: 223.0 / 255, alpha: 1)
    var selectorViewColor: UIColor = UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1)
    var selectorTextColor: UIColor = UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1)
    var unSelectorViewColor: UIColor = UIColor(red: 223.0 / 255, green: 223.0 / 255, blue: 223.0 / 255, alpha: 1)
    
    weak var delegate: CustomSegmentedControlDelegate?
    
    public private(set) var selectedIndex = 0
    // MARK: - Initializers

    convenience init(frame:CGRect, buttonTitle: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    // MARK: - Overrided
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    // MARK: - Functions
    
    func setButtonTitles(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        updateView()
    }
    
    func setIndex(index: Int) {
        buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
        let button = buttons[index]
        selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(index)
        
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    // MARK: - OBJC functions
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let unSelectorPosition = selectorView.frame.origin.x
                let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                delegate?.change(to: selectedIndex)
                
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                    self.unSelectorView.frame.origin.x = unSelectorPosition
                }
                
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
}

//Configuration View
extension CustomSegmentedControl {
    // MARK: - Private functions
    
    private func updateView() {
        createButton()
        configSelectorView()
        configUnSelectorView()
        configStackView()
    }
    
    private func configStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.leftAnchor.constraint(equalTo: self.leftAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stack.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    private func configSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 0,
                                            y: self.frame.height,
                                            width: selectorWidth,
                                            height: 2))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func configUnSelectorView() {
        let unSelectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        unSelectorView = UIView(frame: CGRect(x: selectorView.frame.maxX,
                                            y: self.frame.height,
                                            width: unSelectorWidth,
                                            height: 2))
        unSelectorView.backgroundColor = unSelectorViewColor
        addSubview(unSelectorView)
    }
    
    private func createButton() {
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action:#selector(buttonAction(sender:)),
                             for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
}

