//
//  ViewController.swift
//  ToDoList
//
//  Created by Gennadiy Glotov on 25.02.2018.
//  Copyright © 2018 Gennadiy Glotov. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var toDoListArray = ["Купить молока", "Купить черный хлеб", "Купить яиц"]
    
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
    
    //MARK - Добавление новой записи
    //описываем дейсвтия при нажатии на "+" для добавления еще одной записи в ячейке на экарне
    
    @IBAction func AddButtonPressed(_ sender: Any) {
        
        //объявим переменную для сохранения текста из окна alert
        var textField = UITextField()
        
        //объявление окна alert
        let alert = UIAlertController(title: "Добавление новой записи", message: "", preferredStyle: .alert)
        
        //объявления кнопки для alert для добавления записи
        let action = UIAlertAction(title: "Добавить запись", style: .default) { (action) in
            // что происходит при нажатии кнопки "добавить запись" на UIAlert
            print("Нажата кнопка добавить запись для записи - \(textField.text ?? "пустая строка")")
            
            if textField.text != "" {
                //добавление новой записи в массив данных
                self.toDoListArray.append(textField.text!)
                
                //обновляем окно для отображения новой добавленной записи польщователем
                self.tableView.reloadData()
            }
        }
        
        //объявления кнопки для alert для отмены добавления записи
        let actionCancel = UIAlertAction(title: "Отмена", style: .default) { (action) in
            // что происходит при нажатии кнопки "добавить запись" на UIAlert
            print("Добавление новой записи отменено пользователем!")
        }
        
        //добавление тектоового поля к окну alert
        alert.addTextField { (alertTextField) in
            //значение до ввода текста в поле ввода
            alertTextField.placeholder = "Укажи текст для добавления"
            //присвоение переменной текста из поля ввода новой записи
            textField = alertTextField
        }
        
        //доабавляем в к окну alert действия action "добавить запись"
        alert.addAction(action)
        //доабавляем в к окну alert действия actionCancel "отмена"
        alert.addAction(actionCancel)
        
        //отображаем alert пользователю с анимацией
        present(alert, animated: true, completion: nil)
        
    }
    
    
}

