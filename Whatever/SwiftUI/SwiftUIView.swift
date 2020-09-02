//
//  SwiftUIView.swift
//  Whatever
//
//  Created by Chen Yue on 24/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import SwiftUI
import Combine



struct SwiftUIView: View {
	@ObservedObject var viewModel = ArticleListViewModel()
	var body: some View {
		List(viewModel.articles) { article in
			VStack(alignment: .leading) {

			Text(article.title)
				.lineLimit(nil)

			Text(article.description)
				.foregroundColor(.secondary)
				.lineLimit(nil)
			}
		}
	}
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
