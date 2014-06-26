
import UIKit

class YYPlaceholderTextView: UITextView {

    var _placeholder:NSString?
    var placeholder:NSString?{
    set{
        self._placeholder = newValue
        self.updateShouldDrawPlaceholder()
    }
    get{
        return self._placeholder
    }
    }
    
    var placeholderTextColor:UIColor?
    
    var shouldDrawPlaceholder:Bool?
    
    //var _text:String!
//    override var text:String!{
//    get{
//        return self._text
//    }
//    set{
//        self._text = newValue
//        self.updateShouldDrawPlaceholder()
//    }
    //}
    
    init(frame: CGRect) {
        super.init(frame: frame, textContainer:nil)
        self.initialize()
        // Initialization code
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        if  shouldDrawPlaceholder == true{
            self.placeholderTextColor!.set()
            self.placeholder!.drawInRect(CGRectMake(4.0, 8.0, self.frame.size.width - 8.0, self.frame.size.height-16.0),withFont:self.font)
        }
    }
    
    func initialize() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textChanged:", name: UITextViewTextDidChangeNotification, object: self)
    
        self.placeholderTextColor = UIColor(white:0.702,alpha:1.0)
        self.shouldDrawPlaceholder = false
    }
    
    func updateShouldDrawPlaceholder(){
        var prev = self.shouldDrawPlaceholder;
        self.shouldDrawPlaceholder = false
        if self.placeholder{
            if self.placeholderTextColor{
                if !self.text || self.text.utf16count == 0{
                    self.shouldDrawPlaceholder = true
                }
            }
        }
        
    if (prev != self.shouldDrawPlaceholder) {
        self.setNeedsDisplay()}
      
    }
    
    
    func textChanged(notification:NSNotification) {
        self.updateShouldDrawPlaceholder()
    }
}
