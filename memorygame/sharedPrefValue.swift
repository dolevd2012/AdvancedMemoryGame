//
//  sharedPrefValue.swift
//  memorygame
//
//  Created by user196688 on 6/1/21.
//

import Foundation


//MARK: small data class
class sharedPrefValue : Codable{
    var difficulty : String
    var roundsTaken : Int
    var timeTaken : Int
    var playerName : String
    
    init(difficulty: String, rounds: Int , timeTaken: Int,playerName : String){
        self.difficulty = difficulty
        self.roundsTaken = rounds
        self.timeTaken = timeTaken
        self.playerName = playerName
    }
    init() {
        self.difficulty = "?"
        self.roundsTaken = -1
        self.timeTaken = -1
        self.playerName = "Created this only to show the first cell in top ten screen"
    }
    
    func toString(){
        print("difficulty is : \(difficulty)")
        print("rounds taken are : \(roundsTaken)")
        print("Time taken is : \(timeTaken)")
        print("player name is : \(playerName)")
    }
    
    
}
//MARK: Save data after game in UserDefaults
func saveDataLocally(sharedPref: sharedPrefValue) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(sharedPref)
        let sharedPrefJson: String = String(data: data, encoding: .utf8)!
        UserDefaults.standard.setValue(sharedPrefJson, forKey: "scoreBoardValue")
}
//MARK: Get data from UserDefaults
func getLocalSavedData() -> sharedPrefValue? {
        var userData: sharedPrefValue?
        let localNewsJson: String? = UserDefaults.standard.string(forKey: "scoreBoardValue")
        if let safeLocalNewsJson = localNewsJson {
            let decoder = JSONDecoder()
            let data = Data(safeLocalNewsJson.utf8)
            do {
                userData = try decoder.decode(sharedPrefValue.self, from: data)
            } catch {}
        }
        
        return userData
    }
