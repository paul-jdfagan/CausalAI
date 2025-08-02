
# install siMMMulator 
remotes::install_github(
  repo = "facebookexperimental/siMMMulator"
)

library(siMMMulator)

my_variables <- step_0_define_basic_parameters(years = 2,
                                               channels_impressions = c("Facebook", "TV"),
                                               channels_clicks = c("Search"),
                                               frequency_of_campaigns = 1,
                                               true_cvr = c(0.001, 0.002, 0.003),
                                               revenue_per_conv = 50, 
                                               start_date = "2022/1/1"
)

df_baseline <- step_1_create_baseline(
  my_variables = my_variables,        
  base_p = 10000,
  trend_p = 0.5,
  temp_var = 2,
  temp_coef_mean = 100,
  temp_coef_sd = 500,
  error_std = 100)

df_ads_step2 <- step_2_ads_spend(
  my_variables = my_variables,  
  campaign_spend_mean = 329000,
  campaign_spend_std = 100000,
  max_min_proportion_on_each_channel <- c(0.45, 0.55, # for first channel, Facebook
                                          0.1, 0.15)  # for second channel, TV.                                                         )
)
# The third channel, Search, will receive what is left. 

df_ads_step3 <- step_3_generate_media(
  my_variables = my_variables,
  df_ads_step2 = df_ads_step2,
  true_cpm = c(2, 20, NA),
  true_cpc = c(NA, NA, 0.25),
  mean_noisy_cpm_cpc = c(1, 0.05, 0.01),
  std_noisy_cpm_cpc = c(0.01, 0.15, 0.01)
)

df_ads_step4 <- step_4_generate_cvr(
  my_variables = my_variables,
  df_ads_step3 = df_ads_step3,
  mean_noisy_cvr = c(0, 0.0001, 0.0002), 
  std_noisy_cvr = c(0.001, 0.002, 0.003)
)

df_ads_step5a_before_mmm <- step_5a_pivot_to_mmm_format(my_variables = my_variables,
                                                        df_ads_step4 = df_ads_step4)

df_ads_step5b <- step_5b_decay(
  my_variables = my_variables,
  df_ads_step5a_before_mmm = df_ads_step5a_before_mmm,
  true_lambda_decay = c(0.1, 0.2, 0.3)
)

df_ads_step5c <- step_5c_diminishing_returns(
  my_variables = my_variables,
  df_ads_step5b = df_ads_step5b,
  alpha_saturation = c(2, 2, 2),
  gamma_saturation = c(0.1, 0.2, 0.3)
)

df_ads_step6 <- step_6_calculating_conversions(
  my_variables = my_variables,
  df_ads_step5c = df_ads_step5c
)

df_ads_step7 <- step_7_expanded_df(
  my_variables = my_variables,
  df_ads_step6 = df_ads_step6,
  df_baseline = df_baseline
)
?step_8_calculate_roi
step_8_calculate_roi( 
  my_variables = my_variables,
  df_ads_step7 = df_ads_step7
)

list_of_df_final <- step_9_final_df(
  my_variables = my_variables,
  df_ads_step7 = df_ads_step7
)

optional_step_1.5_plot_baseline_sales(df_baseline = df_baseline)

optional_step_2.5_plot_ad_spend(df_ads_step2 = df_ads_step2)

optional_step_9.5_plot_final_df(df_final = list_of_df_final[[1]]) # for daily data
optional_step_9.5_plot_final_df(df_final = list_of_df_final[[2]]) # for monthly data

# Access the daily-level data frame from the list
daily_df <- list_of_df_final[[1]]  # Assuming the daily-level data frame is the first element in the list

# Specify the path to save the CSV file
output_path <- "masters_daily_level_dataset_rev50.csv"

# Write the data frame to a CSV file
write.csv(daily_df, file = output_path, row.names = FALSE)

# Optionally, print the path to confirm
cat("CSV file has been saved to:", output_path)

# For the simulator's "ground truth"
# Calculate ground truth for Facebook
true_facebook_effect = sum(df_ads_step7$conv_Facebook)
true_facebook_cost = sum(df_ads_step7$spend_Facebook)
true_facebook_conversions_per_dollar = true_facebook_effect / true_facebook_cost
true_facebook_revenue_per_dollar = true_facebook_conversions_per_dollar * 50
true_facebook_roi = (true_facebook_revenue_per_dollar - 1) / 1

# Calculate ground truth for Search
true_search_effect = sum(df_ads_step7$conv_Search)
true_search_cost = sum(df_ads_step7$spend_Search)
true_search_conversions_per_dollar = true_search_effect / true_search_cost
true_search_revenue_per_dollar = true_search_conversions_per_dollar * 50
true_search_roi = (true_search_revenue_per_dollar - 1) / 1

# Calculate ground truth for TV
true_tv_effect = sum(df_ads_step7$conv_TV)
true_tv_cost = sum(df_ads_step7$spend_TV)
true_tv_conversions_per_dollar = true_tv_effect / true_tv_cost
true_tv_revenue_per_dollar = true_tv_conversions_per_dollar * 50
true_tv_roi = (true_tv_revenue_per_dollar - 1) / 1


true_facebook_revenue_per_dollar
true_search_conversions_per_dollar
true_tv_revenue_per_dollar

true_facebook_roi
true_search_roi
true_tv_roi 




var_tv <- var(df_ads_step7$conv_TV)
var_fb <- var(df_ads_step7$conv_Facebook)
var_search <- var(df_ads_step7$conv_Search)
var_total <- var(df_ads_step7$total_revenue)

icc_tv_true <- var_tv / var_total
icc_fb_true <- var_fb / var_total
icc_search_true <- var_search / var_total


icc_tv_true 
icc_fb_true
icc_search_true


anomaly_day <- as.Date("2022-06-23")
df_ads_step7[df_ads_step7$DATE == anomaly_day, c("spend_TV", "conv_TV", "spend_Facebook", "conv_Facebook", "spend_Search", "conv_Search")]


library(dplyr)

# Define the pause window
pause_start <- as.Date("2022-01-01")
pause_end   <- as.Date("2023-12-31")

# Filter for pause period
pause_period <- df_ads_step7 %>%
  filter(DATE >= pause_start & DATE <= pause_end)

# Calculate spend per channel during the pause window
total_spend_fb  <- sum(pause_period$spend_Facebook, na.rm = TRUE)
total_spend_tv  <- sum(pause_period$spend_TV, na.rm = TRUE)
total_spend_search <- sum(pause_period$spend_Search, na.rm = TRUE)

# Print results
cat("Pause Period Spend (€):\n")
cat("Facebook: ", total_spend_fb, "\n")
cat("TV: ", total_spend_tv, "\n")
cat("Search: ", total_spend_search, "\n")
