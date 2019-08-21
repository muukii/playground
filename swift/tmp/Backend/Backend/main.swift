//
//  Backends.swift
//  AppService
//
//  Created by muukii on 2019/07/04.
//  Copyright © 2019 eure. All rights reserved.
//

import Foundation

let jp = Contexts.LoggedIn(service: Services.LoggedIn<Groups.JP>())
let _ = Contexts.LoggedIn(service: Services.JPLoggedIn())

let tw = Contexts.LoggedIn(service: Services.LoggedIn<Groups.TW>())
let kr = Contexts.LoggedIn(service: Services.LoggedIn<Groups.TW>())
let th = Contexts.LoggedIn(service: Services.LoggedIn<Groups.TH>())
let other = Contexts.LoggedIn(service: Services.LoggedIn<Groups.Other>())

jp.service.me.fetchMe()
jp.service.approach.sendLike()

tw.service.me
tw.service.approach.sendLike()

