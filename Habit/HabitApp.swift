//
//  HabitApp.swift
//  Habit
//
//  Created by Júlio César Amorim on 18/07/23.
//

import SwiftUI

@main
struct HabitApp: App {
  var body: some Scene {
    WindowGroup {
      SplashView(viewModel: SplashViewModel())
    }
  }
}
