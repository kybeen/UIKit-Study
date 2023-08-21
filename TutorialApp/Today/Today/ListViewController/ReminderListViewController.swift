//
//  ViewController.swift
//  Today
//
//  Created by 김영빈 on 2023/08/16.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    
    var dataSource: DataSource!

    /// 뷰 컨트롤러가 뷰 계층 구조를 메모리에 로드한 후, 시스템은 viewDidLoad()를 호출합니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 뷰가 로딩되고 나면 리스트를 불러옵니다.
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        // 셀의 내용과 모양을 어떻게 구성할지 지정해줍니다.
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([0]) // section 1개 스냅샷에 추가
        snapshot.appendItems(Reminder.sampleData.map { $0.title }) // 리마인더 샘플 데이터의 제목들을 스냅샷에 넣어준다.
        dataSource.apply(snapshot) // 스냅샷을 데이터소스에 적용
        
        collectionView.dataSource = dataSource // 데이터소스를 콜렉션 뷰에 적용
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

