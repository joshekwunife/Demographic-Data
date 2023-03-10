#Analysis to show correlation between Income and Expectancy by region and Income 
#group and to gain insight through viz
# 2013 CASE STUDY
#Data source: World Bank through https://www.superdatascience.com/pages/rcourse

#STEPS:

#..........................Step 1
#Note: the datasets needed for this project are in three categories

#(a) A dataset containing "Year" and "Region"
#Importing the dataset into R
MyTask <- read.csv(file.choose())
head(MyTask) #<--------Testing

#(b) A dataset that contains the income group
Demography <- read.csv(file.choose())
head(Demography) #<--------Testing

#(c) A dataset that contains life expectancy by year but inn vector format
#Cleaning, Manipulation, and Preparing this dataset analysis
VtoD2013 <- data.frame(Code=Country_Code, L.E=Life_Expectancy_At_Birth_2013)
head(VtoD2013)#<--------Testing

#..........................Step 2
#Data manipulation and preparation: Having to merge two dataframes to form one
#object and the pass it through the third dataframe to have three dataframes
#in one object

#merging the first and second 
combo <- merge(
              MyTask, Demography, by.x="Country.Code", by.y="Country.Code"
)

#passing it into the third
Income.vs.L.E.2013 <- merge(
              combo, VtoD2013, by.x="Country.Code", by.y="Code"
)

#..........................step 3
#Visualization to gain insight on income vs life expectancy by Income Group
qplot(data=Income.vs.L.E.2013, x=Income.Group,  y=L.E, 
      color=Income.Group, alpha=I(0.6),
      main="Chart 1: Income vs Life Expectancy 2013 by Income Group", size=I(2)
)

#Narrowing the Visualization down so as to gain insight on Income vs Life 
#Expectancy by Region
qplot(
  data=Income.vs.L.E.2013, x=Income.Group,  y=L.E, color=Region,
  alpha=I(0.6), main="Chart 2: Income vs Life Expectancy 2013", size=I(2)
)

#Insights from Chart 1:
  #(a) The life expectancy for low income earners is relatively lower
      #than that of high income earners. Although correlation does not
      #equal causation. However, there's a clear trend from the visualization
      #that suggests the higher the income, the higher the life expectancy.

  #(b) Although the life expectancy of Lower-middle-income earners are higher
      #if compared to low income earners. However, most of the populace are still
      #within same life expectancy bracket with low income earners Africa ranks  
      #as the Region

#Insights from Chart 2: This Visualization gives a deeper view to Chart 1
  #(a) The African populace as at 2013 ranks the most in the low income earners
  #(b) The trend is clearly visible to see low income earners have low life
      #expectancy. 
  #(c) Not forgetting that correlation does not equal causation. A few percentage
      #of the African populace spread across other income groups(e.g: High income,
    #Upper-middle-income, and lower-middle income), of which a look
    #into the chart shows that there wasn't improvement in their life expectancy
    #when compared to the life expectancy of low income earners.
    #This further shows that although income earned could play a role in life's
    #expectancy, but there could be more other factors to why some regions could 
    #have lower life expectancy.

#Recommendation:
#With life expectancy being the focus, I recommend that while making efforts
# to improve earnings for those in relatively  lower income groups other 
# factors such as good health care centers, health literacy and awareness campaign,
#to mention a few should be encouraged across all regions with lower life expectancy





pro



