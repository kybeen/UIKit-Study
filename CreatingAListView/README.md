# Creating a List View
https://developer.apple.com/tutorials/app-dev-training/creating-a-list-view

이 튜토리얼에서는 사용자의 데일리 리마인더를 표시하는 리스트 레이아웃이 있는 컬렉션 뷰의 루트 뷰를 만들어봅니다.

리스트를 표시하는 컬렉션 뷰를 구성한 후, 콘텐츠 구성 개체를 사용하여 셀의 모양을 정의할 수 있습니다. 그런 다음, 데이터가 변경될 때 사용자 인터페이스가 업데이트되도록 셀을 diffable 데이터 소스에 연결합니다.

## Starting Project

Use this project to code along with [Creating a List View](https://developer.apple.com/tutorials/app-dev-training/creating-a-list-view).

Learners create a new project in the first tutorial. The icon file for the tutorial is in the TutorialResources folder.

## **Section 1. Create a project**
- 이 섹션에서는 Xcode 템플릿을 사용하여 iOS 앱을 위한 새로운 Xcode 프로젝트를 만들어봅니다.

## **Section 2. Add a collection view controller**
- 인터페이스 빌더를 사용하여 뷰 컨트롤러를 추가해봅니다.

## **Section 3. Create a reminder model**
- 리스트에서 리마인더들을 나타낼 데이터 모델을 만들어봅니다.

## **Section 4. Configure the collection as a list**
- compositional layout을 사용하여 컬렌션 뷰 모양을 구성해봅니다.
  - compositional layout을 사용하면 sections, groups 및 items와 같은 다양한 컴포넌트를 결합하여 뷰를 구성할 수 있습니다.
  - section은 item들의 group을 둘러싸고 있는 외부 컨테이너 뷰를 나타냅니다.

## **Section 5. Configure the data source**
- 이 섹션에서는 컬렉션 뷰에 셀을 등록하고, content configuration을 사용하여 셀의 모양을 정의하고, 셀을 데이터 소스에 연결합니다.
- 데이터가 변경될 때 사용자 인터페이스를 업데이트하고 애니메이션화하는 diffable 데이터 소스를 사용할 것입니다.

## **Section 6. Apply a snapshot**
- 이 섹션에서는 리스트 뷰에 샘플 리마인더 목록을 표시하는 스냅샷을 만들고 적용해봅니다.
  - Diffable 데이터 소스는 스냅샷으로 데이터 상태를 관리합니다.
  - 스냅샷은 특정 시점의 데이터 상태를 나타내며, 스냅샷을 사용하여 데이터를 표시하려면 스냅샷을 만들고, 표시하려는 데이터 상태로 스냅샷을 채운 다음, 사용자 인터페이스에 적용해줍니다.