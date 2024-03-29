# lm operator

#### Description

The `lm` operator performs a linear regression in Tercen.

##### Usage
Input projection|.
---|---
`y-axis`| measurement value
`x-axis`| explanatory value

Output relations|.
---|---
`intercept`| numeric, p-value calculated per cell
`slope`| numeric, p-value calculated per cell
`fit.x`| numeric, lowest and highest x values
`fit.y`| numeric, lowest and highest predicted y values

##### Details

The `lm` operator performs a linear regression on each cell.

##### References

See [Linear regression on Wikipedia](https://en.wikipedia.org/wiki/Linear_regression) and
`lm` [R function documentation](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/lm).

##### See Also

[anova](https://github.com/tercen/anova_operator)

