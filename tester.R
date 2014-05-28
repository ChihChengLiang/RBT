

testModules=list(
  "Module0:Test for tester"=list(
    "cases"=list(
      "checkTestNumber"=c(5566, "測試器故障，請通知維護人員")
    ),
    "completeMessage"="測試器載入成功，請繼續往下前進"
  ),
  "Module1"=list(
    "cases"=list(
      "checkName"=c("Nguyen, Andrew", "Name is incorrect",3,1),
      "check score"=c(74.76, "score is incorrect",3,5)
    ),
    "completeMessage"="原來你在一家魔法學校！"
    )
  )
test_one_case=function(x,testModule,testName ){
  case=testModules[[testModule]][["cases"]][[testName]]
  if (length(case)==4){
    x=x[as.integer(case[3]),as.integer(case[4])]
  }
  condition=(x==case[1])
  if (condition){
    return(c(condition,"好棒棒！"))
  }else{
    return(c(condition,case[2]))
  }
}
test_one_module=function(x,module, testerNumMessage=TRUE){
  cases=testModules[[module]][["cases"]]
  N=length(cases)
  for (i in 1:N){
    result=test_one_case(x,module,names(cases[i])[1])
    if(result[1]==FALSE){
      return(paste("通過",i-1,"個測試",result[2],sep=""))
    }
  }
  if (testerNumMessage){
    message=paste("通過",N,"個測試",testModules[[module]][["completeMessage"]])
  }else{
    message=testModules[[module]][["completeMessage"]]
  }
  
  return(message)
}

testNumber=5566
print(test_one_module(testNumber,"Module0:Test for tester",testerNumMessage=FALSE))