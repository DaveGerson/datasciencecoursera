Samsung Data Cleaner Walkthrough
===================
This code performs all analysis steps sequentially

* Identifies the paths used for the data
* Creates vector of all data set and names them
* creates a variable which is used as a combined object to hold the data for processing later.  
	+ The assign function and rbind are used here.
* Names are added to data sets.
* grepl is used to make sure only mean and std variables are used.
* Join in plyr is used to create a vector for y which is made up of the activity names, rather than the ID
* All data sets are combined into a dataframe via the data.frame command
* Columns to filter on are called out for the final file, and then used to aggregate on
* The final file is printed. 
	