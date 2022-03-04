//
//  HomeTask3.1.swift
//  
//
//  Created by Светлана Мухина on 01.03.2022.
//


import Foundation
import UIKit

class SRPViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let nutrientCalculator = NutrientCalculator()
    }
}
enum CaloriesCalculationType {
    case mifflin
    case harrisBenedict
}
protocol CaloriesCalculationProtocol {
    //var targetCalories: Int { get }
    func calculateCalories(caloriesCalculatorType: CaloriesCalculationType)
}
struct CaloriesCalculation: CaloriesCalculationProtocol {
    var targetCalories: Int
    func calculateCalories(caloriesCalculatorType: CaloriesCalculationType) -> Int {
        switch caloriesCalculatorType {
        case .mifflin:
            // some calculation
            targetCalories = 1200
        case .harrisBenedict:
            // some calculation
            targetCalories = 1400
        }
        return targetCalories
    }
}

protocol ProportionProtocol {
    //var nutrients: Nutrients { get set }
    func calculateDailtyNutrients(calories: Int, proportionType: ProportionType) -> Nutrients
}
enum ProportionType{
    case paleo
    case keto
}

class ProportionType: ProportionProtocol, CaloriesCalculation {
    var calories = CaloriesCalculation().calculateCalories(caloriesCalculatorType: CaloriesCalculationType)
    var nutrients: Nutrients
    func calculateDailtyNutrients(calories: Int, proportionType: ProportionType) -> Nutrients {

        switch proportionType {
        case .paleo:
            // use calories to calculate
            // nutrients
            nutrients = Nutrients(carbs: 4, fats: 10, proteins: 8)
        case .keto:
            // use calories to calculate
            // nutrients
            nutrients = Nutrients(carbs: 6, fats: 1, proteins: 20)
        }
        return nutrients
    }
}

class NutrientCalculator: ProportionType {
}
