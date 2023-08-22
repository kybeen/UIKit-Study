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
    /// 데이터 소스의 아이템 식별자와 스냅샷 type alias를 Reminder.ID로 설정해줍니다.
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Reminder.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Reminder.ID>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID) {
        let reminder = reminder(withId: id) // item에 해당하는 리마인더를 검색합니다.
        var contentConfiguration = cell.defaultContentConfiguration() // 미리 정의된 시스템 스타일로 콘텐츠 구성을 만듭니다.
        contentConfiguration.text = reminder.title // 리스트는 configuration 텍스트를 셀의 기본 텍스트로 표시합니다.
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguration // 셀에 configuration 구성을 적용해줍니다.
        
        var doneButtonConfiguration = doneButtonConfiguration(for: reminder)
        doneButtonConfiguration.tintColor = .todayListCellDoneButtonTint
        cell.accessories = [
            .customView(configuration: doneButtonConfiguration), .disclosureIndicator(displayed: .always)
        ]
        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = .todayListCellBackground
//        backgroundConfiguration.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.9, alpha: 1.0) /// test
        cell.backgroundConfiguration = backgroundConfiguration
    }
    
    // MARK: - reminders에 직접 액세스하는 대신 이 메서드를 사용하면 잠재적인 오류를 줄이고 코드를 더 간단하게 유지할 수 있습니다.
    func reminder(withId id: Reminder.ID) -> Reminder {
        let index = reminders.indexOfReminder(withId: id)
        return reminders[index]
    }
    
    // MARK: - Reminder를 받고 해당 배열 요소를 리마인더의 내용으로 업데이트하는 메서드
    func updateReminder(_ reminder: Reminder) {
        let index = reminders.indexOfReminder(withId: reminder.id)
        reminders[index] = reminder
    }
    
    // MARK: - 완료 여부 버튼 구성 메서드
    private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1) // symbol은 이미지이지만 텍스트처럼 글꼴 스타일과 같은 다양한 특성을 지원해줍니다.
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(
            customView: button, placement: .leading(displayed: .always)) // 버튼을 셀의 어느 위치에 보여줄 지 설정해줍니다.
    }
}
