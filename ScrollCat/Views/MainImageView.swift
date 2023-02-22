import UIKit

final class MainImageView: UIView {
    private let mainStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupViews() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillProportionally
        mainStackView.alignment = .center
        mainStackView.spacing = 16

        addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -8),
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
        mainImage.contentMode = .scaleAspectFill
        mainImage.image = UIImage(named: "catMain")

        mainStackView.addArrangedSubview(mainImage)

        NSLayoutConstraint.activate([
            mainImage.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 20),
            mainImage.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -20)
        ])
    }

    private func setupButtonsStackView() {
        let buttonTitles = ["Eat", "Pray", "Love"]
        let buttonsStackView = UIStackView()
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.alignment = .fill
        buttonsStackView.spacing = 8

        mainStackView.addArrangedSubview(buttonsStackView)

        buttonTitles.forEach { buttonsStackView.addArrangedSubview(createCustomButton(with: $0)) }

        NSLayoutConstraint.activate([
            buttonsStackView.heightAnchor.constraint(equalToConstant: 40),
            buttonsStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor)
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
