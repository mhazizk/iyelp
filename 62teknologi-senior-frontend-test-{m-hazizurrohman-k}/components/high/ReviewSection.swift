//
//  Review.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 23/04/23.
//

import Foundation
import SwiftUI

/**
 review section showing reviews from selected business
 */
func ReviewSection(reviews:[ReviewType]) -> some View {
    return VStack {
        HStack {
            Text("Reviews")
                .bold()
                Spacer()
        }.padding(16)
        ForEach(reviews, id: \.id) {
            review in
            ReviewCard(review: review)
        }
    }
}
