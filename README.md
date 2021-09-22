# IndCol_Restructure
- Repo contains code to restructure data for the Self-Construal (Individualism/Collectivism) scale exported from REDCap
- The original scale labels the subscales as independent and interdependent. For the purposes of this repo, independent statements are labeled as individualism (ind), and interdependent statements are labeled as collectivism (col)
- ***Note for Kendra:*** Do you anticipate our lab investigating this data using horizontal and vertical dimensions of individualism and collectivism? Alejandro let me know that this scale doesn't fit the statements into horizontal and vertical subdivisions, just individualism and collectivism.

## Functions
- icclean(*df*) 
  - input: raw data frame imported from CSV (*icraw_df* in functions script)
    - variable names as columns, separate rows for each participant
    - questions are labeled as (subscale)_(q_number); both the ind and col subscales have 15 questions each
  - output: data frame with subscales in one column and separate columns for each q_number (*ictotal_clean* in functions script)
    - 17 columns: record_id, subscale, one column for each q_number labeled q_(#)
    - each record_id has 2 rows (one for each subscale)
- icmean(*df*)
  - calculates mean subscale scores for each record_id
  - input: clean data frame from icclean(*df*)'s output
  - output: data frame with means for each subscale (*ictotal_mean* in functions script)
    - 3 columns: record_id, ind, and col
    - each record_id has 1 row
    - mean values are rounded to 2 decimal places
