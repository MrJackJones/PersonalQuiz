import UIKit


class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!

    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        let mostPopularAnimal = getMostPopularAnimal(with: answersChosen)
        resultLabel.text = "Вы - \(mostPopularAnimal.rawValue)!"
        resultDefinitionLabel.text = mostPopularAnimal.definition
    }
}

extension ResultViewController {
    private func getMostPopularAnimal(with answers: [Answer] ) -> Animal {
        var animals: [Animal: Int] = [:]

        for answer in answers {
            animals[answer.animal, default: 0] += 1
        }
        
        let mostPopularAnimal = animals.max { a, b in a.value < b.value }
        return mostPopularAnimal?.key ?? Animal.cat
    }
}
