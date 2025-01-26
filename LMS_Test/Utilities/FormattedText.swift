//
//  FormattedText.swift
//  LMS_Test
//
//  Created by russel on 27/1/25.
//

import UIKit

class FormattedTextLabel: UILabel {
    /// Configures the label with formatted text
    func setFormattedText(regularText: String, boldText: String) {
        let fullText = "\(regularText) \(boldText)"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Set the regular text attributes
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16, weight: .regular), range: NSRange(location: 0, length: regularText.count))
        
        // Set the bold text attributes
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: NSRange(location: regularText.count + 1, length: boldText.count))
        
        self.attributedText = attributedString
    }
    
    func setColoredText(firstText: String, firstTextColor: UIColor, secondText: String, secondTextColor: UIColor) {
        let fullText = "\(firstText) \(secondText)"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Set the color for the first text
        attributedString.addAttribute(.foregroundColor, value: firstTextColor, range: NSRange(location: 0, length: firstText.count))
        
        // Set the color for the second text
        attributedString.addAttribute(.foregroundColor, value: secondTextColor, range: NSRange(location: firstText.count + 1, length: secondText.count))
        
        self.attributedText = attributedString
    }
}
