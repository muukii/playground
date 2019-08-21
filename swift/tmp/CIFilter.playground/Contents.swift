import UIKit
import CoreImage

let builtInFilters = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)

for filterName in builtInFilters {
  print("#", filterName)
  print("")
  print("")
  
  let filter = CIFilter.init(name: filterName)!
  
  for (key, value) in filter.attributes {
    print("-", key)
    print("")
    print("```")
    print("", value)
    print("```")
    print("")
  }
  
  print("")
  print("")
  print("")
}
//
//NSMutableString *log = [[NSMutableString alloc] init];
//for (NSString *filterName in builtInFilters){
//  CIFilter *filter = [CIFilter filterWithName:filterName];
//  NSDictionary *filterAttrs = [filter attributes];
//
//  [log appendString:@"--------------------------------------------------\n"];
//  [log appendString:[NSString stringWithFormat:@"[%@] %@  \n",[filterAttrs objectForKey:@"CIAttributeFilterDisplayName"],filterName]];
//  [log appendString:@"--------------------------------------------------\n"];
//
//  for (NSString *key in [filterAttrs allKeys]){
//
//    if ([key isEqualToString:@"CIAttributeFilterCategories"]){
//      continue;
//    }
//    if ([key isEqualToString:@"CIAttributeFilterDisplayName"]){
//      continue;
//    }
//    if ([key isEqualToString:@"CIAttributeFilterName"]){
//      continue;
//    }
//    [log appendString:[NSString stringWithFormat:@"%@ : %@\n",key,[filterAttrs objectForKey:key]]];
//
//    [log appendString:@"\n"];
//
//  }
//  [log appendString:@"\n"];
//}
//
//NSLog(@"%@",log);
