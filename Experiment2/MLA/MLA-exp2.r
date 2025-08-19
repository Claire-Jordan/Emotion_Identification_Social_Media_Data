library(brms)

df <- read.csv("C:/Users/clair/Documents/Master/Thesis/Data/mla_study_data_exp2.csv")
str(df)




fit <- brm(
  success ~ LEIA_shown + (1 | user_id) + (1 | text_id),
  data = df,
  family = bernoulli(),
  cores = 4
)

# View summary (optional)
summary(fit)


posterior_draws <- as_draws_df(fit)
write.csv(posterior_draws, "C:/Users/clair/Documents/Master/Thesis/Data/posterior_draws_exp2.csv", row.names = FALSE)
# 1. Ensure 'emotion' is a factor
df$emotion <- as.factor(df$emotion)

# 2. Set "Happiness" as the reference level
df$emotion <- relevel(df$emotion, ref = "Happiness")

fit <- brm(
  success ~ LEIA_shown  * emotion + (1 | user_id) + (1 | text_id),
  data = df,
  family = bernoulli(),  cores = 4


)
summary(fit)

posterior_draws <- as_draws_df(fit)
write.csv(posterior_draws, "C:/Users/clair/Documents/Master/Thesis/Data/posterior_draws_emotion_exp2.csv", row.names = FALSE)
