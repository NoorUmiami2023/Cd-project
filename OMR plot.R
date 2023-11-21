f0_omr <- read.csv(file.choose())
f0_omr$cycle_length <- as.factor(f0_omr$cycle_length)
str(f0_omr)
library(ggplot2)
data <- f0_omr
data$cycle_length <- factor(data$cycle_length, levels = rev(levels(data$cycle_length)))
str(data)
data$
W_OMR.
# Load the dataset
f2_pair_Omr <- ggplot(data, aes(x = cycle_length, group = 1)) +
  geom_line(aes(y = W_OMR., color = "W"), position = position_nudge(x = -0.2), size = 1) +
  geom_line(aes(y = Cd__OMR., color = "Cd"), position = position_nudge(x = 0.1), size = 1) +
  geom_point(aes(y = W_OMR., color = "W"), position = position_nudge(x = -0.2), size = 3) +
  geom_point(aes(y = Cd__OMR., color = "Cd"), position = position_nudge(x = 0.1), size = 3) +
  scale_color_manual(values = c("W" = "blue",  "Cd" = "red")) +
  labs(x = "Cycle Length (cm)", y = "OMR Response (%)", color = "Group", title = "F2 Generation") +
  scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 10), labels = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100)) +
  theme_minimal()+
  theme(axis.text = element_text(size = 12))
f2_pair_Omr <- f2_pair_Omr + theme(plot.title = element_text(hjust = 0.5))
















install.packages("gridExtra")
install.packages("cowplot")
library(gridExtra)
library(cowplot)
# Create shared legends
shared_legend_pair <- cowplot::get_legend(f0_pair_Omr)
shared_legend_idv <- cowplot::get_legend(f0_idv_Omr)

# Remove legends from individual plots
plots_pair <- list(f0_pair_Omr, f1_pair_Omr, f2_pair_Omr)
plots_idv <- list(f0_idv_Omr, f1_idv_Omr, f2_idv_Omr)

for (i in 1:3) {
  plots_pair[[i]] <- plots_pair[[i]] + theme(legend.position = "none")
  plots_idv[[i]] <- plots_idv[[i]] + theme(legend.position = "none")
}

# Arrange the plots in two separate grids (one for pair and one for idv)
grid_pair <- grid.arrange(grobs = plots_pair, ncol = 3, bottom = shared_legend_pair)
grid_idv <- grid.arrange(grobs = plots_idv, ncol = 3, bottom = shared_legend_idv)

# Combine the two grids into one final grid
combined_grid <- grid.arrange(grid_pair, grid_idv, ncol = 1)

# Print or save the combined grid
print(combined_grid)












library(gridExtra)




# Create a dummy plot with a legend
dummy_plot <- ggplot() +
  geom_point(aes(x = 0, y = 0, color = "W Male"), show.legend = TRUE) +
  geom_point(aes(x = 0, y = 0, color = "W Female"), show.legend = TRUE) +
  geom_point(aes(x = 0, y = 0, color = "Cd Male"), show.legend = TRUE) +
  geom_point(aes(x = 0, y = 0, color = "Cd Female"), show.legend = TRUE) +
  scale_color_manual(values = c("W Male" = "blue", "W Female" = "skyblue", "Cd Male" = "red", "Cd Female" = "pink")) +
  theme(legend.position = "bottom") +
  labs(color = "Group")

# Remove legends from individual plots
f0_pair_Omr <- f0_pair_Omr + theme(legend.position = "none")
f1_pair_Omr <- f1_pair_Omr + theme(legend.position = "none")
f2_pair_Omr <- f2_pair_Omr + theme(legend.position = "none")
f0_idv_Omr <- f0_idv_Omr + theme(legend.position = "none")
f1_idv_Omr <- f1_idv_Omr + theme(legend.position = "none")
f2_idv_Omr <- f2_idv_Omr + theme(legend.position = "none")

# Combine the plots with the shared legend
combined_plot <- grid.arrange(
  f0_pair_Omr, f1_pair_Omr, f2_pair_Omr,
  f0_idv_Omr, f1_idv_Omr, f2_idv_Omr,
  ncol = 3
)

# Print or save the combined plot
print(combined_plot)


# Create a shared legend for all the plots
shared_legend <- cowplot::get_legend(f0_pair_Omr)

# Remove legends from individual plots
plots_pair <- list(f0_pair_Omr, f1_pair_Omr, f2_pair_Omr)
plots_idv <- list(f0_idv_Omr, f1_idv_Omr, f2_idv_Omr)

for (i in 1:3) {
  plots_pair[[i]] <- plots_pair[[i]] + theme(legend.position = "none")
  plots_idv[[i]] <- plots_idv[[i]] + theme(legend.position = "none")
}

# Arrange the plots in two separate grids (one for pair and one for idv)
grid_pair <- grid.arrange(grobs = plots_pair, ncol = 3, bottom = shared_legend)
grid_idv <- grid.arrange(grobs = plots_idv, ncol = 3, bottom = shared_legend)

# Combine the two grids into one final grid
combined_grid <- grid.arrange(grid_pair, grid_idv, ncol = 1, top = NULL)

# Print or save the combined grid
print(combined_grid)












