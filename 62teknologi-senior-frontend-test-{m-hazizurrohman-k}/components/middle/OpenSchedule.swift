//
//  OpenSchedule.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 24/04/23.
//

import Foundation
import SwiftUI

/**
 Component to show whether the business is open or closed
 */
func OpenSchedule(schedule:[DailyScheduleType],isOpenNow:Bool) -> some View {
    let today = getTodaysDayOfTheWeekInt()
    let todaySchedule = schedule.first(where: {$0.day == today})
    let tomorrowSchedule = schedule.first(where: {$0.day == today + 1})
    var render: AnyView = AnyView(EmptyView())
    
    switch isOpenNow {
    case true:
        render = AnyView(HStack(spacing: 8) {
            PillTag(name: "Open", color: .green, font: .subheadline.bold())
            if todaySchedule != nil {
                Text("\(timeFormatter(time:todaySchedule!.start)) - \(timeFormatter(time: todaySchedule!.end))")
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            Spacer()
        }
        )
        break;
    case false:
        render = AnyView( HStack {
            PillTag(name: "Closed", color: .red, font: .subheadline.bold())
            if tomorrowSchedule != nil {
                Text("Opens at \(timeFormatter(time:tomorrowSchedule!.start))")
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            Spacer()
        }
        )
        break
    }
    
    return render.padding(.horizontal,16)
    
}
