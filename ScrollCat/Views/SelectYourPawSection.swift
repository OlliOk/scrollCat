import UIKit

final class SelectYourPawSection: UIView {
    private let sectionHeader = UILabel()
    private let scrollView = UIScrollView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupViews() {
        setupSectionHeader()
        setupScrollView()
    }


    private func setupSectionHeader() {
        sectionHeader.translatesAutoresizingMaskIntoConstraints = false
        sectionHeader.text = "Select your paw"
        sectionHeader.textColor = .systemPink
        sectionHeader.font = .systemFont(ofSize: 24, weight: .bold)
        sectionHeader.backgroundColor = .white
        sectionHeader.textAlignment = .center
        sectionHeader.layer.borderWidth = 1
        sectionHeader.layer.borderColor = UIColor.systemPink.cgColor

        addSubview(sectionHeader)

        NSLayoutConstraint.activate([
            sectionHeader.topAnchor.constraint(equalTo: topAnchor),
            sectionHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionHeader.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionHeader.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: sectionHeader.bottomAnchor, constant: 5),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        setupPawButtons()
    }


    private func setupPawButtons() {
        let pawsStackView = UIStackView()
        pawsStackView.translatesAutoresizingMaskIntoConstraints = false
        pawsStackView.axis = .vertical
        pawsStackView.alignment = .center
        pawsStackView.spacing = 5

        scrollView.addSubview(pawsStackView)

        Constant.paws.forEach { pawsStackView.addArrangedSubview(createPawButton(with: $0)) }
        NSLayoutConstraint.activate([
            pawsStackView.widthAnchor.constraint(equalTo: widthAnchor),
            pawsStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            pawsStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pawsStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            pawsStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        ])
    }
}

extension SelectYourPawSection {
    private func createPawButton(with title: String) -> UIButton {
        let image = UIImage(named: title)
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }
}


enum Constant {
    static let paws = [
        "catPaw1",
        "catPaw2",
        "catPaw3",
        "catPaw4",
        "catPaw5",
        "catPaw6",
        "catPaw7",
        "catPaw8",
        "catPaw9",
        "catPaw10",
        "catPaw11",
        "catPaw12",
        "catPaw13",
        "catPaw14",
        "catPaw15",
        "catPaw16",
        "catPaw17",
        "catPaw18",
    ]
}
