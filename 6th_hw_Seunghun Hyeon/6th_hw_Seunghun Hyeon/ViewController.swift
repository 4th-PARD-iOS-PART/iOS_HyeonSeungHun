import UIKit

// Member 객체는 이름, 나이, 파트 정보를 담고 있습니다.
// 이 데이터를 테이블 뷰에 표시하고 수정할 수 있습니다.
class ViewController: UIViewController {
    var members: [Member] = []  // 테이블 뷰에 표시할 멤버 정보 리스트
    var selectedIndex: Int?     // 선택된 셀의 인덱스
    
    // 테이블 뷰: 멤버 리스트를 보여주는 UI 요소
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // 기본 셀 사용
        return table
    }()
    
    // 화면 상단에 보여질 타이틀 라벨
    let homeTitle: UILabel = {
        let label = UILabel()
        label.text = "UrlSession"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 멤버 추가 버튼
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // 뷰가 처음 로드될 때 실행되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰에 UI 요소들 추가
        view.addSubview(tableView)
        view.addSubview(addButton)
        view.addSubview(homeTitle)
        
        addConstraints()  // UI 요소들의 위치와 크기 설정
        tableView.dataSource = self  // 테이블 뷰의 데이터 소스 연결
        tableView.delegate = self    // 테이블 뷰의 델리게이트 연결
        addButton.addTarget(self, action: #selector(addMember), for: .touchUpInside)
    }
    
    // UI 요소들의 레이아웃(위치) 설정
    func addConstraints() {
        NSLayoutConstraint.activate([
            // 테이블 뷰의 위치와 크기 설정
            tableView.topAnchor.constraint(equalTo: homeTitle.topAnchor, constant: 100),
            tableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.height),
            
            // 추가 버튼 위치 설정
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            

            // 타이틀 라벨 위치 설정
            homeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            homeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // 멤버 추가 버튼이 눌렸을 때 호출되는 메서드 (모달 방식으로 표시)
    @objc func addMember() {
        let modalVC = ModalViewController()
        modalVC.onSave = { [weak self] name, age, part in
            let member = Member(name: name, age: age, part: part)
            self?.members.append(member)
            self?.tableView.reloadData()
        }
        modalVC.modalPresentationStyle = .formSheet  // 모달 스타일 설정
        present(modalVC, animated: true)
    }
    
    // 멤버 수정 버튼이 눌렸을 때 호출되는 메서드
    @objc func editMember() {
        guard let index = selectedIndex else {
            print("셀을 하나 선택하세요.")
            return
        }
        presentEditAlert(index: index)
    }
    
    // 기존 멤버 정보를 수정하기 위한 알림창을 표시하는 메서드
    func presentEditAlert(index: Int) {
        let alert = UIAlertController(
            title: "데이터를 편집하시겠습니까?",
            message: nil,
            preferredStyle: .alert
        )
        
        // 이름 입력을 위한 텍스트 필드 추가
        alert.addTextField { textField in
            textField.text = self.members[index].name
        }
        
        // 나이 입력을 위한 텍스트 필드 추가
        alert.addTextField { textField in
            textField.text = String(self.members[index].age)
            textField.keyboardType = .numberPad  // 숫자 키패드 설정
        }
        
        // 파트 입력을 위한 텍스트 필드 추가
        alert.addTextField { textField in
            textField.text = self.members[index].part
        }
        
        // "저장" 버튼 액션 정의
        let saveAction = UIAlertAction(title: "저장", style: .default) { [weak self] _ in
            guard let self = self,
                  let name = alert.textFields?[0].text, !name.isEmpty,
                  let ageText = alert.textFields?[1].text, let age = Int(ageText),
                  let part = alert.textFields?[2].text, !part.isEmpty else {
                print("입력 오류 발생")
                return
            }
            
            // 새 Member 객체 생성 및 배열에 추가
            let member = Member(name: name, age: age, part: part)
            self.members[index].name = name
            self.members[index].age = age
            self.members[index].part = part
            self.tableView.reloadData()  // 테이블 뷰 갱신
        }
        
        // 알림창에 "저장" 및 "취소" 버튼 추가
        alert.addAction(saveAction)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        present(alert, animated: true)  // 알림창 표시
    }
}

// 테이블 뷰에 필요한 데이터와 이벤트 처리
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 테이블 뷰의 셀 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    // 각 셀에 표시할 데이터 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let member = members[indexPath.row]
        cell.textLabel?.text = "[ \(member.part) ] \(member.name)"  // 셀에 멤버의 파트와 이름 표시
        return cell
    }
    
    // 셀이 선택되었을 때 호출되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row  // 선택된 셀의 인덱스 저장
    }
}
