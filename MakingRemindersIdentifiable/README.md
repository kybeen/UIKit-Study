# Making Reminders Identifiable
https://developer.apple.com/tutorials/app-dev-training/making-reminders-identifiable

Diffable 데이터 소스는 컬렉션 뷰에서 각 항목들의 신원을 나타내는 식별자 리스트를 저장합니다. 이 튜토리얼에서는 각 리마인더를 고유하게 식별할 수 있도록 라미인더 모델을 identifiable하게 만들어줄 것입니다.


## Starting Project

Use this project to code along with [Making Reminders Identifiable](https://developer.apple.com/tutorials/app-dev-training/making-reminders-identifiable).


## **Section 1. Make the model indentifiable**
- 식별자를 사용해서 컬렉션 보기에 포함할 항목과 데이터가 변경될 때 다시 로드할 항목을 데이터 소스에 알려줍니다.
  - 앞서 리스트 뷰를 만들 때 리마인더의 제목(title)을 식별자로 사용했는데, 이런 경우에는 사용자가 제목을 변경하거나 같은 제목으로 2개의 리마인더를 만들 때 문제가 될 수 있습니다.
- 이 섹션에서는 Reminder 구조체가 **Indentifiable** 프로토콜을 준수하도록 할 것입니다. 그런 다음, 데이터 스냅샷에 아이템을 추가하고 컬렉션 뷰 셀을 구성할 때 리마인더의 id 프로퍼티를 사용하도록 코드를 업데이트 할 것입니다.

<div style="text-align: center;">
    <img src="https://github.com/kybeen/UIKit-Study/assets/89764127/e56424fc-dd4e-4662-bfb8-3febc4084da5" alt="" width="300">
</div>

## **Section 2. Create functions for accessing the model**
- 이 섹션에서는 리마인더의 식별자를 사용하여 리마인더 배열의 개별 항목을 검색하고 업데이트하는 함수를 작성합니다.

<div style="text-align: center;">
    <img src="https://github.com/kybeen/UIKit-Study/assets/89764127/e9b443ab-6b4b-414a-b6ab-455e080ddb99" alt="" width="300">
</div>


## **Section 3. Craete a custom button action**
- 이 섹션에서는 사용자가 완료 버튼을 탭할 때 리마인더의 상태를 업데이트하는 코드를 작성하여 Today 앱을 더 인터랙티브하게 만들기 시작할 것입니다.

<div style="text-align: center;">
    <img src="https://github.com/kybeen/UIKit-Study/assets/89764127/fa7b1902-c1da-48a3-8244-987e77b2e489" alt="" width="300">
</div>


## **Section 4. Wire a target-action pair**
- Target-action은 이벤트가 발생할 떄 객체가 다른 객체에 메세지를 보내는 데 필요한 정보를 보유하는 디자인 패턴입니다.
  - Today 앱에서 touchUpInside 이벤트는 사용자가 완료 버튼을 탭할 때 발생하며, 이는 didPressDoneButton:sender 메시지를 뷰 컨트롤러로 보냅니다.

<div style="text-align: center;">
    <img src="https://github.com/kybeen/UIKit-Study/assets/89764127/50c93edc-738e-446b-942a-76273c1b0850" alt="" width="300">
</div>


## **Section 5. **
- 

<div style="text-align: center;">
    <img src="" alt="" width="300">
</div>


## **Section 6. **
- 

<div style="text-align: center;">
    <img src="" alt="" width="300">
</div>


## **Section 7. **
- 

<div style="text-align: center;">
    <img src="" alt="" width="300">
</div>





<!-- <div style="text-align: center;">
    <img src="" alt="" width="150">
</div> -->