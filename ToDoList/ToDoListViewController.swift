//
//  ViewController.swift
//  ToDoList
//
//  Created by Gennadiy Glotov on 25.02.2018.
//  Copyright © 2018 Gennadiy Glotov. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let toDoListArray = ["Купить молока", "Купить черный хлеб", "Купить яиц"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK - Методы данных для таблицы
    
    //сколько отображать ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListArray.count
    }

    //какие данные записывать в созданные ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //объявляем переменную на прототип ячейки для работы с ней
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellToDoItem", for: indexPath)
        
        //записываем в ячейки текст из массива
        cell.textLabel?.text = toDoListArray[indexPath.row]
        
        //возвращаем заполненную ячейку
        return cell
    }
    
    //MARK - Метод делегирования таблицы
    
    //позволяет отследить нажатую ячейку и указать действия при нажатии на нее
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("Нажата ячейка с именем - \(toDoListArray[indexPath.row])")
        
        //устанавливаем флаг на ячейку при нажатии
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        //снимаем флаг при нажатии на ячейку если он был установлен ранее или установливаем если отсутствовал флаг
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            //сниятие фалага
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            //установка флага
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        //когда нажимаем на ячейку, она сереет и затем серость плавно снимается
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

