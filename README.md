# NYC-Schools
**NYC Schools Directory Application**

NYC Schools is a sample app that retrieves the NYC schools details from NYC DOE via API calls. This app follows MVVM architecture. Goal of the MVVM is to write modular code that is easy to unit test, maintain and avoid the UIKit dependecy during unit tests. It makes the view controllers light weight by moving all data fetch and data format logic into the ViewModel. This app includes the small portion of unit testing to demonstrate the usage of XC Unit testing framework for ViewModel, Data Service unit and perfromance tests.

Use below link to download source from git via HTTPS https://github.com/vgane1119/NYC-Schools.git

**Features to add when get time**
1. Pull down to refresh 
2. Search option to search schools by name
3. Cache / data expire fucntionlity for data to boost the app performance
4. Add webview to launch the school website with the app when user selecte webview in school details view controller 
5. Implement the mockServices and add dependecy injection to unit test the API service calls with out using server API calls
6. Refactor the ServiceManager to use the swift's latest new feature async/wait for URLSession data task to replace the closuers and easy handle asynchronus calls
