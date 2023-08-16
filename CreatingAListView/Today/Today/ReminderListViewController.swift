//
//  ViewController.swift
//  Today
//
//  Created by 김영빈 on 2023/08/16.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    /// typealias는 기존 타입을 표현력이 더 좋은 이름으로 사용하고자 할 때 쓰입니다.
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    
    var dataSource: DataSource!

    /// 뷰 컨트롤러가 뷰 계층 구조를 메모리에 로드한 후, 시스템은 viewDidLoad()를 호출합니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 뷰가 로딩되고 나면 리스트를 불러옵니다.
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        // 셀의 내용과 모양을 어떻게 구성할지 지정해줍니다.
        let cellRegistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item] // item에 해당하는 리마인더를 검색합니다.
            var contentConfiguration = cell.defaultContentConfiguration() // 미리 정의된 시스템 스타일로 콘텐츠 구성을 만듭니다.
            contentConfiguration.text = reminder.title // 리스트는 configuration 텍스트를 셀의 기본 텍스트로 표시합니다.
            cell.contentConfiguration = contentConfiguration // 셀에 configuration 구성을 적용해줍니다.
        }
        
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
    }

    // MARK: - 그룹화된 모양으로 새 리스트 구성 변수를 만드는 메서드
    private func listLayout() -> UICollectionViewCompositionalLayout {
        // 리스트 레이아웃의 섹션을 만들어줍니다.
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

}

