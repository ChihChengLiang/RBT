# R基礎指令小專案

## 學習目標
在這個過程中，您將學會如何使用R的基本操作來達成人工繁瑣的工作。

## 專案說明
在這個專案中，您是某間知名學校的職員。學校剛創立不久，同事們都很希望知道學生的表現如何。於是，您向全校的導師取得每班學生的成績單。在這個小專案中，您將完成下列事項。

- 讀取檔案
- 讀取大量檔案
- 從檔案中取得簡單的統計資訊

## 前置作業

> 如果你是在`RStudio`中以`.Rmd`格式開啟本檔案，請按`Chunks > Run Current Chunk`即可執行下列程式碼。


```r
source("tester.R")
```

```
## [1] "測試器載入成功，請繼續往下前進"
```



# 驚鴻一瞥
取得的成績單，皆以csv格式存放在`data`資料夾底下。命名的規則是「g年級c班」。例如：三年五班的成績單，檔名即是`g3c005.csv`




```r
list.files("data")  #這行指令可以列出檔案夾內的所有檔案
```

```
##   [1] "g1c001.csv" "g1c002.csv" "g1c003.csv" "g1c004.csv" "g1c005.csv"
##   [6] "g1c006.csv" "g1c007.csv" "g1c008.csv" "g1c009.csv" "g1c010.csv"
##  [11] "g1c011.csv" "g1c012.csv" "g1c013.csv" "g1c014.csv" "g1c015.csv"
##  [16] "g1c016.csv" "g1c017.csv" "g1c018.csv" "g1c019.csv" "g1c020.csv"
##  [21] "g2c001.csv" "g2c002.csv" "g2c003.csv" "g2c004.csv" "g2c005.csv"
##  [26] "g2c006.csv" "g2c007.csv" "g2c008.csv" "g2c009.csv" "g2c010.csv"
##  [31] "g2c011.csv" "g2c012.csv" "g2c013.csv" "g2c014.csv" "g2c015.csv"
##  [36] "g2c016.csv" "g2c017.csv" "g2c018.csv" "g2c019.csv" "g2c020.csv"
##  [41] "g3c001.csv" "g3c002.csv" "g3c003.csv" "g3c004.csv" "g3c005.csv"
##  [46] "g3c006.csv" "g3c007.csv" "g3c008.csv" "g3c009.csv" "g3c010.csv"
##  [51] "g3c011.csv" "g3c012.csv" "g3c013.csv" "g3c014.csv" "g3c015.csv"
##  [56] "g3c016.csv" "g3c017.csv" "g3c018.csv" "g3c019.csv" "g3c020.csv"
##  [61] "g4c001.csv" "g4c002.csv" "g4c003.csv" "g4c004.csv" "g4c005.csv"
##  [66] "g4c006.csv" "g4c007.csv" "g4c008.csv" "g4c009.csv" "g4c010.csv"
##  [71] "g4c011.csv" "g4c012.csv" "g4c013.csv" "g4c014.csv" "g4c015.csv"
##  [76] "g4c016.csv" "g4c017.csv" "g4c018.csv" "g4c019.csv" "g4c020.csv"
##  [81] "g5c001.csv" "g5c002.csv" "g5c003.csv" "g5c004.csv" "g5c005.csv"
##  [86] "g5c006.csv" "g5c007.csv" "g5c008.csv" "g5c009.csv" "g5c010.csv"
##  [91] "g5c011.csv" "g5c012.csv" "g5c013.csv" "g5c014.csv" "g5c015.csv"
##  [96] "g5c016.csv" "g5c017.csv" "g5c018.csv" "g5c019.csv" "g5c020.csv"
## [101] "g6c001.csv" "g6c002.csv" "g6c003.csv" "g6c004.csv" "g6c005.csv"
## [106] "g6c006.csv" "g6c007.csv" "g6c008.csv" "g6c009.csv" "g6c010.csv"
## [111] "g6c011.csv" "g6c012.csv" "g6c013.csv" "g6c014.csv" "g6c015.csv"
## [116] "g6c016.csv" "g6c017.csv" "g6c018.csv" "g6c019.csv" "g6c020.csv"
## [121] "g7c001.csv" "g7c002.csv" "g7c003.csv" "g7c004.csv" "g7c005.csv"
## [126] "g7c006.csv" "g7c007.csv" "g7c008.csv" "g7c009.csv" "g7c010.csv"
## [131] "g7c011.csv" "g7c012.csv" "g7c013.csv" "g7c014.csv" "g7c015.csv"
## [136] "g7c016.csv" "g7c017.csv" "g7c018.csv" "g7c019.csv" "g7c020.csv"
```


暈了，百來個檔案！您看了一看東方的魚肚白、聽一聽周遭的鳥鳴聲，心中暗道：「只有一些電腦魔法能夠拯救我」。

## 投石問路

> 接下來的進行方式，
