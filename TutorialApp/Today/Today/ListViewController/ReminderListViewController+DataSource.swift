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
    
    // MARK: - UI에 반영되도록 스냅샷을 업데이트해주는 메서드
    func updateSnapshot(reloading ids: [Reminder.ID] = []) { // 빈 배열을 매개변수의 기본값으로 지정하면 식별자를 제공하지 않고도 viewDidLoad()에서 메서드를 호출할 수 있습니다.
        var snapshot = Snapshot()
        snapshot.appendSections([0]) // section 1개 스냅샷에 추가
        snapshot.appendItems(reminders.map { $0.id }) // reminder 배열을 사용해서 스냅샷을 구성해줍니다. 식별자 배열을 만들기 위해 제목 대신 id 프로퍼티에 맵핑해줍니다.
        // 배열이 비어 있지 않다면, 스냅샷에 식별자에 대한 리마인더를 다시 로드하도록 해줍니다.
        if !ids.isEmpty {
            snapshot.reloadItems(ids)
        }
        dataSource.apply(snapshot) // 스냅샷을 데이터소스에 적용
    }
    
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
    
    // MARK: - 버튼을 누르면 리마인더를 완료 상태로 바꿔주는 메서드
    func completeReminder(withID id: Reminder.ID) {
        var reminder = reminder(withId: id) // 리마인더를 불러오기
        reminder.isComplete.toggle() // 완료 상태로 변경
        updateReminder(reminder) // 리마인더에 반영
        updateSnapshot(reloading: [id]) // UI에 반영하기 위해 스냅샷 업데이트
    }
    
    // MARK: - 완료 여부 버튼 구성 메서드
    private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1) // symbol은 이미지이지만 텍스트처럼 글꼴 스타일과 같은 다양한 특성을 지원해줍니다.
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = ReminderDoneButton()
        // 버튼의 .touchUpInside 이벤트를 addTarget(_:action:for:)을 호출하여 didPressDoneButton(_:) 작업 메서드에 연결해줍니다.
        button.addTarget(self, action: #selector(didPressDoneButton(_:)), for: .touchUpInside)
        button.id = reminder.id
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(
            customView: button, placement: .leading(displayed: .always)) // 버튼을 셀의 어느 위치에 보여줄 지 설정해줍니다.
    }
}
