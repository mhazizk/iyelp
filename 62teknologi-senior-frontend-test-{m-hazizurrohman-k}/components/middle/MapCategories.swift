//
//  RenderCategoryPills.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation
import SwiftUI

func MapCategories(categories:[CategoryType]) -> some View {
    return HStack(spacing: 4) {
        ForEach(categories, id: \.alias) {
            category in
            Pill(name: category.title)
        }
        
    }
}
