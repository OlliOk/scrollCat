import UIKit

final class ViewController: UIViewController {
    private lazy var mainImageView = MainImageView()
    private lazy var selectYourPawSection = SelectYourPawSection()
    private let background = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupMainImageView()
        setupSelectYourPawSection()
    }

    func setupBackground() {
        background.translatesAutoresizingMaskIntoConstraints = false
        background.image = UIImage(named: "background2")
        view.addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func setupMainImageView() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        background.addSubview(mainImageView)

        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: background.topAnchor, constant: 60),
            mainImageView.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            mainImageView.leadingAnchor.constraint(greaterThanOrEqualTo: background.leadingAnchor, constant: 8),
            mainImageView.widthAnchor.constraint(equalTo: mainImageView.heightAnchor),
            mainImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 500)
        ])
    }

    func setupSelectYourPawSection() {
        selectYourPawSection.translatesAutoresizingMaskIntoConstraints = false
        background.addSubview(selectYourPawSection)

        NSLayoutConstraint.activate([
            selectYourPawSection.topAnchor.constraint(equalTo: mainImageView.bottomAnchor),
            selectYourPawSection.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            selectYourPawSection.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: -1),
            selectYourPawSection.widthAnchor.constraint(equalTo: background.widthAnchor)

        ])
    }
}
