#


#### Model evaluation
In-sample evaluation tells us how well our model fits training data, but does not predict how well model will predict new data. 
 
 - Solution: split data in to train and test data sets.
 
        from sklearn.model_selection import train_test_split()
        x_train, x_test, y_train, y_test = train_test_split(x_data, y_data, test_size=0.3, random_state=0)
        
    - the parameter `test_size=0.3` says that 30% of the data is reserved for the test set.
    - random_state` is a seed for randonly splitting up data
    
 - Generalization performance: measure of how well our data predicts the training set data .
 - Cross-validation

         from sklearn.model_selection import cross_val_score
         scores = cross_val_score(lr, x_data, y_data, cv=3)
         
    - `lr` is model object (here so-named because it is a linear regression model)
    - `cv=3` is number of partitions the data is split into.
    
#### Overfitting, Underfitting and Model Selection

To determine the best order of model to fit our data, create models of many different orders and plot the training error and test error for each (usually as MSE or R-squared)
). The training error should always continuously decreas as order increases, but we might be overfitting. To find optimal order for fitting all data, pick the order that minimizes the test data error.


#### Ridge regression

Control size of polynomial coefficients with ridge parameter `alpha`.

        from sklearn.linear_model import ridge
        RidgeModel = Ridge(alpha=0.1)
        RidgeModel.fit(X, y)
        Yhat = RidgeModel.predict(X)
   
   - Repeat with many values of `alpha` and pick the value that maximizes R-squared of model on test data.
        

#### Grid search

        from sklearn.linear_model import Ridge
        from sklearn.model_selection import GridSearchCV
        
        parameters = [{'alpha' : [0.001, 0.01, 0.1, 1.0, 10.0, 100.0, 100000.0]}]
        
        RR = Ridge()
        Grid1 = GridSearchCV(RR, paramaters, cv=4)
        Grid1.fit(x_data[['horsepower','curb-weight','engine-size','highway-mpg']], y_data)
        Grid1.best_estimator_
        scores = Gri1.cv_results_
        scores['mean_test_score']
        
 We can pass values for many different parameters, e.g. :
 
         parameters= [{'alpha': [0.001,0.1,1, 10, 100], 'normalize' : [True, False] }] 
         
         
### Application

Split data into train and test data
```
from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x_data, y_data, test_size=0.15, random_state=1)
```
Make a linear regression model using the train data, then compute the R-squared value from the model on the test data.
```
from sklearn.linear_model import LinearRegression
lre=LinearRegression()
lre.fit(x_train[['horsepower']], y_train)
lre.score(x_test[['horsepower']], y_test)
```
The R^2 value will be much smaller on the training data: `lre.score(x_train[['horsepower']], y_train)`

NOw let's use cross-validation. Split the data into four "folds"
```
from sklearn.model_selection import cross_val_score
Rcross = cross_val_score(lre, x_data[['horsepower']], y_data, cv=4)
```
  
#### [Jupyter notebook](week5)

 
