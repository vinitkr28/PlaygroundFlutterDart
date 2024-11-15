# Flutter & Dart - The Complete Guide [2024 Edition]

https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/

https://github.com/academind/flutter-complete-guide-course-resources

https://docs.flutter.dev/release/archive


### Section 3: Flutter & Dart Basics II - Fundamentals Deep Dive [QUIZ APP]
#### 52. Module Introduction

* Render Conditional & List Content
* Build More Complex User Interfaces

#### 53. A Challenge For You!

- https://docs.flutter.dev/ui/widgets/material

#### 54. Challenge Solution 1/2 - Creating a Widget

#### 55. Challenge Solution 2/2 - Working with More Widgets

#### 56. Adding Icons to Buttons

#### 57. Adding Transparency to Widgets

#### 58. Repetition & Exercise: Adding a Stateful Widget

#### 59. Rendering Content Conditionally

* Render Content Conditionally
* Lifting State Up

#### 60. Accepting & Passing Functions as Values

#### 61. The "initState" Method

#### 62. Deep Dive: Flutter's (Stateful) Widget Lifecycle

```
Every Flutter Widget has a built-in lifecycle: A collection of methods that are automatically executed by Flutter (at certain points of time).

There are three extremely important (stateful) widget lifecycle methods you should be aware of:

initState(): Executed by Flutter when the StatefulWidget's State object is initialized

build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called

dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)

You will encounter them all multiple times throughout the course - therefore you don't have to memorize them now and you will see them in action. It's still worth learning about them right now already.
```

#### 63. Using Ternary Expressions & Comparison Operators

#### 64. Understanding "if" Statements

#### 65. Using "if" Statements In Lists

**Using "if" Statements In Lists**
```
The if statement is a crucial feature of the Dart language - actually, it's a core feature of pretty much all programming languages.

In addition to what you learned in the previous lecture, in Dart, you may also use if inside of lists to conditionally add items to lists:

final myList = [
  1,
  2,
  if (condition)
    3
];
In this example, the number 3 will only be added to myList if condition was met (condition can be true or false or a check that yields true or false - e.g., day == 'Sunday').

Please note that there are NO curly braces around the if statement body. The if statement body also only comprises the next line of code (i.e., you can't have multiple lines of code inside the if statement).

You can also specify an else case - an alternative value that may be inserted into the list if condition is not met:

final myList = [
  1,
  2,
  if (condition)
    3
  else
    4
];
Using this feature is optional. Alternatively, you could, for example, also work with a ternary expression:

final myList = [
  1,
  2,
  condition ? 3 : 4
];
Especially when inserting more complex values (e.g., a widget with multiple parameters being set) into a more complex list (e.g., a list of widgets passed to a Column() or Row()), this feature can lead to more readable code.

You will also see it being used later in the course. It will be explained again then.

You can also learn more about this feature here: https://github.com/dart-lang/language/blob/master/accepted/2.3/control-flow-collections/feature-specification.md
```

#### 66. if Statements & Comparison Operators

**if Statements & Comparison Operators**
```
if Statements & Comparison Operators
When using if statements - no matter if inside or outside of functions - as well as when using ternary expressions, you ultimately must provide a boolean value (true / false):

if (true) {
  // do something ...
}
// or
true ? 'this' : 'that'
Of course, hardcoding true or false into the code makes no sense though - you wouldn't need an if statement or ternary expression if a value would always be true or always be false.

Instead, true or false is typically derived by comparing values - e.g, comparing a number to an expected value:

if (randomNumber == 5) {
  // do something
}
The == operator checks for value equality (i.e., the values on the left and right side of the operator must be equal). It must not be mistaken with the assignment operator (which uses a single equal sign: =).

The assignment operator is used to assign values to variables:

var userName = 'Max'; // assignment operator used
if (userName == 'Max') { ... } // comparison operator used
Besides the equality operator (==) Dart also supports many other key comparison operators:

!= to check for inequality (randomNumber != 5 expects randomNumber to NOT be 5, i.e., to be any other value)

> to check for the value on the left to be greater than the value on the right (randomNumber > 5 yields true if randomNumber is greater than 5)

>= to check for the value on the left to be greater than or equal to the value on the right (randomNumber >= 5 yields true if randomNumber is greater than 5 or equals 5)

< to check for the value on the left to be smaller than the value on the right (randomNumber < 5 yields true if randomNumber is smaller than 5)

<= to check for the value on the left to be smaller than or equal to the value on the right (randomNumber <= 5 yields true if randomNumber is smaller than 5 or equals 5)
```

#### 67. Adding a Data Model & Dummy Data

#### 68. Configuring a Column

#### 69. Creating a Reusable, Custom Styled Button

#### 70. Accessing List Elements & Object Properties

#### 71. Mapping Lists & Using the Spread Operator

#### 72. Alignment, Margin & Padding

#### 73. Mutating Values in Memory

* Map does not change the orignal list but shuffle can change the original list.

#### 74. Managing The Questions Index As State

#### 75. More on Button Styling

#### 76. Using Third-Party Packages & Adding Google Fonts
* https://docs.flutter.dev/cookbook/design/fonts
* https://pub.dev/packages/google_fonts
* flutter pub add google_fonts


#### 77. Passing Data via Functions Across Widgets

#### 78. More Conditions

#### 79. Getting Started with the Results Screen

#### 80. Passing Data to the Results Screen

#### 81. Introducing Maps & "for" Loops

#### 82. Using "for" Loops In Lists

#### 83. Note: A Typo In The Next Lecture

#### 84. Accessing Map Values & Using "Type Casting"

#### 85. Combining Columns & Rows

#### 86. Expanded To The Rescue!

#### 87. Filtering & Analyzing Lists

#### 88. Making Content Scrollable with SingleChildScrollView
    
    Assignment 1: Time to Practice: Flutter Basics

#### 89. Beyond the Basics: Optional, Important Dart Features

#### 90. Module Summary

