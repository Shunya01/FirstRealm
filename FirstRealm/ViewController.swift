//
//  ViewController.swift
//  FirstRealm
//
//  Created by 渡邉舜也 on 30/07/2019.
//  Copyright © 2019 渡邉舜也. All rights reserved.
//

import UIKit
import RealmSwift  //追加する必要あり

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        //RealmからItemを全件取得する
        let realm = try! Realm()
        items = realm.objects(Item.self).reversed()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func addItem(_ sender: UIButton) {
        
        //新しいItemインスタンスを作成
        let item = Item()
        //Itemクラスに入力されたタイトルを設定
        item.title = textField.text
        //Realmに保存する
        let realm = try! Realm()
        try! realm.write {
            realm.add(item)
        }
        
        //最新のItemの一覧を取得
        items = realm.objects(Item.self).reversed()
        
        //テーブルを更新
        tableView.reloadData()
        
        //テキストフィールドを空にする
        textField.text = ""
        
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" ,for: indexPath)
        
        //表示するItemクラスを取得
        let item = items[indexPath.row]
        
        //セルのラベルにItemクラスのタイトルを設定
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    
}

