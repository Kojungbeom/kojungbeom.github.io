# Classification

- Classification divides data samples into target classes.

- Binary and multilevel methods of classification



### Kinds of Classification Algorithms

**For Binary Classification**

- SVM
- Logistic Regression

**For Multiclass Classification**

- SGD (Stochastic Gradient Descent)
- Random Forest
- Naive Bayes
- Decision tree
- Ensemble

**For Both**

- SGD
- Random Forest
- Naive Bayes
- KNN?

For Multilabel Classification

- KNN (KNeighbors Classifier)

==**note)** There are various starategies that you can use to perform multiclass classification with multiple binary classifiers.==



### OvR vs OvO

- Binary Classifier로 Multiclass Classification을 하기 위한 방법 두가지!

MNIST를 예로 들면

**OvR (one-versus-the rest)**

- Train 10 binary classifiers
  - One for each digit (0-detect, 1-detect... 9-detect)

- Get the decision score from each classifier for that image and you select the class whose classifier outputs the highest score.

**OvO (one-versus-one)**

- Train N * (N - 1) /2 classifiers
  - One for every pair of digits (0 vs 1, 0 vs 2 ... 9 vs 8)

- See which class wins the most duels.
- **The main advantage is that each classifier only needs to be trained on the part of the training set for the two classes that it must distinguish.**

Note) ==SVM같은 Classifier가 있다고 할 때, Training set의 수가 빈약하다면?==

- **작은 Training set에서 여러 Classifier를 training 시키는게 더 좋기 때문에** OvO가 유리하다.

하지만 대부분의 Binary Classification algorithm에서 OvR이 더 선호됨 ;;

---

First, you need to divide each value in the confusion matrix by the number of images in the corresponding class so that you can compare error rates instead of absolute numbers of errors

Fill the diagonal with zeros to keep only the errors

---





---

However, most misclassified images seem like obvious errors to us, and it’s hard to understand why the classifier made the mistakes it did. 3 The reason is that we used a simple SGDClassifier, which is a linear model. All it does is assign a weight per class to each pixel, and when it sees a new image it just sums up the weighted pixel intensities to get a score for each class.

---



### Performance Measure

- RMSE (Root Mean Square Error)

- Cross-Validation
- Confusion Matrix (Precision and Recall)
- F score
  - What if recall is more important
  - What if precision is more important
  - What if they have same importance

- ROC Curve and AUC



## SGD Classifier

- Capable of handling single and multiclass classification

- Advantage of being capable of handling very large datasets efficiently.
- Deal with training instances independently



## KNN

- Which supports multilabel Classification

Hint: the KNN works quite well for MNIST Classification task





# Regression

## Linear Regression

- Using ad direct "closed form" equation 
- Using an iterative optimization approach called Gradient Descent(GD)



- Normal equation
- Gradient Descent
  - 

### Normal Equation

- Computational Complexity  = O(n^2.4 ~ n^3)
- SVM도 비효율적이긴 함 ㅋㅋㅋ
- predicts are very fast, if once you have trained your Linear Regression.

### Gradient Descent

- 좀더 Large dataset에 적합한 regression 방식

- Capable of finding optimal solutions to a wide range of problems.
- The General idea of Gradient Descent is to tweak parameters iteratively in order to minimize a cost function
- Once the gradient is zero, you have reached a minimum.



Note) MSE는 Convex하지

1. Start by filling \theta with random values



#### Batch Gradient Descent

- Instead of computing these partial derivatives individually, you can use equation 4-6 to compute them all in one go.
- The gradient vector contains all the partial derivatives of the cost function.

- Batch gradient descent uses the whole batch of training data at every step
- It is terribly slow on very large training sets
- if there are hundreds of thousands of features is much faster using gradient descent than using the Normal equation or SVD decomposition



θ next step = θ − η ∇ θ MSE θ



#### Stochastic Gradient Descent

- Opposite of Batch Gradient Descent
- Pick random instance in the training set at every step and computes the gradients based only on that single instance.
- that makes the algorithm much faster.
- Final parameter values are good, but not optimal
- Help the algorithm jump out of local minima
- Therefore, randomness is good to escape from local optima, but bad because it means that the algorithm can never settle at the minimum. One solution to this dilemma is to gradually reduce the learning rate.



#### Mini-batch Gradient Descent

- At each step, instead of computing the gradients based on the full training set or based on just one instance, this computes the gradients on small random sets of instances called mini-batches.
- As a result, Mini-batch GD will end up walking around a bit closer to the minimum than SGD.
  - But it may be harder for it to escape from local minima

![image-20200611195607410](/home/ines/.config/Typora/typora-user-images/image-20200611195607410.png)

![image-20200611195618993](/home/ines/.config/Typora/typora-user-images/image-20200611195618993.png)



### Polynomial Regression

- Surprisingly, you can use a linear model to fit nonlinear data.
  - Simple way to do this is to add powers of each feature as new features.
  - PolynomialFeatures(degree=d) transforms an array containing n features into an array containing (n + d)! / d!n! features, where n! is the factorial of n, equal to 1 × 2 × 3 × ⋯ × n. Beware of the combinatorial explosion of the number of features!

- The high degree Polynomial Regression model is severely overfitting the training data, while the linear model is underfitting it.

잠깐! Overfitting되었는지, Underfitting되었는지 어떻게 확인하는가?

Chapter2에서는 Cross-validation을 사용해서

- Training dataset에서만 좋은 성능을 보였다면 Overfitting
- Training and cross validation set 둘 다 에서 Poor performance를 보였다면 Underfitting

이번에는 Learning curves를 그래프에 띄워서 확인하는 방법을 썼다는거

- 처음에는 Training set을 얼마 학습안했을때는 기똥차게 답을 맞출거임 (RMSE가 0에서 시작하는 이유!)
- 그러다가 점점 Training set의 수가 많아지게 되면, 완벽하게 Fit하기란 불가능함 (데이터 자체가 Linear하지 않을 수도 있으니까 (Outlier라던가..))

- 처음에 얼마 학습안했을때를 보면 또 이번에는 Validation curve가 큰값으로 시작한다 (처음에는 답을 맞추기가 힘듬)

==Note) Underfitting 되었다면, 데이터를 더 늘려주더라도 성능향상을 기대하기는 힘들다==

-> 더 복잡한 Model이 필요하다!

==반대로 Overfitting 되었다면?==

-> 더 간단한 모델을 사용하던가, 데이터를 손을 본다던가 regularization을 하던가

This means that the model performs signifi‐
cantly better on the training data than on the validation data, which is the hall‐
mark of an overfitting model. If you used a much larger training set, however, the
two curves would continue to get closer.

http://sanghyukchun.github.io/59/



### Ridge Regression

- Regularized version of Linear regression: a regularization term is added to the cost function(RMSE)

- Force the learning algorithm to not only fit the data but also keep the model weights as small as possible.

  Note) The regularization term should only be added to the cost function during training.

Overfitting을 피하기 위해 사용한다.

hyperparameter \alpha = Learning rate





