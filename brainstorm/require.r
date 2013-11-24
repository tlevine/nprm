require <- function(x) { print('overridden') }

require('MASS')
print(base::require)
print(require)
