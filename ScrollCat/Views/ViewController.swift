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
        view.addSubview(mainImageView)

        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImageView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 10),
            mainImageView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -10),

            mainImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 600),
            mainImageView.widthAnchor.constraint(equalTo: mainImageView.heightAnchor),

        ])
    }

    func setupSelectYourPawSection() {
        selectYourPawSection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectYourPawSection)

        NSLayoutConstraint.activate([
            selectYourPawSection.topAnchor.constraint(equalTo: mainImageView.bottomAnchor,constant: 8),
            selectYourPawSection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            selectYourPawSection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -1),
            selectYourPawSection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1),

        ])
    }
}
