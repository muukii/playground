
do {
  
  let groups = ["JP", "TW", "KR"]
  let contexts = ["LoggedIn", "LoggedOut"]
  let stacks = ["LoggedIn", "LoggedOut"]
  let services = ["LoggedInMain", "LoggedOutMain"]
  
  groups.forEach { g in
    
    contexts.forEach { context in
      print([g, context, "Context"].joined())
    }
    
    stacks.forEach { stack in
      print([g, stack, "Stack"].joined())
    }
    
    services.forEach { service in
      print([g, service, "Service"].joined())
    }
  }

}


do {
  
  let groups = ["JP", "TW", "KR"]
  let contexts = ["LoggedIn", "LoggedOut"]
  let stacks = ["LoggedIn", "LoggedOut"]
  let services = ["LoggedIn.Main", "LoggedOut.Main"]
  
  contexts.forEach { context in
    groups.forEach { g in
      print(["Groups", g,"Contexts",  context].joined(separator: "."))
    }
  }
  
  stacks.forEach { context in
    groups.forEach { g in
      print(["Groups", g, "Stacks", context].joined(separator: "."))
    }
  }

  services.forEach { context in
     groups.forEach { g in
       print(["Groups", g,"Services", context].joined(separator: "."))
     }
   }
}

