//
//  Localiztion.swift
//  MindWellness
//
//  Created by RLogixxTraining on 22/07/24.
//

import Foundation

//extension String {
//
//    func localizableString(forLocalization loc: String) -> String {
//            guard let path = Bundle.main.path(forResource: loc, ofType: "lproj"),
//                  let bundle = Bundle(path: path) else {
//                return NSLocalizedString(self, comment: "")
//            }
//            return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
//        }
//
//
//
//    func saveLanguage(_ lang: String) {
//        UserDefaults.standard.set(lang, forKey: "Locale")
//        UserDefaults.standard.synchronize()
//    }
//
//    var currentLanguage: String {
//        return UserDefaults.standard.string(forKey: "Locale") ?? ""
//    }
//}
//
extension String {
    func localizableString(forLocalization loc: String) -> String {
        guard let path = Bundle.main.path(forResource: loc, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return NSLocalizedString(self, comment: "")
        }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
    
    func saveLanguage(_ lang: String) {
            UserDefaults.standard.set(lang, forKey: "Locale")
            UserDefaults.standard.synchronize()
        }

        var currentLanguage: String {
            return UserDefaults.standard.string(forKey: "Locale") ?? ""
        }
    
    
    
}
