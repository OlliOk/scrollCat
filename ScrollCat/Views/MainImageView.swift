import UIKit

final class MainImageView: UIView {
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private let mainStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupViews() {
        addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        setupMainStackView()
    }

    func setupMainStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.spacing = 16

        contentView.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mainStackView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 8),
            mainStackView.widthAnchor.constraint(lessThanOrEqualToConstant: 500),
            mainStackView.widthAnchor.constraint(equalTo: mainStackView.heightAnchor)
        ])

        setupMainImage()
        setupButtonsStackView()
    }

    private func setupMainImage() {
        let mainImage = UIImageView()
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.layer.borderColor = UIColor.systemPink.cgColor
        mainImage.layer.borderWidth = 3
        mainImage.layer.cornerRadius = 50
        mainImage.layer.masksToBounds = true
        mainImage.image = UIImage(named: "catMain")

        mainStackView.addArrangedSubview(mainImage)

        NSLayoutConstraint.activate([
                    // Question: why not working (equalTo: mainStackView.centerXAnchor)
            mainImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mainImage.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            mainImage.heightAnchor.constraint(equalTo: mainImage.widthAnchor),
            mainImage.leadingAnchor.constraint(greaterThanOrEqualTo: mainStackView.leadingAnchor, constant: 40),
        ])
    }

    private func setupButtonsStackView() {
        let buttonTitles = ["Eat", "Pray", "Love"]
        let buttonsStackView = UIStackView()
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .horizontal
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 5

        mainStackView.addArrangedSubview(buttonsStackView)

        buttonTitles.forEach { buttonsStackView.addArrangedSubview(createCustomButton(with: $0)) }

        NSLayoutConstraint.activate([
            buttonsStackView.heightAnchor.constraint(equalToConstant: 40),
            buttonsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor)
        ])
    }
}

extension MainImageView {
    private func createCustomButton(with title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }
}
