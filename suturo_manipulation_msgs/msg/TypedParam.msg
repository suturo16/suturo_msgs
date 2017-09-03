uint8 DOUBLE=0       # Scalar data
uint8 TRANSFORM=1    # Transformation data
uint8 ELAPSEDTIME=2  # Time since the start of controller's execution in seconds
uint8 VECTOR=3       # Vector data
uint8 VISUALIZE=4    # Parameter contains a visualization rule

bool isConst    # Is the value constant
uint8 type      # Type of the parameter
string name     # Name of input in controller
string value    # Value of this assignment