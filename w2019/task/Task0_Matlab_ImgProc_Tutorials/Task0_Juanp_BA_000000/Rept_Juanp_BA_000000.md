# Task0: MATLAB & Digital Image Processing Tutorial

**Name:** Juan Park
**Degree:** BA
**ID:** 000000

## Problem 1

```matlab
% Array creation, combining, reshaping, rearranging, and indexing
% https://www.mathworks.com/help/matlab/matrices-and-arrays.html
logicStr = {'False', 'True'};
PrtEqual = @(M1Str, M1, M2Str, M2) fprintf('%s and %s are the same: %s', M1Str, M2Str, logicStr{isequal(M1, M2)+1});

% zeros and ones
M1 = zeros(5,5);
M2 = ones(5,5);
PrtEqual('M1', M1, 'M2-1', M2-1);
```

## Problem 2

```python
import numpy as np

a = np.array([1, 2, 3])   # Create a rank 1 array
print(type(a))            # Prints "<class 'numpy.ndarray'>"
print(a.shape)            # Prints "(3,)"
print(a[0], a[1], a[2])   # Prints "1 2 3"
a[0] = 5                  # Change an element of the array
print(a)                  # Prints "[5, 2, 3]"

```

........


## Problem 6

### Q.001
