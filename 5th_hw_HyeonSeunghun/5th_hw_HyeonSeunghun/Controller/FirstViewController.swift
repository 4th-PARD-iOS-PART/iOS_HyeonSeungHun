import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   // var tableView: UITableView!
    var headerImageView: UIImageView! // 상단 이미지
    var movies: [String] = [] // 영화 리스트
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupMovies() // 영화 목록 설정
        setupUI()
    }
    
    let tableView : UITableView = {
        var tableView = UITableView()
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .black
        tableView.register(SectionTableViewCell.self, forCellReuseIdentifier: "sectionCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    // 영화 목록 설정 함수
    func setupMovies() {
        // movie1부터 movie36까지 영화 추가
        for i in 1...36 {
            movies.append("movie\(i)")
        }
    }

    func setupUI() {
        
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //헤더뷰 연결
        let headerView = FirstHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        tableView.tableHeaderView = headerView
        
        
        //만약에 navigation bar가 아니라면??
        // 그러면 그냥 고정으로 해놓고 아래로 scroll해도 움직이지는 않을 것 같은데
        // 상단에 헤더 이미지 추가
        // 그리고 상단에 netflix아이콘하고 다른것도 넣어야함(상단=navigation bar? or 그냥 )
//        headerImageView = UIImageView(image: UIImage(named: "movie3"))
//        headerImageView.contentMode = .scaleAspectFill
//        headerImageView.clipsToBounds = true
//        headerImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(headerImageView)
        
        // 헤드와 tableview사이에 버튼넣기
        
        
        // 테이블 뷰 설정+스크롤했을때 title고정이 안되게 해놓아야함
        
        // 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            // 상단 이미지의 제약 조건
//            headerImageView.topAnchor.constraint(equalTo: view.topAnchor),
//            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            headerImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // 테이블 뷰의 제약 조건
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

          
        ])
    }

    // UITableView DataSource 메소드
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5 // 섹션: 인기, 트렌드, Top 10, 나의 목록 등
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // 각 섹션은 1개의 행(콜렉션 뷰)을 가짐
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! SectionTableViewCell
        
        // 섹션별 영화 리스트 할당
        let moviesPerSection = 7 // 섹션당 표시할 영화 수
        let startIndex = indexPath.section * moviesPerSection
        let endIndex = min(startIndex + moviesPerSection, movies.count)
        let moviesForSection = Array(movies[startIndex..<endIndex])
        
        cell.configure(with: moviesForSection) // 섹션에 맞는 콜렉션 뷰 설정
        return cell
    }

    // 섹션 헤더 (선택 사항)
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0: return "Popular on Netflix"
        case 1: return "Trending Now"
        case 2: return "Top 10 in Nigeria Today"
        case 3: return "My List"
        case 4: return "African Movies"
        default: return nil
            
            
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            // Customize the text color and font size
            header.textLabel?.textColor = UIColor.white // Change this to your preferred color
            header.textLabel?.font = UIFont.boldSystemFont(ofSize: 24) // Change font size and style here
            
            // Optionally change background color
            header.contentView.backgroundColor = UIColor.black // Change to your preferred background color
        }
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220 // 각 섹션의 높이 조정
    }
}

class SectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
    var movies: [String] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 180) // 포스터 크기
        layout.minimumLineSpacing = 10

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "movieCell")
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)

        // 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(with movies: [String]) {
        self.movies = movies
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        let movieName = movies[indexPath.item]
        cell.configure(with: movieName) // 영화 이미지 설정
        return cell
    }
}

class MovieCell: UICollectionViewCell {

    var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)

        // 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with movieName: String) {
        imageView.image = UIImage(named: movieName) // 영화 이미지 설정
    }
}
