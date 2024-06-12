#2024-06-13 復興崗文字探勘工作坊
##倪世傑 政治大學政治學系 博士級研究人員
###georgenee0502@gmail.com

#Episode01 設定 Basic Settings

## 0 Introduction

我們需要下載三種軟體。本次課程以R語言操作，R是一種程式語言，
由統計學者Ross Ihaka & Robert Gentleman開發。
Rstudio是一種專門給R語言應用的整合開發環境（Integrated Development Environment,IDE）。
我們在Rstudio進行R語言的運行。
Rstudio同時也有網路版本，Posit Cloud，利用gmail、Apple ID可以使用免費版本。
Sublime Text是一種代碼編輯器，coder通常利用這一類編輯器撰寫code。

0_1下載位置

#R 
## R for Mac https://cran.r-project.org/bin/macosx/ (注意：區分處理器M版本與老的Intel版本)
## R for Windows https://cran.r-project.org/bin/windows/base/

#Rstudio
##Rstudio download for Mac     https://posit.co/download/rstudio-desktop/
##Rstudio download for Windows https://posit.co/download/rstudio-desktop/

#sublime text 4
#https://www.sublimetext.com/download
##需要注意的是，Mac、Windows、Linux系統要下載不同的版本。
##現在比較流行的是開源代碼編輯器是VS Code
VS Code(Visual Studio Code)https://code.visualstudio.com/.



## 1_1 設定路徑：你的工作區在哪裡？ setting yr working directory.

需要事先在Rstudio中設定工作路徑。
但在設定之前，我們先在「文件」（Documents）中設立一個資料夾，我是預設為一個叫做AIHS的資料夾，
我們之後所有需要用的檔案，都會在這個資料夾儲存與輸出。
資料夾絕對不要設定在「桌面」或「下載項目」，請設定在「文件」。



setwd("")
setwd("C:/Users/georgenee/Documents/AIHS/AIHS")

#setting via control table
#Rstudio>Session>Set Working Directory>Choose Directory

#getting yr working directory.
getwd()
##[1] "/Users/georgenee/Documents/AIHS/AIHS"


# 1_2 設定使用語言 human language use in your data

# for Microsoft WindowsOS
 #English
 Sys.setlocale(category = "LC_ALL", locale = "English")
 #繁體中文
 Sys.setlocale(category = "LC_ALL", locale = "zh_TW.UTF-8")
 #簡體中文
 Sys.setlocale(category = "LC_ALL", locale = "zh_CN.UTF-8")

 
 
# for MacOS
 #English
 Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")
 #繁體中文
 Sys.setlocale(category = "LC_ALL", locale = "zh_TW.UTF-8") #避免中文亂碼
 #簡體中文
 Sys.setlocale(category = "LC_ALL", locale = "zh_CN.UTF-8")

#查看R當中的語系 Make sure which human language is employing in this R project.
Sys.getlocale()

[1] "zh_TW.UTF-8/zh_TW.UTF-8/zh_TW.UTF-8/C/zh_TW.UTF-8/zh_TW.UTF-8"


#1_3 查看R當中的語系分佈 Sorting the distribution of human languages use in R & expressions.
#R是程式語言，R Package是各種功能包。
install.packages("stringr")#安裝 stringr 功能包
library(stringr) # 應用 stringr 功能包
locales <- system("locale -a", intern = TRUE)
unique(str_split_fixed(locales, "\\.", 2)[, 1])

 [1] "en_NZ" "nl_NL" "pt_BR" "fr_CH" "eu_ES" "en_US" "af_ZA" "bg_BG" "cs_CZ" "fi_FI" "zh_CN"
[12] "sk_SK" "nl_BE" "fr_BE" "de_CH" "de_DE" "am_ET" "zh_HK" "be_BY" "uk_UA" "pt_PT" "en_AU"
[23] "kk_KZ" "de_AT" "hr_HR" "fr_FR" "ro_RO" "da_DK" "ca_ES" "sv_SE" "fr_CA" "it_CH" "hu_HU"
[34] "et_EE" "he_IL" "ko_KR" "it_IT" "ru_RU" "zh_TW" "no_NO" "en_CA" "sl_SI" "pl_PL" "ja_JP"
[45] "sr_YU" "en_GB" "is_IS" "hy_AM" "es_ES" "el_GR" "lt_LT" "tr_TR" "en_IE" "hi_IN" "C"    
[56] "POSIX"

# (左邊，我們需要通過R語言計算後的值，
#該值僅存在於R當中，設想為暫存值) <- (右邊，程式語言）
#「井號」為註解符號，幫助自己與其他使用者了解程式語言的目的。

#在R環境中儲存檔案：
save.image("XXX.RData")
說明：
.RData 是 R 語言中常見的檔案副檔名，它代表的是 R 的工作環境 (workspace) 檔案。
當我們在 R 中工作時，會在記憶體中建立各種物件，例如變數、資料框架、函數等。
這些物件組成了當前的工作環境。如果想要保存這個工作環境以便日後使用，
可以使用 save.image() 函數將其儲存到一個 .RData 檔案中
當我們下次啟動 R 時，只要將 .RData 檔案放在工作目錄中，R 就會自動讀取並恢復上次的工作環境。
這樣可以節省大量的時間和精力，尤其是在處理大型資料集時。



#Episode02 處理手邊已有的資料 loading資料

#2_1 Loading EXCEL
library(readxl)#讀取Excel類型檔案的功能包
install.packages("readxl")

# 讀取 Excel 檔案的「1st_sheet」; loading "1st_sheet" from the document.
test01 <- read_excel("test01.xlsx", 
  col_names = TRUE, sheet = "1st_sheet")
View(Test01)


# 讀取 Excel 檔案的「2nd_sheet」;loading "2nd_sheet" from the document.
test02 <- read_excel("test01.xlsx", 
  col_names = TRUE, sheet = "2nd_sheet")
View(Test02)

#也可以用 Environment-import-From Excel (SPSS, SAS, Stata)處理


#2_2 Loading .csv format file.
library(readr)
test03 <- read_csv("test03.csv")
View(test03)


#2_3 Loading .txt format file
textRR <- read.table('textRR.txt',sep = '\t',header = FALSE).
View(textRR)




#2_4 Loading from the Web
url <- "https://www.tahr.org.tw/sites/default/files/u126/ni_shi_jie_quan_min_ji_ben_shou_ru_xi_wang_huan_shi_huan_ying_.pdf"
  #find out the page for download
destfile <- "myfile.pdf" # write in the file name.
download.file(url, destfile, mode="wb") 




##Episode03 資料結構 Data Structure

#3_1 資料/類型的類型 
#integer：as integer 整數. Ex: year 年, pages 頁數, Paragraphs 段落....
#numeric: numbers with with decimal point. Length, weights, scores....
#character, string 字串。
#factor: categorical variables.類別變項
#date: as date 時間格式
# a little bit complex to handle & we'll discuss the issue later on.

#3_1_1 數值型資料 numeric data
a<-5
a

a<-5-6+7
a


#3_1_2 整數型數值型資料 integer data

a<-5
str(a)
a

is.integer(a) #a是整數型資料嗎？Is a an integer variable?
a<-as.integer(a) 將a設置為整數型資料 setting a as integer variable

#3_1_3 logical型資料：True or False?  Logical Data: True or False

#3_1_4 類別資料 categorical/factor data
#在logistic regression時，設為0(女)，1（男）0=dummy.
a<-as.factor(a)
is.factor(a)


#字串型資料 character
a<-as.character(a)
is.character(a)

#3_2 創造資料 creating data
#3_2_1 數值型資料處理
a<-5
b<-4
c<-a+b
c

#3_2_2 創造矢量型資料 creating vector data
#function c() used to combine multiple elements into a vector

a <- c(167,199,212,193,175, 180)           # 建立一個number vector
b <- c("陳一","王二","張三","趙四","廖五","孫六")  # 建立一個character vector
c <- c("左外野手","中外野手","右外野手","游擊手","三壘手")

a
b
c

#建立dataframe，列聯表是我們進行分析的基礎。
#column name 以英文顯示，比較便捷，用中文比較麻煩。

df <- data.frame(
  heighht  = c(167, 199, 212, 193, 175, 180, 172),
  name     = c("陳一","王二","張三","趙四","廖五","孫六","洪七"),
  position = c("左外野手","中外野手","右外野手","游擊手","三壘手","二壘手","一壘手"),
  edu      = c("二專","高中","大學","碩士","碩士","大學","高中"),
birth_place= c("新北市新莊區","台北市士林區","新北市五股區","雲林縣四湖鄉","嘉義市東區","桃園市大溪區","新竹市"),
birth_day  = c("2002-12-23","1998-07-02","2001-02-27","1999-03-23","1997-10-05", "1979-08-28","1999-12-23"),     
     gender= c("男","女","男","女","男","男","女")
)

head(df, n=3)#檢視前三筆資料
View(df) #檢視全部的資料

##3_2_3 儲存
df是在R當中的操作檔，是在R當中的資料格式，我們往往需要輸出這些以操作檔。

#export as .csv file. 我們通常會選擇儲存為.csv格式，資料不會亂。
#製作好data frame之後可以輸出為.csv檔案
##如果在Global Setting 或是 資料在編碼時以UTF-8儲存，fileEncoding = "UTF-8"可省略。
##在R系統工作中統一以utf-8格式存取文字資料，因為我們很多的功能包只接受utf-8格式。
#row.names的好處，能夠清楚辨別順序號數以進行資料編修。

write.csv(df, "AA棒球隊.csv", fileEncoding = "UTF-8", row.names = TRUE)
write.csv(df, "AA棒球隊_A.csv", fileEncoding = "UTF-8", row.names = FALSE)

#export as .xlsx file (Excel)格式
install.packages("writexl")
library(writexl)
write_xlsx(df, "AA棒球隊.xlsx")

##3_2_4 替換
#替換, cell value
df[4, "position"]<-"教練"

#更改 column name
colnames(檔名)[第幾個column]

# test 更改第一個column的名稱為 "height"


##3_2_5 column的性質

#檢查df的變項性質 examing variable's arribution
# class()
class(df$height)
class(df$name)
class(df$gender)

#進入data frame之後，所有的變項都以character處理。
#需要重新賦予變項該有的屬性。

df$gender<-as.factor(df$gender)
df$birth_day<-as.Date(df$birth_day)
class(df$birth_day)

#column的性質
數值型（numeric）              as.numeric() 
字串型（string, character）    as.character()
類別型（categorical, logical） as.category()
日期型（date）                 as.Date()


#3_3 取出資料
#3_3_1 取出data frame框格內的資料 
# 取出 row 4, column 2 的 cell。
df[4,2]
#取出第1,3 column 
df[,c(1,3)]
#取出第2,3,4 row
df[c(2:4),]
#取出 孫六 相關的資料，但是我忘記孫六在哪裡了。
df[df$name == "孫六"]
##data.frame 格式，比較吃記憶體，如果資料規模大，可以考慮採用data.table格式

##工作到一個段落，需要存檔。
#儲存為.csv

#儲存為.RData


#Episode04 字串 string

#4_1_1 合併兩筆資料(rows)

df2 <- data.frame(name=c("宋八","吳九","林十","廖十一","簡十二","馬十三"),
     lenghth=c(167,199,212,193,175, 180),
     position=c("游擊手","投手","投手","投手","替補","隊經理"),
     birth_day=c("2004-07-23","1999-01-02","1999-12-02","2003-09-06","2004-05-12","2004-06-28"),
     edu=c("大學","大學","高中","小學","碩士","大學"),
     gender= c("男","女","男","女","男","女"),
     birth_place= c("高雄市燕巢區","澎湖縣馬公市","苗栗縣通霄鄉","雲林縣虎尾鎮","台北市信義區","桃園市龍潭區")
     )


df3<-rbind(df,df2)


attributes(df)
attributes(df2)
ncol(df) #number of column
nrow(df) #number of row
ncol(df2)
nrow(df2)

colnames(df)[1]<-"height"
colnames(df2)[2]<-"height"


#重新排列column

df<-df[c("name","height","position","birth_day","edu","gender","birth_place")]
df3<-rbind(df,df2) #合併兩筆資料。

#建立一個新的column "nationality"
df3$nationality<-"ROC"

#建立一個序號的column
df3$serial<-seq.int(nrow(df3))

#4_1_2 合併兩筆資料(columns)
##先抽取最後兩個column
ncol(df3)
df3_1<-df3[,c(8,9)]
#合併兩組資料（）
df3<-rbind(df3_1, df3)

df33<-df3[,-c(1,10,11)]#砍掉第1,10,11個column
df34<-df3[-c(1,10,11),]#砍掉第1,10,11個row

df3<-df33


#4_1_3 排序
#order (R base)
#根據出生時間順序「排序」 Re-ordering by birth date
df35<-df3[order(df3$birth_day),]

#根據身高 [高低] 順序「排序」 Re-ordering by length
#rev() == reversed 
df36<-df3[order(df3$height),]
head(df36, n=3)
df37<-df3[rev(order(df3$height)),]
head(df37, n=3)


#4_2 字串整理
#4_2_1搜索 「某範圍內」的因素 
#return rows with column values in certain range 
#身高在200公分以下，195公分以上

#filter() 過濾功能
#filter(), (dplyr package)
install.packages("dplyr")
length200195<- filter(df3, height >= 195 & height <=200)
#另一種寫法，利用pipe %>%
install.packages("dplyr")
library(dplyr)
length200195<- df3 %>% filter(length >= 195 & length <=200)
rm(length200195) #rm=remove

#在進一步給定的條件下進行篩選
#在sub中誰的身高超過180?
lengthsub195<-filter(df3, position=="投手",length > 195)
lengthsub195<- df3 %>% filter(position=="投手", length > 195)
rm(lengthsub195)

#計算字數
nchar(df3$name)
nchar(df3$birth)


#4_2_2 抽取具有特定元素的資料


#extract rows 1,4,5
df3_row<-df3[c(1,4:5),]
View(df3_row)


#extract columns 2,3,4
df3_col<-test05[,c(2:4)]
View(df3_col)


#「高中」學歷的有誰？
#grep(), grepl(), (R base)
hschool<-df3[grep("高中", df3$edu),]
View(hschool)
rm(hschool)
#！grepl()
#扣除高中學歷？
abovehschool<-df3[!grepl("高中", df3$edu),]
abovehschool<-df3[-grep("高中", df3$edu),]
rm(abovehschool, hschool)

#4_2_3 置換
#gsub(), (R base)
#廖十一說他其實叫「張廖十一」
#df3$name<-gsub("欲取代的對象","更改後的名稱", df5$name
df3$name<-gsub("廖十一","張廖十一", df3$name)


#4_2_4 分割與結合字串

#我需要知道隊職員的出生年份
＃str_sub(), (R Package stringr)
#tutorial https://stringr.tidyverse.org/.
install.packages("stringr")
library(stringr)
#擷取生日中的年，擷取後放在新的column "year"
df3$year<-str_sub(df5$birth, start = 1, end = 4)

#擷取姓氏
df3$surname<-str_sub(df3$name, start = 1, end = 1)

#擷取「名」
df3$first_name<-str_sub(df3$name, start = 2, end = 3)

#擷取「縣市」
df3$county<-str_sub(df3$birth_place, start = 1, end = 3)

#擷取「次級行政區域」
df5$sub_c<-str_sub(df5$birth_place, start = 4, end = 6)

#再次結合行政區
#paste(),(R base)
df3$N_BP<-paste(df3$county, df3$sub_c,  sep="-") #sep="separation"


#4_2_5 抽取特定詞彙、符號前後的資料
#extract before pattern 抽取某特定字元（或符號）之前的字元
#sub() 也是「取代」的功能

df3$try01<-sub("市.*", "", df3$county)
#抽取在column N_county 中，出現在台灣之前的詞彙（符號、字元皆可）
#並給予一個新的column, which name is "try01"
#抽取出來的詞彙之後，你可以在其後加上所需要的詞彙。
df3$try01<-sub("台灣.*", "DFG", df3$N_county)

#extract after pattern 抽取某特定字元（或符號）之前的字元
df3$try02<-sub(".*北", "", df3$county)
#抽取在column N_county 中，出現在台灣之後的字（符號、字元皆可）
#並給予一個新的column, whisn name is "try02"



#4_2_6 計算
#計算出現的個數
#levels() levels()函數將返回該因子的所有級別名稱
#居住區域
levels(df3$county)

#需要將df3$county設定為as.factor()

#levels()測量的條件必須是factor。
df3$county<-as.factor(df3$county)


#計算每個球員名字的數目
#str_count()
str_count(df3$name)

#計算身高，總數與平均值
sum(df3$height)
mean(df3$height)
x<-mean(df5$length)
x

#round()四捨五入
round(mean(df3$height),digits= 2) #四捨五入到小數點後兩位數


#哪一個位置的平均身高最高？
#aggregate()
aggregate(df3$height, by=list(df3$position), FUN=mean)
aggregate(df3$height, by=list(df3$gender), FUN=sum)
aggregate(df3$height, by=list(df3$gender), FUN=mean)
aggregate(df3$height, by=list(df3$gender, df3$position), FUN=mean)


#處理遺漏值na

#創造一個有NA的column

weight<-list(weight=c("89.98","84.34","74.45","76.09","69.98","72.34",NA,"98.89","72.87","71.34","91.23","81.12","65.87"))
df3<-cbind(df3, weight)
is.na(df3)  #返回缺失值
is.na(df3$weight)

which(is.na(df3))  #返回所有缺失值的位置
is.na(df3$name)  #返回在column "name"中的缺失值位置

# 如果有 NA，刪除。

#一些函式計算時擁有na.rm=TRUE，可以在計算以前移除遺漏值並使用剩餘值進行計算
df3[is.na(df3$weight),"weight"] <- mean(df3$weight,na.rm = TRUE) 
#用平均數補充weight的缺失值, ns.rm=TRUE 移除遺漏值

View(df3)


#4_3 創造新變項
#2001-01-01以前出生者為"20世紀人"，之後為"21世紀人"
#ifelse 條件式

df3$n_age <- ifelse(df3$birth_day > "2001-01-01",
c("21世紀人"), c("20世紀人"))

#地域分區 
#recode(), (dplyr package)
library(dplyr)

x<-df3$county
df3$N_county<-recode(x, "台北市" = "北台灣", "新北市" = "北台灣", "桃園市" = "北台灣", "新竹市" = "北台灣","苗栗縣" = "北台灣",
"雲林縣"="南台灣", "嘉義市"="南台灣", "澎湖縣"="南台灣", "高雄市"="南台灣")

df3$N_county<-as.factor(df3$N_county)
levels(df3$N_county)

#[複習]
#哪一個區域的平均身高較高？
#aggregate()
aggregate(df3$height, by=list(df3$N_county), FUN=mean)

#[複習]
#地區別的天龍地虎是誰？(條件式搜索、集群、創造新變項)

df3$newcol[df3$N_county == "北台灣" & df3$height >= 187] <- "北台灣天龍"
df3$newcol[df3$N_county == "北台灣" & df3$height < 187]  <- "北台灣地虎"
df3$newcol[df3$N_county == "南台灣" & df3$height >= 187] <- "南台灣天龍"
df3$newcol[df3$N_county == "南台灣" & df3$height < 187]  <- "南台灣地虎"

df3$newcol<-as.factor(df3$newcol)
summary(df3$newcol)


#4_4 比率計算
#prop.table (R base)
able <- table(df3$newcol)
able_df <- data.frame(able)
prop.table(table(df3$newcol))
able_prop <- prop.table(table(df3$newcol))
able_df$prop <- able_prop
able_df$percent <- paste0(round(able_prop*100,digits=2),"%") #





#Episode05 On Dataset 資料庫設置相關

#5.1 將一個資料夾內的檔案結合成一個 .csv檔 Loading a FOLDER
#結合一個folder內所有的.txt files
#merge all .txt documents into a folder.

install.packages("readtext")
library(readtext)
sb<-readtext("/users/georgenee/Documents/FXG/testtt/*txt")
View(sb)

#5.2 拆解data frame類型的檔案為個別的 .txt檔
#分離一個data frame內的.txt files
#split one merged file into multiple docs. 

sb$ID<-seq.int(nrow(sb)) #建立順序編號, create serial numbers as ID.
temp011 <- split(sb$text, sb$ID)
        # "sequence.integer"的縮寫
         #擷取內容與順序編號，順序編號一定要在後面，
          #這樣才能通過新的檔名將先前sb內各文件的先後次序取得一致。
Map(function(x, y) writeLines(x, paste0(y, '.txt')), temp011, names(temp011))

View(temp011)

#5_3 利用格式統一的 .txt檔案 建立 data frame.
#將檔案內容劃歸為獨立的column
##抽取在一個folder中的.txt第一行。可以幫助建立title欄目。
#工作項目folder: testtt, 裡面有3個檔案：textA, textB, textC
#必須注意的是，這一行的字元「不能有」空白
setwd("/users/georgenee/Documents/FXG/testtt")  
con <- file("textA.txt","r")
first_line <- readLines(con,n=1)
close(con)
cat(first_line,file="first_line.txt")

#擷取文件內的項目，使之成為data.frame
direc <- setwd("/Users/georgenee/Documents/FXG/testtt")  
files <- list.files("/Users/georgenee/Documents/FXG/testtt")
View(files)
num_files <- length(files)
View(num_files)
line <- list()
for (i in 1:num_files) {
  line <- list(line, read.table(files[[i]], header = F, nrow = 4))#只取1-4行,4個變項
}
print(line)
df4 <- data.frame(matrix(unlist(line), ncol = 4, byrow = T))#因為取4個變項，所以給予4個column
View(df4)

#給予data.frame 上的column name
colnames(df4)[1]<-"title"
colnames(df4)[2]<-"date"
colnames(df4)[3]<-"content"
colnames(df4)[4]<-"occasion"
View(df4)

class(df4$title)
class(df4$date)
class(df4$content)
class(df4$occasion)

#轉化date為時間格式
df4$date<-as.Date(df4$date)
class(df4$date)

#給予順序編號
df4$ID<-seq.int(nrow(df4))

#將ID的 column放在第一個 column
df4<-df4[c("ID", "title", "date", "content", "occasion")]
View(df)


#Episode06 Time Format
##week format
install.packages("ISOweek")
library(ISOweek)
install.packages("lubridate")
library(lubridate)

#使用檔案：test08.csv

#ISOweek sets Monday as the 1st day of the week.

#運行lubridate package 分別取得取得week & year 格式
#acquire "week"
test08$isoweek <-  lubridate::isoweek(test08$pub_date)
#指定套件的函數::指定套件的函數，直接運行的意思。
class(test08$isoweek)
#"numeric"

##acquire "year"
test08$isoyear <- lubridate::isoyear(test08$pub_date)
class(test08$isoyear)
#"numeric"


#運行ISOweek package 取得yyyy-week 格式

x<-test08$pub_date
xx<-data.frame(date = x, week = ISOweek(x))
View(xx)
class(xx$week)
#[1] "character"
test08$ISOYW<-xx$week

#Package "tsibble", easy to learn!
install.packages("tsibble")
library(tsibble)
##year-week
yearweek(test08$pub_date)
test08$tsibleYW<-yearweek(test08$pub_date)
class(test08$tsibleYW)
View(test08)
##year-month
test08$tsibbleYM<-yearmonth(test08$pub_date)
class(test08$tsibbleYM)
##year=quarter
test08$tsibbleYQ<-yearmonth(test08$pub_date)
class(test08$tsibbleYQ)

Episode07 分詞

#7_1Parsing 分詞
#parse column "abstract_01" in test08
#user's own dictionary and stopwords list are needed
#now we have two sets of simple user's dictionaries.
#users="AIMH_user.txt", stopwords="AIMH_STP.txt"
#NOTICE! save these dictionary-related files in jiebaRD.
  ##directory:"/Library/Frameworks/R.framework/Versions/3.6/Resources/library/jiebaRD/dict"

#R packages required for parsing: jiebaR, jiebaRD, tm, NLP

library(jiebaRD)
library(jiebaR)
library(NLP)
library(tm)
setwd("/Users/georgenee/Documents/FXG")
cutter <- worker(type="mix",stop_word = "AIMH_STP.txt", user = "AIMH_user.txt")
#cutter==分詞 worker ==分詞器, 為作者自定義辭典。
View(test08)


test08$text<-paste(test08$abstract_01,"uuu")
    #在每個摘要後面貼上"uuu"，最為之後分割的記號。
contentX8<-as.character(test08$text)
segtextX8 <- segment(contentX8, cutter)#進行分詞
segtextpasteX8 <- paste(segtextX8, collapse = " ")
setwd("/users/georgenee/Documents/AIHS/AIHS")#轉回原先的工作目錄
write(segtextpasteX8,"X8JP.txt")

#利用sublime text4 開啟X8JP.txt，開啟後用分行符號\n 取代uuu。
#在第一行鍵入"newc"，這是作為分詞後的column's name。
#sublime text3➡File➡save with encoding➡utf-8"
X8TTT <- read.table('X8JP.txt',sep = '\t',header = TRUE)#另存新檔
nrow(X8TTT)
nrow(test08)#兩者數目必須一致
View(test08)
test08<-cbind(test08, X8TTT)#將分詞後的結果與原先的檔案通過cbind函數貼在一起



#7_2 Frequency 統計詞頻
##之後採用R Package "quanteda"進行各項操作
##分詞之後的稱為token 單詞。單詞與字不同。
#計算詞頻

library(quanteda)
library(quanteda.textstats)
library(data.table)
toks <- tokens(test08$new_seg, what = "fastestword") 
                                  #"fastestword"表示完全不更動分詞結果
dfmat_test08<- dfm(toks)#dfm=document feature matrix。
                        ##表示在這個矩陣中，每一個文件的單詞(token=feature)的分布狀態
View(dfmat_test08)
Freq_test08 <- as.data.table(textstat_frequency(dfmat_test08))
View(Freq_test08)

Freq_test08 <- Freq_test08[nchar(Freq_test08$feature ) > 1, ]#將切割出來只有一個字的都先刪除
View(Freq_test08)
nrow(Freq_test08)
Freq_test08_2 <- Freq_test08[(Freq_test08$frequency ) > 3, ] 
View(Freq_test08_2 )
write.csv(Freq_test08, "Freq_test08.csv")


#write to EXCEL
install.packages("writexl")
library("writexl")
write_xlsx(the dataframe name,"path to store the Excel file/file name.xlsx")
write_xlsx(Freq_test08,"/Users/georgenee/Documents/AIHS/AIHS/Freq_test08.xlsx")


#KWIC(keyword-in-Context)
#擷取"百年未有之大變局"前後共10個詞。
tokss <- tokens(test08$new_seg, what="fastestword")
KWICT8<-kwic(tokss, pattern = "百年未有之大變局", valuetype = "glob", window = 10)
#patter=關鍵詞
#valuetype=資料種類。通常使用詞典的，採用"glob"
#window=前後Ｎ個字元

View(KWICT8)
KWICT8$prekeypost<-paste(KWICT8$pre,KWICT8$keyword, KWICT8$post, sep=" ")
#將KWICT8這個檔案中的3個column進行合併。注意，合併時必須空一個space，所以sep=" "
KWICT8<-tibble(KWICT8)
#tibble是類似於data.frame形式的格式，比較靈活運用。
View(KWICT8)


##7_3 Visualization I
##利用quanteda繪製簡單的社群網絡圖
install.packages("quanteda.textmodels")
library(quanteda.textmodels)

install.packages("quanteda.textplots")
library(quanteda.textplots)

install.packages("showtext")
library(showtext)



toks_news <- tokens(KWICT8$prekeypost, what = "fastestword")
dfmat_news <- dfm(toks_news)
dfmat_news <- dfm_remove(dfmat_news, min_nchar = 2,  
                         pattern = c(stopwords("en"), "*-time", "updated-*", "gmt", "bst"))
dfmat_news <- dfm_trim(dfmat_news, min_termfreq = 2)
topfeatures(dfmat_news)
ndoc(dfmat_news)
nfeat(dfmat_news)
fcmat_news <- fcm(dfmat_news)
dim(fcmat_news)
write.csv(fcmat_news, "fsmat_news.csv")
View(fcmat_news)

install.packages("ggplot2")
library(ggplot2)

set.seed(01673)
feat <- names(topfeatures(fcmat_news, 52))
size <- log(colSums(dfm_select(dfmat_news, feat, selection = "keep")))

#圖一
fcm_select(fcmat_news, pattern = feat) %>%
  textplot_network(min_freq = 0.9, omit_isolated=TRUE, edge_color = "#afe8f0", vertex_color = "grey", vertex_labelcolor ="black",edge_alpha = 0.8)

#圖二
set.seed(01673)
fcm_select(fcmat_news, pattern = feat) %>%
  textplot_network(min_freq = 0.8,omit_isolated=TRUE, edge_color = "#5388bd", vertex_color = "#4D4D4D", edge_alpha = 0.8 )
showtext_auto()

#圖三 稀疏矩陣dgTMatrix/generalMatrix
sim <- textstat_proxy(dfmat_news, margin = "features")
textplot_network(quanteda:::as.fcm(as(sim, "dgTMatrix")), min_freq = 0.9)
textplot_network(quanteda:::as.fcm(as(sim, "generalMatrix")), min_freq = 0.9)



#工作結束前，刪除不在需要的暫存值，以及維持時時存檔的習慣，
#以免因毛孩踩踏鍵盤、停電等無預警不可抗力因素而導致工作成果毀損。
## tip 1. Too many files in the storage? just remove files of no use. 
rm(gender, df, Test01, Test02, Test03)
### tip 2. SAVE them before the tea breaks!!  
# NOT RUN until U fill in.  save.images("請在這裡填入您命名的檔名.RData")
# NOT RUN until U fiil in.  save.images("nameofthefile.RData")