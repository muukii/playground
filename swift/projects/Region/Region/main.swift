//
//  main.swift
//  Region
//
//  Created by muukii on 2019/09/05.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation

enum Country: String {
  
  case unknown = ""
  case zero = "000"
  case tw = "466"
  case china = "460"
  case korea = "450"
  case thai = "520"
  case jp = "440"
  
}



let url = URL(fileURLWithPath: "/Users/muukii/Downloads/null__logs__2019-08-22T04-57.json")

let data = try Data(contentsOf: url)

let object = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as! [NSDictionary]

var code: [Country : Int] = [:]


for line in object {
  var value = (line["jsonPayload"] as! NSDictionary)["http_request"]! as! String
  var result = (line["jsonPayload"] as! NSDictionary)["value"]! as! String
  
  let hoge = result.range(of: #"Result:.[a-zA-Z]"#, options: .regularExpression, range: nil, locale: nil)!
  
  let r = result[hoge]
  
  value = value.replacingOccurrences(of: "@ -> GET ", with: "")
  
  let url = URL(string: "https://" + value)!
  
  guard let c = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
    print(value)
    break
  }
  
  guard let items = c.queryItems else {
    print(c)
    break
    
  }
  
  for item in items where item.name == "mobile_country_code" {
    
    let value = Country.init(rawValue: item.value!)!
    
    print(value, r)
    
    if let count = code[value] {
      code[value] = count + 1
    } else {
      code[value] = 1
    }
    
  }
  
}

for o in code {
  print(o)
}




