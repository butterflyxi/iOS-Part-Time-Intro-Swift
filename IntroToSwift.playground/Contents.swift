//: # Intro to Swift
//:
//: ## Does student teacher ratios effect learning
//:
//: formula:
//:
//: `effectiveness = numberOfStudents / numberOfTeachers * averageTestScore`
//:
//: *Higher numbers are better!*
import Foundation

//: First we create variables to store the data we need to do this calculation.
let students = 40
//: These variables have inferred types.
//: Those types are not all the same!
let teachers = 2
let averageTestScore:Double = 0.8
//: Now we do the math, and get a result
let effectiveness = Double(students) / Double(teachers) * averageTestScore
//: The point of this is to compare different cohorts, so let's do that all again a few more times?
let students2 = 40
let teachers2 = 3
let averageTestScore2 = 0.85

let effectiveness2 = Double(students2) / Double(teachers2) * averageTestScore
//: Now before we make students3 and teachers3, let's see if there isn't a better way!
//:
//: As programmers we like to do this thing called DRY programming.
//:
//: With that in mind, can we factor the math part of this operation into piece of code we can repeat over and over?
func calculateEffectiveness(students: Int, teachers: Int, averageTestScore: Double) -> Double {
    return Double(students) / Double(teachers) * averageTestScore
}

let students3 = 40
let teachers3 = 3
let averageTestScore3 = 0.85

let effectiveness3 = calculateEffectiveness(students: students3, teachers: teachers3, averageTestScore: averageTestScore3)
//: That simplifies each repitition by a bit. Can we do something to clean up the data variables? YES! Classes.
//:
//: Classes are a thing we use to group data, and code that acts on that data.
//class Cohort {
//    var students = 0
//    var teachers = 0
//    var averageTestScore = 0.0
//}
//: We just created our own Type, along the lines of String or Int. We use it just like we might use those. (create two cohort objects)
//let cohort1: Cohort = Cohort()
//cohort1.students = 10
//cohort1.teachers = 1
//cohort1.averageTestScore = 0.5
//
//let cohort2: Cohort = Cohort()
//cohort2.students = 25
//cohort2.teachers = 2
//cohort2.averageTestScore = 0.8

//: Now we can tidy up our function, to take in a cohort and return an effectiveness number.
//func calculateEffectiveness(cohort: Cohort) -> Double {
//    return calculateEffectiveness(students: cohort.students, teachers: cohort.teachers, averageTestScore: cohort.averageTestScore)
//}
////: That's awesome! and simpler to use:
//calculateEffectiveness(cohort: cohort1)
//calculateEffectiveness(cohort: cohort2)
//: But it turns out there is something we can do to simplify that. We can put that function INSIDE our Cohort class.
class Cohort {
    let students: Int
    let teachers: Int
    let averageTestScore: Double
    
    init(students: Int, teachers: Int, averageTestScore: Double) {
        self.students = students
        self.teachers = teachers
        self.averageTestScore = averageTestScore
    }
    
    func calculateEffectiveness() -> Double {
        return Double(self.students) / Double(self.teachers) * self.averageTestScore
    }
}
//: How do we use it once it's attached?
//let cohort3: Cohort = Cohort()
//let effectivenessAgain = cohort3.calculateEffectiveness()

//: That's repetitive! Do we really need to specify that we want cohort1's effectiveness of cohort1?
//: We'd need a special keyword to reference THIS specific cohort from within the cohort. Maybe "self"?

//: The last thing we should know about is getting rid of those default values, which forces users of our class to set up cohort data correctly.

//: Now we set all the data needed right when we create our cohort objects
let cohort3: Cohort = Cohort(students: 25, teachers: 4, averageTestScore: 0.8)
let effectivenessAgain = cohort3.calculateEffectiveness()
//: Lastly, we can do different things, depending on the results of our calculations. Using `if` and `else` statements.