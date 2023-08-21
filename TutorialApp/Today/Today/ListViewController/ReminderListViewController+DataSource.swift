//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by 김영빈 on 2023/08/21.
//

import UIKit

// 이 익스텐션에는 ReminderListViewController가 리마인더 리스트의 데이터 소스 역할을 할 수 있는 모든 동작이 포함됩니다.
extension ReminderListViewController {
    /// typealias는 기존 타입을 표현력이 더 좋은 이름으로 사용하고자 할 때 쓰입니다.
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String) {
        let reminder = Reminder.sampleData[indexPath.item] // item에 해당하는 리마인더를 검색합니다.
        var contentConfiguration = cell.defaultContentConfiguration() // 미리 정의된 시스템 스타일로 콘텐츠 구성을 만듭니다.
        contentConfiguration.text = reminder.title // 리스트는 configuration 텍스트를 셀의 기본 텍스트로 표시합니다.
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguration // 셀에 configuration 구성을 적용해줍니다.
    }
}
