f0_omr <- read.csv(file.choose())
f0_omr$cycle_length <- as.factor(f0_omr$cycle_length)
str(f0_omr)
library(ggplot2)
data <- f0_omr
data$cycle_length <- factor(data$cycle_length, levels = rev(levels(data$cycle_length)))
str(data)
# Load the dataset
f2_idv_Omr <- ggplot(data, aes(x = cycle_length, group = 1)) +
  geom_line(aes(y = W_Male_OMR., color = "W Male"), position = position_nudge(x = -0.2), size = 1) +
  geom_line(aes(y = W_Female_OMR., color = "W Female"), position = position_nudge(x = -0.1), size = 1) +
  geom_line(aes(y = Cd_Male_OMR., color = "Cd Male"), position = position_nudge(x = 0.1), size = 1) +
  geom_line(aes(y = Cd_Female_OMR., color = "Cd Female"), position = position_nudge(x = 0.2), size = 1) +
  geom_point(aes(y = W_Male_OMR., color = "W Male"), position = position_nudge(x = -0.2), size = 3) +
  geom_point(aes(y = W_Female_OMR., color = "W Female"), position = position_nudge(x = -0.1), size = 3) +
  geom_point(aes(y = Cd_Male_OMR., color = "Cd Male"), position = position_nudge(x = 0.1), size = 3) +
  geom_point(aes(y = Cd_Female_OMR., color = "Cd Female"), position = position_nudge(x = 0.2), size = 3) +
  scale_color_manual(values = c("W Male" = "blue", "W Female" = "skyblue", "Cd Male" = "red", "Cd Female" = "pink")) +
  labs(x = "Cycle Length (cm)", y = "OMR Response (%)", color = "Group", title = "F2 Generation") +
  scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 10), labels = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100)) +
  theme_minimal()+
  theme(axis.text = element_text(size = 12))
f2_idv_Omr <- f2_idv_Omr + theme(plot.title = element_text(hjust = 0.5))

f0_idv_Omr
f1_idv_Omr
f2_idv_Omr






library(gridExtra)
# Assuming you have already created the f1_idv_Omr and f2_idv_Omr plots similarly to f0_idv_Omr

# Create a shared legend for the three plots
shared_legend <- get_legend(f0_idv_Omr + theme(legend.position = "bottom"))

# Remove legends from individual plots
f0_idv_Omr <- f0_idv_Omr + theme(legend.position = "none")
f1_idv_Omr <- f1_idv_Omr + theme(legend.position = "none")
f2_idv_Omr <- f2_idv_Omr + theme(legend.position = "none")

# Arrange the plots in a grid with a shared legend
combined_plot <- grid.arrange(
  f0_idv_Omr + theme(legend.position = "none"),
  f1_idv_Omr + theme(legend.position = "none"),
  f2_idv_Omr + theme(legend.position = "none"),
  ncol = 3
)

# Print or save the combined plot
print(combined_plot)

















