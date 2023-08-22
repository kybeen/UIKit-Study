//
//  Reminder.swift
//  Today
//
//  Created by 김영빈 on 2023/08/16.
//

import Foundation

struct Reminder: Identifiable {
    /// Identifiable 프로토콜을 준수할 경우 반드시 id 프로퍼티를 포함하고 있어야 합니다.
    /// Foundation 프레임워크의 UUID 구조체는 보편적으로 unique한 값을 만들어줍니다.
    var id: String = UUID().uuidString
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

// MARK: - Reminder의 배열에 대한 익스텐션
extension [Reminder] {
    func indexOfReminder(withId id: Reminder.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

/**
 \#if DEBUG 플래그는 출시를 위해 앱을 빌드할 때 동봉된 코드가 컴파일되는 것을 방지하는 컴파일 지침입니다.
 디버그 빌드에서 코드를 테스트하거나 샘플 테스트 데이터를 제공하는데 이 플래그를 사용할 수 있습니다.
 */
#if DEBUG
extension Reminder {
    // MARK: - 샘플 데이터
    static var sampleData = [
        Reminder(
            title: "Submit reimbursement report", dueDate: Date().addingTimeInterval(800.0),
            notes: "Don't forget about taxi receipts"),
        Reminder(
            title: "Code review", dueDate: Date().addingTimeInterval(14000.0),
            notes: "Check tech specs in shared folder", isComplete: true),
        Reminder(
            title: "Pick up new contacts", dueDate: Date().addingTimeInterval(24000.0),
            notes: "Optometrist closes at 6:00PM"),
        Reminder(
            title: "Add notes to retrospective", dueDate: Date().addingTimeInterval(3200.0),
            notes: "Collaborate with project manager", isComplete: true),
        Reminder(
            title: "Interview new project manager candidate",
            dueDate: Date().addingTimeInterval(60000.0), notes: "Review portfolio"),
        Reminder(
            title: "Mock up onboarding experience", dueDate: Date().addingTimeInterval(72000.0),
            notes: "Think different"),
        Reminder(
            title: "Review usage analytics", dueDate: Date().addingTimeInterval(83000.0),
            notes: "Discuss trends with management"),
        Reminder(
            title: "Confirm group reservation", dueDate: Date().addingTimeInterval(92500.0),
            notes: "Ask about space heaters"),
        Reminder(
            title: "Add beta testers to TestFlight", dueDate: Date().addingTimeInterval(101000.0),
            notes: "v0.9 out on Friday")
    ]
}
#endif
