Python 2.7.9 (default, Dec 10 2014, 12:24:55) [MSC v.1500 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> iris[iris['Species']=='virginica']

Traceback (most recent call last):
  File "<pyshell#0>", line 1, in <module>
    iris[iris['Species']=='virginica']
NameError: name 'iris' is not defined
>>> vir=iris[iris['Species']=='virginica']

Traceback (most recent call last):
  File "<pyshell#1>", line 1, in <module>
    vir=iris[iris['Species']=='virginica']
NameError: name 'iris' is not defined
>>> vir.fillna=(vir.mean())

Traceback (most recent call last):
  File "<pyshell#2>", line 1, in <module>
    vir.fillna=(vir.mean())
NameError: name 'vir' is not defined
>>> iris[iris['Species']=='virginica']

Traceback (most recent call last):
  File "<pyshell#3>", line 1, in <module>
    iris[iris['Species']=='virginica']
NameError: name 'iris' is not defined
>>> iris[iris['Species']=='virginica'].fillna(vir.mean())
