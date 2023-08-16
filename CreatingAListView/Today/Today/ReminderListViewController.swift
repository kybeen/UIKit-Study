//
//  ViewController.swift
//  Today
//
//  Created by 김영빈 on 2023/08/16.
//

import UIKit

class ReminderListViewController: UICollectionViewController {

    /// 뷰 컨트롤러가 뷰 계층 구조를 메모리에 로드한 후, 시스템은 viewDidLoad()를 호출합니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 뷰가 로딩되고 나면 리스트를 불러옵니다.
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
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

