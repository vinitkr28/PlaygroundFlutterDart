# Flutter & Dart - The Complete Guide \[2024 Edition]

https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/

https://github.com/academind/flutter-complete-guide-course-resources

https://docs.flutter.dev/release/archive
https://github.com/dart-lang/language

### Section 3: Flutter & Dart Basics II - Fundamentals Deep Dive \[QUIZ APP]

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

### Section 5: Adding Interactivity, More Widgets & Theming \[EXPENSE TRACKER APP]

https://github.com/academind/flutter-complete-guide-course-resources/tree/main/Code%20Snapshots/05%20Interactivity%20%26%20Theming

#### 97. Module Introduction

#### 98. Starting Setup & Repetition Time!

#### 99. Adding an Expense Data Model with a Unique ID & Exploring Initializer Lists

* flutter pub add uuid

#### 100. Introducing Enums

#### 101. Creating Dummy Data

#### 102. Efficiently Rendering Long Lists with ListView

* ListView.builder(itemBuilder: itemBuilder);

#### 103. Using Lists Inside Of Lists

#### 104. Creating a Custom List Item with the Card & Spacer Widgets

#### 105. Using Icons & Formatting Dates

#### 106. Setting an AppBar with a Title & Actions

#### 107. Adding a Modal Sheet & Understanding Context

#### 108. Handling User (Text) Input with the TextField Widget

#### 109. Getting User Input on Every Keystroke

#### 110. Letting Flutter do the Work with TextEditingController

#### 111. Time to Practice: Adding a New Input

#### 112. Exercise Solution

#### 113. Closing The Modal Manually

#### 114. Showing a Date Picker

#### 115. Working with "Futures" for Handling Data from the Future

#### 116. Adding a Dropdown Button

#### 117. Combining Conditions with AND and OR Operators

#### 118. Validating User Input & Showing an Error Dialog

#### 119. Saving New Expenses

#### 120. Creating a Fullscreen Modal

#### 121. Using the Dismissible Widget for Dismissing List Items

#### 122. Showing & Managing "Snackbars"

#### 123. Flutter & Material 3

#### 124. Getting Started with Theming

#### 125. Setting & Using a Color Scheme

#### 126. Setting Text Themes

#### 127. Using Theme Data in Widgets

#### 128. Important: Adding Dark Mode

#### 129. Adding Dark Mode

#### 130. Using Another Kind of Loop (for-in)

#### 131. Adding Alternative Constructor Functions & Filtering Lists

#### 132. Adding Chart Widgets

#### 133. Module Summary

### Section 6: Building Responsive & Adaptive User Interfaces \[EXPENSE TRACKER APP]

#### 134. Module Introduction

#### 135. What is "Responsiveness"?

#### 136. Locking the Device Orientiation

#### 137. Updating the UI based on the Available Space

#### 138. Understanding Size Constraints

#### 139. Handling to Screen Overlays like the Soft Keyboard

#### 140. Understanding "Safe Areas"

#### 141. Using the LayoutBuilder Widget

#### 142. Building Adaptive Widgets

#### 143. Module Summary

### Section 7: Flutter & Dart Internals

#### 144. Module Introduction

#### 145. Three Trees: Widget Tree, Element Tree & Render Tree

#### 146. How The UI Is Updated

#### 147. Refactor & Extract Widgets To Avoid Unnecessary Builds

#### 148. Understanding Keys - Setup

#### 149. Which Problem Do Keys Solve?

#### 150. Understanding & Using Keys

#### 151. Mutating Values in Memory & Making Sense of var, final & const

#### 152. Module Summary

### Section 8: Building Multi-Screen Apps & Navigating Between Screens \[MEALS APP]

#### 153. Module Introduction

#### 154. Project Setup

* Will use GoogleFonts(lato)
    * flutter pub add google_fonts

#### 155. Using a GridView

#### 156. Widgets vs Screens

#### 157. Displaying Category Items on a Screen

#### 158. Making any Widget Tappable with InkWell

LinkWell
GestureDetector

#### 159. Adding Meals Data

#### 160. Loading Meals Data Into a Screen

#### 161. Adding Cross-Screen Navigation

#### 162. Passing Data to the Target Screen

#### 163. Introducing the Stack Widget

Stack
FadeInImage
flutter pub add transparent_image

#### 164. Improving the MealItem Widget

#### 165. Adding Navigation to the MealDetails Screen

#### 166. Improving the MealDetails Screen

#### 167. Adding Tab-based Navigation

#### 168. Passing Functions Through Multiple Layers of Widgets (for State Management)

#### 169. Managing App-wide State & Data

#### 170. Adding a Side Drawer

#### 171. Closing the Drawer Manually

#### 172. Adding a Filter Item

#### 173. Replacing Screens (Instead of Pushing)

#### 174. Adding More Filter Options

#### 175. Replacing WillPopScope with PopScope

#### 176. Returning Data When Leaving a Screen

#### 177. Reading & Using Returned Data

#### 178. Applying Filters

#### 179. An Alternative Navigation Pattern: Using Named Routes

#### 180. Module Summary

### Section 9: Managing App-wide State \[MEALS APP]

#### 181. Module Introduction

#### 182. What's The Problem?

#### 183. Installing the Solution: Riverpod

* https://github.com/rrousselGit/riverpod
* flutter pub add flutter_riverpod

#### 184. How State Management with Riverpod Works

* dart pub add riverpod

#### 185. Creating a Provider

#### 186. Using a Provider

#### 187. Creating a More Complex Provider with StateNotifier

#### 188. Using the FavoritesProvider

#### 189. Triggering a Notifier Method

#### 190. Getting Started with Another Provider

#### 191. Combining Local & Provider-managed State

#### 192. Outsourcing State Into The Provider

#### 193. Connecting Multiple Providers With Each Other (Dependent Providers)

#### 194. Swapping The "Favorite Button" Based On Provider State

#### 195. Module Summary

#### 196. "riverpod" vs "provider" - There are many Alternatives!

* https://docs.flutter.dev/data-and-backend/state-mgmt/options

### Section 10: Adding Animations \[MEALS APP]

#### 197. Module Introduction

#### 198. Setup & Understanding Explicit vs Implicit Animations

* Explicit
    * You control the entire animation
    * More control but also more complexity
    * Can often be avoided(by using pre-build Widgets)
* Implicit
    * Flutter controls the animation
    * Less control and therefore less complexity
    * Use pre-build animation widgets as often as possible!

#### 199. Explicit Animations: Adding an Animation Controller

#### 200. Explicit Animations: Playing the Animation with AnimatedBuilder

#### 201. Finetuning Explicit Animations

#### 202. Getting Started with Implicit Animations

* https://docs.flutter.dev/ui/widgets/animation

#### 203. Configuring Implicit Animations

#### 204. Adding Multi-Screen Transitions

#### 205. Module Summary

### Section 11: Handling User Input & Working with Forms \[SHOPPING LIST APP]

#### 206. Module Introduction

#### 207. Setup & A Challenge For You

#### 208. Challenge Solution 1 - Building & Using Models

#### 209. Challenge Solution 2 - Building the List UI

#### 210. Adding a "New Item" Screen

#### 211. The Form & TextFormField Widgets

#### 212. A Form-aware Dropdown Button

#### 213. Adding Buttons to a Form

#### 214. Adding Validation Logic

#### 215. Getting Form Access via a Global Key

#### 216. Extracting Entered Values

#### 217. Passing Data Between Screens

#### 218. Final Challenge Solution

#### 219. Module Summary

### Section 12: Connecting a Backend & Sending HTTP Requests \[SHOPPING LIST APP]

#### 220. Module Introduction

#### 221. What's a Backend? And Why Would You Want One?

#### 222. What Is HTTP & How Does It Work?

* Reference - https://developer.mozilla.org/en-US/docs/Web/HTTP

#### 223. Setting Up a Dummy Backend (Firebase)

https://firebase.google.com/docs/reference/rest/database

#### 224. Adding the http Package

flutter pub add http

#### 225. Sending a POST Request to the Backend

#### 226. Working with the Request & Waiting for the Response

#### 227. Fetching & Transforming Data

#### 228. Avoiding Unnecessary Requests

#### 229. Managing the Loading State

#### 230. Error Response Handling

#### 231. Sending DELETE Requests

#### 232. Handling the "No Data" Case

#### 233. Better Error Handling

#### 234. Using the FutureBuilder Widget

#### 235. Module Summary

### Section 13: Using Native Device Features (e.g., Camera) \[FAVORITE PLACES APP]

#### 236. Module Introduction

#### 237. Setup & A Challenge For You!

#### 238. Adding a Place Model (Challenge Solution 1/6)

flutter pub add uuid

#### 239. Adding a "Places" Screen (Challenge Solution 2/6)

#### 240. Adding an "Add Place" Screen (Challenge Solution 3/6)

#### 241. Adding "riverpod" & A Provider (Challenge Solution 4/6)

#### 242. Adding Places with Provider & Displaying Places (Challenge Solution 5/6)

#### 243. Adding a "Place Details" Screen (Challenge Solution 6/6)

#### 244. Adding a "Pick an Image" Input

#### 245. Installing the "Image Picker" Package

* flutter pub add image_picker

#### 246. Using the Device Camera For Taking Pictures

#### 247. Adding the Picked Image to the Model & "Add Place" Form

#### 248. Previewing the Picked Image

#### 249. Important: "location" Package & Android

#### 250. Adding the "location" Package & Starting with the "Get Location" Input Widget

* flutter pub add location

#### 251. Getting the User's Current Location

#### 252. Using the Google Maps API - Setup

cd android
./gradlew signingReport

#### 253. Using Google's Geocoding API

* flutter pub add http
* https://developers.google.com/maps/documentation/geocoding/requests-reverse-geocoding

#### 254. Storing the Location Data in the Model

#### 255. Displaying a Location Preview Map Snapshot via Google

* https://developers.google.com/maps/documentation/maps-static/overview

#### 256. Using the Picked Location in the Form

#### 257. Outputting the Location Data

#### 258. Installing & Configuring the Google Maps Package

#### 259. Adding a "Map" Screen

#### 260. Displaying the Picked Place on a Dynamic Map

#### 261. Handling Map Taps for Selecting a Location Manually

#### 262. Using the Map Screen in the "Add Place" Form

#### 263. Installing Packages for Local (On-Device) Data Storage

* flutter pub add path_provider

##### Supported platforms and paths #

###### Directories support by platform:

|          Directory           | Android | iOS | Linux | macOS | Windows |
|:----------------------------:|:-------:|:---:|:-----:|:-----:|:-------:|
|          Temporary           |   ✔️    | ✔️  |  ✔️   |  ✔️   |   ✔️    |
|     Application Support      |   ✔️    | ✔️  |  ✔️   |  ✔️   |   ✔️    |
|     Application Library      |   ❌️    | ✔️  |  ❌️   |  ️✔️  |   ❌️    |
|    Application Documents     |   ✔️    | ✔️  |  ✔️   |  ✔️   |   ✔️    |
|      Application Cache       |   ✔️    | ✔️  |  ✔️   |  ✔️   |   ✔️    |
|       External Storage       |   ✔️    | ❌️  |  ❌️   |  ❌️   |   ❌️    |
|  External Cache Directories  |   ✔️    | ❌️  |  ❌️   |  ❌️   |   ❌️    |
| External Storage Directories |   ✔️    | ❌️  |  ❌️   |  ❌️   |   ❌️    |
|          Downloads           |   ✔️    | ✔️  |  ✔️   |  ✔️   |   ✔️    |


* flutter pub add path
* flutter pub add sqflite
* flutter pub add shared_preferences
#### 264. Storing the Picked Image Locally

#### 265. Storing Place Data in a (On-Device) SQL Database

#### 266. Loading Data from the SQL Database

#### 267. Using a FutureBuilder for Loading Data

#### 268. Module Summary

#### 269. Adding Your Own Native Code


### Section 14: Push Notifications & More: Building a Chat App with Flutter & Firebase
https://github.com/academind/flutter-complete-guide-course-resources/tree/main/Lecture%20Attachments/14%20Chat%20App


#### 270. Module Introduction

#### 271. App & Firebase Setup


#### 272. Adding an Authentication Screen

#### 273. Adding Buttons & Modes to the Authentication Screen

#### 274. Validating User Input

#### 275. Firebase CLI & SDK Setup 1/2
https://firebase.google.com/docs/flutter/setup?platform=ios

#### 276. FlutterFire Configuration

#### 277. Firebase CLI & SDK Setup 2/2

#### 278. Signing Users Up

#### 279. Logging Users In

#### 280. Showing Different Screens Based On The Authentication State

#### 281. Adding a Splash Screen (Loading Screen)

#### 282. Adding User Logout

#### 283. Image Upload: Setup & First Steps

* flutter pub add firebase_storage

#### 284. Adding a User Image Picker Widget

#### 285. Using the ImagePicker Package

#### 286. Managing The Selected Image In The Authentication Form

#### 287. Uploading Images To Firebase

#### 288. Showing a Loading Spinner Whilst Uploading

#### 289. Adding a Remote Database: Firestore Setup
* flutter pub add cloud_firestore

#### 290. Sending Data to Firestore
* multiDexEnabled true in gradle

#### 291. Storing a Username

#### 292. Adding ChatMessages & Input Widgets

#### 293. A Note About Reading Data From Firestore

#### 294. Sending & Reading Data To & From Firestore

#### 295. Loading & Displaying Chat Messages as a Stream

#### 296. Styling Chat Message Bubbles

#### 297. Push Notifications - Setup & First Steps
* https://firebase.google.com/docs/cloud-messaging/flutter/client
* flutter pub add firebase_messaging

#### 298. Requesting Permissions & Getting an Address Token

#### 299. Testing Push Notifications

#### 300. Working with Notification Topics

#### 301. Sending Push Notifications Automatically via Cloud Functions

#### 302. Module Summary
    