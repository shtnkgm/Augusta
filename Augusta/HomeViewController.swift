//
//  HomeViewController.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<HomeSection, HomeCell>!
    
    let postsRepository = PostsRepositoryImpl(apiClient: APIClientImpl())
    let commentsRepository = CommentsRepositoryImpl(apiClient: APIClientImpl())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setDataSource()
        applySnapshot()
        
        Task {
            do {
                let posts = try await postsRepository.fetch()
                print(posts)
                let comments = try await commentsRepository.fetch()
                print(comments)
            } catch {
                print(error)
            }
        }
    }
    
    private func setLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            self?.dataSource.snapshot().sectionIdentifiers[sectionIndex].layoutSection()
        }
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func setDataSource() {
        collectionView.registerCell(type: SwiftUICell<LabelView>.self)
        collectionView.registerHeader(type: SwiftUIReusableView<SectionHeaderView>.self)
        
        dataSource = UICollectionViewDiffableDataSource<HomeSection, HomeCell>(collectionView: collectionView) { collectionView, indexPath, item in
            switch self.dataSource.itemIdentifier(for: indexPath)! {
            case .smallBannerItem(let number):
                return collectionView
                    .dequeueCell(type: SwiftUICell<LabelView>.self, for: indexPath)
                    .embed(in: self, withView: LabelView(text: "\(number)"))
            case .gridItem(let number):
                return collectionView
                    .dequeueCell(type: SwiftUICell<LabelView>.self, for: indexPath)
                    .embed(in: self, withView: LabelView(text: "\(number)"))
            case .nestedItem(let number):
                return collectionView
                    .dequeueCell(type: SwiftUICell<LabelView>.self, for: indexPath)
                    .embed(in: self, withView: LabelView(text: "\(number)"))
            case .listItem(let number):
                return collectionView
                    .dequeueCell(type: SwiftUICell<LabelView>.self, for: indexPath)
                    .embed(in: self, withView: LabelView(text: "\(number)"))
            }
        }
        
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self = self,
                  let title = self.dataSource.snapshot().sectionIdentifiers[indexPath.section].title else {
                      return nil
                  }
            
            return collectionView
                .dequeueHeader(type: SwiftUIReusableView<SectionHeaderView>.self, for: indexPath)
                .embed(in: self, withView: SectionHeaderView(title: title))
        }
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeCell>()
        let threeGrid = HomeSection.grid(columunCount: 3)
        let fourGrid = HomeSection.grid(columunCount: 4)
        snapshot.appendSections([.mediumBanner, .list, .nested, threeGrid, fourGrid])
        snapshot.appendItems((0..<5).map { .smallBannerItem($0) }, toSection: .mediumBanner)
        snapshot.appendItems((0..<3).map { .nestedItem($0) }, toSection: .nested)
        snapshot.appendItems((0..<9).map { .gridItem($0) }, toSection: threeGrid)
        snapshot.appendItems((9..<16 + 9).map { .gridItem($0) }, toSection: fourGrid)
        snapshot.appendItems([.listItem("あいうえお"), .listItem("かきくけこさしすせそたちつてとなにぬねの"), .listItem("秋も更ふけて、暁闇ぎょうあんがすぐに黄昏たそがれとなり、暮れてゆく年に憂愁をなげかけるころの、おだやかな、むしろ物さびしいある日、わたしはウェストミンスター寺院を逍遥しょうようして数時間すごしたことがある。")], toSection: .list)
        
        dataSource.apply(snapshot)
    }
}

//import SwiftUI
//
//extension HomeViewController: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> some UIViewController {
//        HomeViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//}
//
//struct HomeViewControllerPreviews: PreviewProvider {
//    static var previews: some View {
//        HomeViewController()
//    }
//}

