//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Нуридин Сафаралиев on 3/25/26.
//

import UIKit

extension Date {
    
    func formateToMonthYearFormate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
