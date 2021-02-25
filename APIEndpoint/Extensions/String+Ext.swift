

import Foundation

extension String {
    var `URL` : URL {
        guard !self.isEmpty else {
            fatalError("The target string cannot be empty.")
        }
        guard let url = Foundation.URL(string: self) else {
            fatalError("Invalid URL string.")
        }
        return url
    }
 
    func contains(regular:String) -> Bool {
        return self.range(of: regular, options: .regularExpression, range: nil, locale: nil) != nil
    }
    func match(_ regular: String) -> Bool {
        return self.contains(regular: regular)
    }
    
    var length: Int {
        return self.count //.characters.count
    }
    
    subscript (r: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound, limitedBy: self.endIndex) ?? self.endIndex
        let end = self.index(self.startIndex, offsetBy: r.upperBound, limitedBy: self.endIndex) ?? self.endIndex
        return String(self[start..<end])
    }
    subscript (n:Int) -> String {
        return self[n..<n+1]
    }
    subscript (str:String) -> Range<Index>? {
        return self.range(of: str)
    }
}
