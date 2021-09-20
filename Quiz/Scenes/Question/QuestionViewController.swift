//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Natália Carolina Dos Santos on 19/09/21.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let question = QuestionModel(question: "Qual posição Harry joga em seu time de quadribol",
                                 answer:[
                                    "Artilheiro",
                                    "Batedor",
                                    "Goleiro",
                                    "Apanhador"
                                 ],
                                 answerCorrect: "Apanhador")
    var questionSelected: String?
    var indexSelected: IndexPath?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
    
    
    @IBAction func handlerButtonAnswer(_ sender: UIButton) {
        if let indexSelected = indexSelected,
           let cell = tableView.cellForRow(at: indexSelected) as? AnswerCell {
            let answer = question.answer[indexSelected.row]
            let isCorrect = answer == question.answerCorrect
            cell.setup(title: question.answer[indexSelected.row], style: isCorrect ? .correct : .incorrect)
        }
    }
    
    func setupUI() {
        
        tableView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.answer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let answer = question.answer[indexPath.row]
    
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell") as? AnswerCell {

            var style: AnswerCell.Style = cell.isSelected ? .selected : .blank
            
            if questionSelected != nil {
                if questionSelected == question.answerCorrect{
                        style = .correct
                    } else {
                        style = .incorrect
                    }
                }
        
            cell.setup(title: answer, style: style)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      questionSelected = question.answer[indexPath.row]
      indexSelected = indexPath
    }
}
