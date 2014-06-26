
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
    
    var _paddingTop:Float!
    var paddingTop:Float!{
    set{
        self._paddingTop = newValue
        self.setNeedsDisplay()
    }
    get{
        return self._paddingTop
    }
    }
    
    var _paddingLeft:Float!
    var paddingLeft:Float!{
    set{
        self._paddingLeft = newValue
        self.setNeedsDisplay()
    }
    get{
        return self._paddingLeft
    }
    }
    
    init(frame: CGRect) {
        super.init(frame: frame, textContainer:nil)
        self.initialize()
        // Initialization code
    }

    func setText(#text:String){
        self.text = text
        self.updateShouldDrawPlaceholder()
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        if  shouldDrawPlaceholder == true{
            self.placeholderTextColor!.set()
            self.placeholder!.drawInRect(CGRectMake(self.paddingLeft, self.paddingTop, self.frame.size.width - 2.0*self.paddingLeft, self.frame.size.height-16.0),withFont:self.font)
        }
    }
    
    func initialize() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textChanged:", name: UITextViewTextDidChangeNotification, object: self)
    
        self.placeholderTextColor = UIColor(white:0.702,alpha:1.0)
        self.shouldDrawPlaceholder = false
        self.paddingLeft = 4.0
        self.paddingTop = 8.0
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
