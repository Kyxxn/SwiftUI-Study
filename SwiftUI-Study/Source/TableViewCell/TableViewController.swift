//
//  MainViewController.swift
//  SwiftUI-Study
//
//  Created by 박효준 on 10/8/24.
//

import UIKit
import SwiftUI

// 테이블뷰 셀 레퍼런스: https://fomaios.tistory.com/entry/WWDC-2022-%EA%B8%B0%EC%A1%B4-UIKit-%EC%95%B1%EC%97%90-SwiftUI-%EC%A0%81%EC%9A%A9%ED%95%98%EA%B8%B0-Use-SwiftUI-with-UIKit
final class TableViewController: UIViewController {
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension TableViewController {
    func setupUI() {
        view.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.contentConfiguration = UIHostingConfiguration {
            HStack {
                VStack(alignment: .leading) {
                    Text("Title")
                    HStack(alignment: .bottom) {
                        Text("subTitle")
                            .onTapGesture {
                                print("subTitle onTapGesture")
                            }
                        Text("content")
                            .padding(.leading, 30)
                    }
                }
            }
            .swipeActions(edge: .trailing) {
                Button(role: .destructive, action: didTapButton) {
                    Label("Delete", systemImage: "trash")
                }
            }
        }
        
        // MARK: configurationUpdateHandler
//        cell.isMultipleTouchEnabled = true
//        cell.configurationUpdateHandler = { cell, state in
//            cell.contentConfiguration = UIHostingConfiguration {
//                if state.isSelected {
//                    VStack {
//                        Image(systemName: "checkmark")
//                            .foregroundColor(.blue)
//                            .font(.title)
//                        Text("Selected")
//                            .font(.subheadline)
//                            .foregroundColor(.blue)
//                            .padding()
//                            .onTapGesture {
//                                print("Selected")
//                            }
//                    }
//                }
//            }
//        }
        return cell
    }
    
    @objc func didTapButton() {
        print("didTapButton")
    }
}
