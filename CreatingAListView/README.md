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
