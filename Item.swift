//
//  Item.swift
//  FirstRealm
//
//  Created by 渡邉舜也 on 30/07/2019.
//  Copyright © 2019 渡邉舜也. All rights reserved.
//

import RealmSwift

// エクセルで「Item」というシートを作成するイメージ
class Item: Object {
    
    // タイトルを保存する列のイメージ
    @objc dynamic var title: String?
    
    // 登録日時を保存する列のイメージ
    @objc dynamic var created = Date()
    
}
