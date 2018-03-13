//
//  main.cpp
//  MyC
//
//  Created by muukii on 3/13/18.
//  Copyright © 2018 muukii. All rights reserved.
//

#include <iostream>

#include "User.hpp"

int main(int argc, const char * argv[]) {

  {
  User user = User();
  user.greet();
  }

  {
  User *user = new User();
  user->greet();
  delete user;
  }

  return 0;
}
