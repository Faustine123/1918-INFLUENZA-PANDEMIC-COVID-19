# 1918-INFLUENZA-PANDEMIC-COVID-19
This repository can be found at https://github.com/Faustine123/1918-INFLUENZA-PANDEMIC-COVID-19.git.
     
This repo features a reproduction of Brian Beach et al's paper, The 1918 Influenza Pandemic and Its Lessons for COVID-19. You can reach out the orginial paper at https://www.aeaweb.org/articles?id=10.1257/jel.20201641
     
First run the data cleaning in Script file, this creates the datasets. Then run the bib file for references and citations, then run the qmd file. 
      
The repository is organised as follows:       
**The Input folder**          
All raw data are stored under Input/Data, These data come from the replication package of the Brian Beach et al's paper. And we only put the data we used in this file, and we rename these files.               
Fig1_raw_data original file name: Murray_2006_Estimates.xlsx                
Fig3_raw_data original file name: LOC_Newspapers_Sep18_Dec19.dta           
Fig4_raw_data original file name: Life_Expectancy.dta          
Fig5_raw_data original file name: NBER_Stocks          
        
For fig 2, the data comes from https://data.cdc.gov/NCHS/Provisional-COVID-19-Deaths-by-Sex-and-Age/9bhg-hcku.           
  
Note: the raw data for fig4 is dat file, and we manually convert it to txt file and stored in Output/Data/processed_figure4_data. Since we convert the file format, we consider it as processed data.          

**The Output folder**            
The Output folder coontains data file and paper file.          
    *Data file*         
    The data file contains all the cleaned data for figures. For figure 4, we manually convert the orginial data file to txt file, and stored in processed_figure4_data folder. And we used this folder as raw data for figure 4. The cleaned_figure4_data.csv file is the final cleaned version.         
    *Paper file*        
    The .bib file contains the citations for the raw data, packages and literature used in the report.       
    The rmd file contains the analysis report, as well as the code used to create the report. This code was mainly used to create tables and graphs.        
    The pdf file contains the same analysis report but in pdf form, and without the code.         

         
**The Script folder**         
The Script folder contains data cleaning process for each graph, simulation for each graph and a test for all cleaned data.

