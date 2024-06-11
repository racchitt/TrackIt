//
//  Settings.swift
//  TrackIt-ExpenseTracker
//
//  Created by Shivam Sultaniya on 10/06/24.
//

import SwiftUI

struct Settings: View {
    @AppStorage("username") private var username:string=* *
     @AppStorage("isAppLockEnabled") private var isAppLockEnabled: bool=false
     @AppStorage("lockwhenappgoesbackground")
    var body: some View {
        Text("Settings")
    }
}

#Preview {
    Settings()
}
