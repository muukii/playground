//
//  User.hpp
//  MyC
//
//  Created by muukii on 3/13/18.
//  Copyright © 2018 muukii. All rights reserved.
//

#ifndef User_hpp
#define User_hpp

#include <stdio.h>
#include <string>

struct User {

  std::string name;
  int age;
  void greet();
};

#endif /* User_hpp */
