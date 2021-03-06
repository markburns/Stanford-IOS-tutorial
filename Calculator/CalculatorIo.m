#import "CalculatorIo.h"

@interface CalculatorIo()
  @property (weak, nonatomic) IBOutlet UILabel *output;

- (void) append:(NSString *)digit;

- (double)doubleValue;

@end

@implementation CalculatorIo

- (CalculatorIo *) init:(UILabel *)output
{
  self = [super init];
  self.output = output;
  return self;
}
- (double) read{
  self.inputting = NO;
  return self.doubleValue;
}

- (void) set:(double)digit
{
  NSString * value = [NSString stringWithFormat:@"%g", digit];
  self.output.text = value;
}
- (BOOL) hasDecimal:(NSString *)input
{
  NSRange hasDecimal = [input rangeOfString: @"."];
  if(hasDecimal.length == 0){    return NO;}
  else{return YES;}
}

- (void) send:(NSString *)digit
{
  if (self.inputting){
    BOOL outputHasDecimal = [self hasDecimal:self.output.text];
    BOOL inputIsDecimal   = [self hasDecimal:digit];
    
    if(!outputHasDecimal || !inputIsDecimal){
      if(self.output.text)
      [self append:digit];
    }
  }
  else{
    self.output.text = digit;
    self.inputting = YES;
  }
}

- (double)doubleValue {
  return [self.output.text doubleValue];
}

- (void) append:(NSString *)digit
{
  NSString* concatenated = [self.output.text stringByAppendingString:digit];
  self.output.text = concatenated;
}




@end
