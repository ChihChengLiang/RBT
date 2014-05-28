

testModules=list(
  "Module1"=list(
    "checkName"=c("Nguyen, Andrew", "Name is incorrect",3,1),
    "check score"=c(74.76, "score is incorrect",3,5)
  )
  )
test_one_case=function(x,testModule,testName ){
  case=testModules[[testModule]][[testName]]
  if (!is.na(case[3])){
    x=x[as.integer(case[3]),as.integer(case[4])]
  }
  condition=(x==case[1])
  if (condition){
    return(c(condition,"好棒棒！"))
  }else{
    return(c(condition,case[2]))
  }
}
test_one_module=function(x,module){
  cases=testModules[[module]]
  N=length(cases)
  for (i in 1:N){
    result=test_one_case(x,module,names(cases[i])[1])
    if(result[1]==FALSE){
      return(paste("通過",i-1,"個測試",result[2],sep=""))
    }
  }
  return(paste("通過",N,"個測試，好棒棒！"))
}
print("測試器載入成功，請繼續往下前進")