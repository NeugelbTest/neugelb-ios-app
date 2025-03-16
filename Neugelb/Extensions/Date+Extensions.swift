import Foundation

extension Date {
    func formattedString(format: String = "yyyy-MM-dd", locale: Locale = .current) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = locale
        return formatter.string(from: self)
    }
}
