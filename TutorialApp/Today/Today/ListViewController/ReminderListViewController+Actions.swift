//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by 김영빈 on 2023/08/22.
//

import UIKit

extension ReminderListViewController {
    /// @objc 는 이 메서드를 Objective-C 코드에서 사용할 수 있게 해줍니다.
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withID: id)
    }
}
