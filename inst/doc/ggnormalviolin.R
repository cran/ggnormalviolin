## ----setup--------------------------------------------------------------------
#| include: false
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6.5,
  fig.height = 6.5
)
library(ggnormalviolin)


## ----fig-example--------------------------------------------------------------
#| fig-cap: Example of a how to use ggnormalviolin
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations
library(ggplot2)
library(ggnormalviolin)

# Make data
d <- data.frame(
  dist = c("A", "B", "C", "D"),
  dist_mean = c(80, 90, 110, 130),
  dist_sd = c(15, 10, 20, 5)
)

# Make base plot
p <- ggplot(data = d,
            aes(x = dist,
                mu = dist_mean,
                sigma = dist_sd,
                fill = dist)) +
  theme_light() +
  theme(legend.position = "none") +
  labs(x = NULL, y = NULL)

# Add normal violins
p + geom_normalviolin()


## ----fig-example2-------------------------------------------------------------
#| fig-cap: How to shade both violin tails
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations, with 2.5 percent of
#|   each tail shaded.
p + geom_normalviolin(p_tail = 0.05)


## ----fig-uppertail------------------------------------------------------------
#| fig-cap: How to shade the upper tails only
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations, with 5 percent of the
#|   upper tails shaded.
p + geom_normalviolin(p_upper_tail = 0.05)


## ----fig-lowertail------------------------------------------------------------
#| fig-cap: How to shade the lower tails only
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations, with 5 percent of the
#|   lower tails shaded.
p + geom_normalviolin(p_lower_tail = 0.05)


## ----fig-style----------------------------------------------------------------
#| fig-cap: How to style normal violins
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations, with white tails,
#|   and gray outlines.
p +
  geom_normalviolin(
    p_tail = 0.05,
    tail_fill = "white",
    tail_alpha = 0.8,
    color = "gray20",
    linewidth = 0.1
  )


## ----fig-faceright------------------------------------------------------------
#| fig-cap: How make half-violins
#| fig-alt: >
#|   Plot of 4 normal half-violin shapes of different fill colors,
#|   means, and standard deviations, with 5 percent of the
#|   upper tails shaded.
p + geom_normalviolin(face_right = FALSE, p_tail = 0.05)



## ----fig-setwidth-------------------------------------------------------------
#| fig-cap: How to set violin width to a constant value
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations, with width set to 1.
p + geom_normalviolin(width = 1)


## ----fig-setsdwidth-----------------------------------------------------------
#| fig-cap: How to set violin width to be proportional to the standard deviation
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations, with width set to be
#|   proportional to the standard deviation
p + geom_normalviolin(aes(width = dist_sd * 0.05))



## ----fig-nsigma---------------------------------------------------------------
#| fig-cap: How to set violin height
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations, with height set to plus
#|   or minus 1.5 standard deviations.
p + geom_normalviolin(nsigma = 1.5)


## ----fig-ylim-----------------------------------------------------------------
#| fig-cap: A distorted plot due to limits set too narrowly
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations, with limits set too
#|   narrowly, which distors the violin shapes.
p +
  geom_normalviolin() +
  ylim(50, 140)


## ----fig-upperlowerlimits-----------------------------------------------------
#| fig-cap: How to set plot limits to prevent image distortion
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations, with limits set
#|   appropriately wide using the ylim function.
p +
  geom_normalviolin(lower_limit = 50, upper_limit = 140) +
  ylim(50, 140)


## ----fig-coordcartesian-------------------------------------------------------
#| fig-cap: How to set zooming limits using a `coord_*` function
#| fig-alt: >
#|   Plot of 4 normal violin shapes of different fill colors,
#|   means, and standard deviations, with limits set
#|   appropriately wide using the coord_cartesian function's
#|   ylim parameter.
p +
  geom_normalviolin() +
  coord_cartesian(ylim = c(50, 140))

