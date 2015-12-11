# mobile-testing
These are the code samples used during our 'mobile testing' talk at Mobel December 10, 2015 (http://www.meetup.com/mo-bel/events/226864160/)

# Getting started

The only thing you have to do to get started with this example app is installing the [Cocoapods](https://cocoapods.org).
Just navigate to the location of the project with the terminal and execute:

```
pod install
```

Fire up the `.xcworkspace` with xCode and you can start browsing the examples.

# What is this example app about?

This example app is a very simple 'hot or not' application where you can swipe between different famous persons. When you press the HOT or NOT button an indicator will appear.

The app's tests are devided in different folders & schemes. 
Just build & test the scheme you like.

#Architecture
![architecture](https://github.com/appfoundry/mobile-testing/blob/master/Documentation/Images/architecture.png)

###HotOrNotViewController
Since we are using MVVM this ViewController is very simple. It only delegates its actions to the ViewModel.

###HotOrNotViewModel
Here we can see some business logic of the application. It holds a reference to the ViewPopulator and the DataProvider. At this moment the ViewModel is immutable, meaning that the ViewController does not need updates of the ViewModel. When you need a mutable ViewModel i highly recommand checking out [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa).

###PersonViewPopulator
This object is responsible to populate data inside the view. It puts - for example - texts inside labels and can even ask the ImageService to fetch an image.

###DefaultImageService
The ImageService can download, place and cache images for the application.

###HotOrNotContextBuilder
The ContextBuilder is responsible for the wiring of the applications structure. Usually this is done by a Dependency Injection framework like [Reliant](https://github.com/appfoundry/Reliant).

###DefaultPersonDataProvider
Here we are holding all the value objects of the applications. In this example it provides the application of PersonObjects.

#Unit testing

### Without frameworks

In the `iOSTestTalkUnitTests` you will find examples of how testing could be done without any of the frameworks. Here we created our own mock objects and we are using Apple standard XCTest API to verify behaviour.

### OCMockito & OCHamcrest

In the `iOSTestTalkUnitTestingOCMockitoOCHamcrest` folder you will find test examples using [OCMockito](https://github.com/jonreid/OCMockito) as a mocking framework and [OCHamcrest](https://github.com/hamcrest/OCHamcrest) as a matcher framework.

### Specta, OCMock & Expecta

In the `iOSTestTalkUnitTestingOCMockitoOCHamcrest` folder you will find test examples using [OCMock](http://ocmock.org) as a mocking framework, [Expecta](https://github.com/specta/expecta) as a matcher framework and [Specta](https://github.com/specta/specta) as the TDD/BDD framework.

#UI testing

###Xcode 7 UI testing

In the `iOSTestTalkUITestingKIF` folder you will find simple UI tests using Xcode 7's new UI testing features.

###KIF

In the `iOSTestTalkUITestingKIF` folder you will find examples of how to write simple tests using [KIF](https://github.com/kif-framework/KIF)


#Contact
If you have questions about these examples, feel free to contact me via email: joris.dubois@appfoundry.be