//
//  File.swift
//  catto
//
//  Created by Cris Messias on 03/10/24.
//


AsyncImage(url: URL(string: viewModel.getCatImage())) { phase in
                switch phase {
                case .empty:
                    CatProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.auxiliarCardCatBoard, lineWidth: 8)
                        })
                        .padding(.top, 16)
                case .failure(_):
                    CatProgressView()
                @unknown default:
                    EmptyView()
                }
            }