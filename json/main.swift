//
//  main.swift
//  json
//
//  Created by Керемет  on 2/1/23.
//

import Foundation

let json = """
[
{
    "name": "Keremet",
    "age": 18,
    "profession": "IOS - developer",
    
    "company": {
        "companyName": "GeekTech",
        "studentsCount": 44000.454
      },

     "Best_Student": "GeekTech Student #1"
  }
]
"""

struct Company: Decodable {
    let companyName: String
    let studentsCount: Double
}

struct Developer: Decodable {
    let name: String
    let age: Int
    let profession: String
    let company: Company
    let bestStudent: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case profession
        case company
        case bestStudent = "Best_Student"
    }
}
 
class SomeController {
    private var persons: [Developer] = [] {
        didSet {
            print(persons)
        }
    }
    
    func parseJSON() {
        let personData = Data(json.utf8)
        let decoder = JSONDecoder()
        
        do {
            let convertedData = try decoder.decode([Developer].self, from: personData)
            persons = convertedData
        } catch {
            print("Error is: \(error.localizedDescription)")
        }
    }
}

let controller = SomeController()
controller.parseJSON()
