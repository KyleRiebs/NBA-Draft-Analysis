#Creates a lm plot of inputted variable from inputed data set against win shares 
#Sets x and y labels, title, and displays p-value in top right corner if it is sig

#Var = x var for lm, df = data frame, xlab = label for x axis, t = graph title
lm_plot <- function(var, df, xlab, t){
  #Create LM
  curr_lm <- lm(win_shares ~ var, data = df)
  
  #If p-val is < .05, print graph with p-val and coefficient
  if (summary(curr_lm)$coefficients[2,4] < .05){
    #Find what values to place p-val on
    xval <- max(var) - ((max(var) - min(var)) / 7.5)
    yval <- max(df$win_shares) - ((max(df$win_shares) - min(df$win_shares)) / 7.5)
    
    #Print graph with p-val and coeff
    ggplot(df, aes(x = var, y = win_shares, )) + geom_point() +
      stat_smooth(formula = y ~ x, method = "lm") +
      geom_text(color = "red", size = 3.4,
                label = paste("p-val = ", round(summary(curr_lm)$coefficients[2,4], 3)), x = xval, y = yval) +
      geom_text(color = "red", size = 3.4,
                label = paste("coeff = ", round(summary(curr_lm)$coefficients[2,1], 1)), x = xval, y = yval - ((max(df$win_shares) - min(df$win_shares)) / 8)) +
      labs(x = xlab, y = "Win Share Total", title = t)
  }else{
    #Else, just print graph with no text
    ggplot(df, aes(x = var, y = win_shares, )) + geom_point() +
      stat_smooth(formula = y ~ x, method = "lm") + labs(x = xlab, y = "Win Share Total", title = t)
  }
  
  
}
