//
//  AnswerCell.swift
//  Quiz
//
//  Created by Natália Carolina Dos Santos on 19/09/21.
//

import UIKit

class AnswerCell: UITableViewCell {
    
    enum Style {
        case blank
        case selected
        case correct
        case incorrect
    }
    
    var style: Style = .blank
    var showResponse: Bool = false
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(title: String, answer: Style) {
        labelTitle.text = title
        style = answer
        
        viewBackground.layer.cornerRadius = 10
        viewBackground.layer.borderWidth = 1
        
        switch style {
        case .blank:
            viewBackground.backgroundColor = .white
            viewBackground.layer.borderColor = UIColor.gray.cgColor
            
        case .selected:
            viewBackground.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
            viewBackground.layer.borderColor = UIColor.purple.cgColor
            
        case .correct:
            viewBackground.backgroundColor = UIColor.green.withAlphaComponent(0.5)
            viewBackground.layer.borderColor = UIColor.green.cgColor
            
        case .incorrect:
            viewBackground.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            viewBackground.layer.borderColor = UIColor.red.cgColor
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {

        viewBackground.backgroundColor = selected ? UIColor.purple.withAlphaComponent(0.5) : .white
        viewBackground.layer.borderColor = selected ? UIColor.purple.cgColor : UIColor.gray.cgColor
    }
        
}
