# Install required libraries (uncomment and run if not already installed)
# install.packages('tidyverse')  # For data manipulation and visualization
# install.packages('ggrepel')    # For better text label positioning
# install.packages('grid')       # For adding annotations outside the plot

# Load libraries
library(ggplot2)    # Main library for creating plots
library(dplyr)      # For data manipulation
library(ggrepel)    # To handle overlapping text labels
library(grid)       # For annotations outside the plot area

# Create the dataset
# This dataset contains the regional voting percentages for NPP and NDC in the 2020 and 2024 elections.
ghana_election_regional <- data.frame(
  Region = c(
    "Ahafo", "Ashanti", "Bono", "Bono East",
    "Central", "Eastern", "Greater Accra", "North East",
    "Northern", "Oti", "Savanna", "Upper East",
    "Upper West", "Volta", "Western", "Western North", "National"
  ),
  Year = rep(c(2020, 2024), each = 17),  # Assign 2020 and 2024 years to the regions
  NPP_Percentage = c(
    55.04, 72.79, 58.22, 41.18,
    52.31, 60.80, 48.15, 51.33,
    45.57, 35.88, 35.19, 32.84,
    32.80, 14.05, 50.93, 46.41, 51.65,
    45.97, 64.90, 43.96, 35.96,
    39.64, 51.28, 34.47, 54.06,
    40.55, 31.68, 29.10, 22.34,
    26.48, 8.75, 38.33, 37.36, 41.61
  ),  # NPP vote percentages by region
  NDC_Percentage = c(
    44.04, 26.47, 40.45, 57.38,
    45.92, 37.60, 50.97, 46.97,
    53.09, 62.53, 62.97, 64.68,
    64.65, 84.83, 46.16, 52.05, 47.76,
    52.53, 33.10, 53.75, 62.44,
    58.27, 47.12, 63.77, 44.54,
    57.88, 66.85, 68.97, 75.72,
    71.52, 90.11, 58.94, 61.05, 56.55
  )  # NDC vote percentages by region
)

# Define custom colors for specific regions
region_colors <- c(
  "Ashanti" = "cyan4", "North East" = "green", "Volta" = "chocolate1",
  "Greater Accra" = "darkturquoise", "Northern" = "darkgoldenrod1", "Savanna" = "brown",
  "Central" = "mediumorchid1", "National" = "black",  # Key regions with distinct colors
  "Ahafo" = "azure4", "Bono" = "azure4", "Bono East" = "azure4",
  "Eastern" = "azure4", "Oti" = "azure4", "Upper East" = "azure4",
  "Upper West" = "azure4", "Western" = "azure4", "Western North" = "azure4"  # Grouped regions with same color
)

# Data preparation
# Convert the dataset into a tidy format for ggplot
ghana_election_regional_plot <- ghana_election_regional %>%
  pivot_longer(
    cols = c(NPP_Percentage, NDC_Percentage),  # Transform NPP and NDC percentages into a single column
    names_to = "Party",                        # Create a new column to indicate the party
    values_to = "Percentage"                   # Store percentages in a separate column
  ) %>%
  mutate(
    Party = case_when(                         # Rename Party column values for clarity
      Party == "NPP_Percentage" ~ "NPP",
      Party == "NDC_Percentage" ~ "NDC"
    ),
    x_position = case_when(                    # Assign x-axis positions based on Party and Year
      Party == "NPP" & Year == 2020 ~ -1,
      Party == "NPP" & Year == 2024 ~ -0.1,
      Party == "NDC" & Year == 2020 ~ 0.1,
      Party == "NDC" & Year == 2024 ~ 1
    ),
    display_label = ifelse(                    # Highlight selected regions for labeling
      Region %in% c("National", "Ashanti", "Central", "Greater Accra",
                    "North East", "Northern", "Savanna", "Volta"), 
      TRUE, 
      FALSE
    )
  )

# Create the plot
ggplot(ghana_election_regional_plot, aes(x = x_position, y = Percentage,
                                         group = interaction(Region, Party), color = Region)) +
  geom_line(aes(alpha = display_label), size = 3) +  # Plot lines connecting data points
  geom_point(aes(alpha = display_label), size = 5) +  # Add data points
  geom_text_repel(                                   # Add percentage labels to selected regions
    data = subset(ghana_election_regional_plot, display_label),
    aes(label = paste0(Percentage, "%")),
    size = 6, 
    color = "grey20",
    face = "bold",
    box.padding = 0.3,
    segment.color = "gray50"
  ) +
  scale_x_continuous(                                # Set custom labels for x-axis
    breaks = c(-1, -0.1, 0.1, 1),
    labels = c("NPP 2020", "NPP 2024", "NDC 2020", "NDC 2024")
  ) +
  scale_color_manual(values = region_colors, breaks = c(  # Use custom region colors
    "National", "Ashanti", "Central", "Greater Accra",
    "North East", "Northern", "Savanna", "Volta"
  )) +
  scale_alpha_manual(values = c("TRUE" = 1, "FALSE" = 0.3), guide = "none") +  # Control transparency
  labs(
    title = "2020 vs 2024 Regional Voting Trends for NPP and NDC",             # Plot title
    subtitle = "Data: Electoral Commission Ghana",                             # Plot subtitle
    x = NULL,                                                                  # No x-axis title
    y = "Percentage",                                                          # Y-axis title
    color = "Region"                                                           # Legend title
  ) +
  theme_minimal(base_size = 20) +                                              # Minimal theme with adjustments
  theme(
    axis.text.x = element_text(size = 20, face = "bold", color = "black"),
    axis.text.y = element_text(size = 20, color = "black"),
    plot.title = element_text(face = "bold", size = 35, hjust = 0.5, color = "black"),
    plot.subtitle = element_text(size = 26, hjust = 0.5, color = "gray20"),
    legend.text = element_text(size = 19, color = "grey10"),
    legend.title = element_text(size = 21, face = "bold", color = "grey10"),
    legend.position = "right",
    panel.grid = element_blank(),  # Remove gridlines
    panel.background = element_rect(fill = "beige", color = NA),              # Beige background for panel
    plot.background = element_rect(fill = "beige", color = NA),               # Beige background for plot
    plot.margin = margin(20, 20, 80, 20)                                      # Add plot margins
  )

# Add annotation outside the plot area
annotation <- grobTree(
  textGrob(
    "The 2024 data excludes results from 9 constituencies that were unavailable at the time of reporting.\nChart by Michael Appiah Adjei @slydosted",
    x = unit(0.95, "npc"), 
    y = unit(0.02, "npc"), 
    just = "right",
    gp = gpar(col = "grey30", fontsize = 18)
  )
)

# Draw the annotation
grid.draw(annotation)
