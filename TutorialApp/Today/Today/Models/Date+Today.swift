//
//  Date+Today.swift
//  Today
//
//  Created by 김영빈 on 2023/08/21.
//

import Foundation

extension Date {
    // 텍스트 형태의 날짜와 시간을 반환하는 계산 프로퍼티
    var dayAndTimeText: String {
        /// formatted(date:time:) 메서드는 날짜와 시간을 텍스트로 반환해줍니다.
        /// 시스템에서 현재 로케일의 날짜와 시간의 문자열 표현으로 포맷팅해줍니다.
        /// date 스타일에 대해 .omitted를 전달하면 time 컴포넌트만 문자열이 생성됩니다.
        let timeText = formatted(date: .omitted, time: .shortened)
        /// 날짜가 오늘에 속하는지 여부에 따라 다르게 문자열을 표시해줍니다.
        if Locale.current.calendar.isDateInToday(self) {
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText) /// 포맷팅된 문자열을 그냥 반환하면 컴파일 오류가 나기 때문에 String으로 변환 후 반환해줍니다.
        } else {
            /// formatted(_:) 메서드는 사용자 지정 날짜 형식 스타일을 사용하여 사용자의 현재 로케일에 적합한 날짜 표현을 만들어줍니다.
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText, timeText)
        }
    }
    
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            return NSLocalizedString("Today", comment: "Today due date description")
        } else {
            return formatted(.dateTime.month().day().weekday(.wide))
        }
    }
}
