//
//  String+Ext.swift
//  GHFollowers
//
//  Created by Нуридин Сафаралиев on 3/25/26.
//

import UIKit

extension String {
    
    func formateToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
         
        return dateFormatter.date(from: self)
    }
    
    func formateToDisplayFormate() -> String {
        guard let date = formateToDate() else {
            return "N/A"
        }
        return date.formateToMonthYearFormate()
    }
    
}
