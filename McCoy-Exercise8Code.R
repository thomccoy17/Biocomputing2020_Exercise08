# Creating a table 

# Load the Data
GameData<- read.table("UWvMSU_1-22-13.txt", header=TRUE, stringsAsFactors = FALSE)

#Create Variables for Summation
UWSum<-0
MSUSum<-0

# create matrix for cumualtive sums that houses each team and the time
MAX<-matrix(0,nrow = 0,ncol = 3)

# create a for loop and if-else statement 
for(i in 1:nrow(GameData)){
  if(GameData$team[i]=="UW"){
    UWSum=UWSum+GameData$score[i]
  }else{
    MSUSum=MSUSum+GameData$score[i]
  }
  MAX<-rbind(MAX, c(GameData$time[i],UWSum,MSUSum))
}
colnames(MAX)<- c("Time","UW","MSU")

#plot the graph
plot(GameData$time,MAX[,2],type = "l", col="red")
lines(MAX[,1],MAX[,3],col="green")
# where the green line is MSU and the red line is Wisconsin

##2 Writing a game called guess my number

# generate a random number between 1-100, a variable for number of attempts, and a variable for user input
random = sample(1:100,1,replace=FALSE)
userinput<- -1
numberofattempts<- 0

## Use if else statement within a while loop to collect iterations and make responses based on user input
# we have to make sure while loop continues if the userinput does not equal the random number and the number of attempts is less than 10
while(userinput !=random && numberofattempts<10){
  userinput<-readline(prompt="Type in your guess:")
  if (userinput==random){
    print("YOOOO you WONNNNN")
    }else
      if(userinput<random){
        cat("Too low")
      } else {
        (userinput>random)
          cat("Too high")}
    if(numberofattempts==9)
      cat(". Yo you STOOOOOPID you ran out guesses homie")
 
  #number of attempts counter needed no matter what the response, so it is at the end of while loop
  numberofattempts=numberofattempts+1
}


