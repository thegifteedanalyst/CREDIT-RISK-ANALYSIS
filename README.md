
# Project Overview

This project analyzes a loan portfolio risk dataset using SQL to evaluate credit risk exposure, default trends, and expected losses across different sectors.

Financial institutions manage large portfolios of loans and leases. Understanding risk concentration, probability of default, and expected credit loss (ECL) is critical for maintaining financial stability and regulatory compliance.

In this analysis, SQL was used to explore portfolio exposure, identify high-risk sectors, and estimate potential losses based on Probability of Default (PD), Loss Given Default (LGD), and Exposure at Default (EAD).


# Dataset Description

The dataset contains loan-level information including borrower credit quality, loan characteristics, and repayment status.

Table: portfolio_risk
Column	                    Description
loan_id	                   Unique loan identifier
customer_id	                Unique customer ID
product_type	              Loan or lease product
sector	Industry            sector of borrower
origination_date	          Loan start date
maturity_date	               Loan end date
loan_amount	                Total loan issued
outstanding_balance	          Remaining balance
interest_rate	              Loan interest rate (%)
credit_score	              Borrower credit score
pd	                        Probability of Default (%)
lgd	                        Loss Given Default (%)
ead	                         Exposure At Default
risk_grade	                  Internal risk rating
days_past_due	                   Number of overdue days
loan_status	Performing / Watchlist / Default / Closed
region	Geographic location
collateral_type	Secured / Asset-backed / Unsecured
collection_status	Recovery stage
recovery_amount	Amount recovered after default


## Project Objectives

The analysis focuses on answering key credit risk management questions:

1. What is the total exposure of the portfolio?

2. How many loans are performing, watchlisted, or defaulted?

3. What is the expected credit loss for each loan?

4. Which sectors contribute the highest expected loss?

5. Are there concentration risks across industries?


## 

