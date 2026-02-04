--CREATE TABLE portfolio_risk (
    loan_id VARCHAR(10),
    customer_id VARCHAR(10),
    product_type VARCHAR(10),
    sector VARCHAR(50),
    origination_date DATE,
    maturity_date DATE,
    loan_amount DECIMAL(18,2),
    outstanding_balance DECIMAL(18,2),
    interest_rate DECIMAL(5,2),
    credit_score INT,
    pd DECIMAL(5,2),
    lgd DECIMAL(5,2),
    ead DECIMAL(18,2),
    risk_grade CHAR(1),
    days_past_due INT,
    loan_status VARCHAR(20),
    region VARCHAR(50),
    collateral_type VARCHAR(20),
    collection_status VARCHAR(20),
    recovery_amount DECIMAL(18,2)
);

SELECT*
FROM
 portfolio_risk


 INSERT INTO portfolio_risk VALUES
('L001','C1001','Loan','Manufacturing','2021-03-15','2026-03-15',500000,320000,14.5,720,2.1,35,320000,'A',0,'Performing','Lagos','Secured','Normal',0),
('L002','C1002','Lease','Transportation','2020-06-10','2025-06-10',750000,410000,16.2,680,4.5,45,410000,'B',15,'Watchlist','Abuja','Asset-backed','Soft',0),
('L003','C1003','Loan','Retail','2019-11-01','2024-11-01',300000,90000,18.0,610,7.8,55,90000,'C',45,'Watchlist','Lagos','Unsecured','Soft',12000),
('L004','C1004','Loan','Energy','2018-02-20','2023-02-20',1200000,0,13.0,750,1.5,30,0,'A',0,'Closed','Port Harcourt','Secured','Normal',0),
('L005','C1005','Lease','Agriculture','2022-01-05','2027-01-05',450000,390000,17.5,640,6.2,50,390000,'C',60,'Default','Kaduna','Asset-backed','Legal',85000),
('L006','C1006','Loan','Healthcare','2021-08-18','2026-08-18',600000,480000,15.0,700,3.0,40,480000,'B',10,'Watchlist','Lagos','Secured','Soft',0),
('L007','C1007','Loan','Construction','2020-09-30','2025-09-30',900000,670000,19.0,590,9.4,60,670000,'D',90,'Default','Ibadan','Unsecured','Legal',110000),
('L008','C1008','Lease','Logistics','2023-04-12','2028-04-12',350000,330000,16.0,710,2.8,38,330000,'B',0,'Performing','Onitsha','Asset-backed','Normal',0),
('L009','C1009','Loan','ICT','2022-07-25','2027-07-25',800000,710000,14.0,740,1.9,32,710000,'A',0,'Performing','Lagos','Secured','Normal',0),
('L010','C1010','Loan','Hospitality','2019-05-10','2024-05-10',550000,120000,20.0,600,8.6,58,120000,'D',75,'Default','Calabar','Unsecured','Legal',40000),
('L011','C1011','Lease','Manufacturing','2021-12-01','2026-12-01',650000,540000,15.8,690,4.0,42,540000,'B',20,'Watchlist','Aba','Asset-backed','Soft',0),
('L012','C1012','Loan','Wholesale','2020-01-20','2025-01-20',700000,0,13.5,760,1.2,28,0,'A',0,'Closed','Kano','Secured','Normal',0),
('L013','C1013','Loan','Education','2022-09-05','2027-09-05',250000,230000,12.5,730,2.5,35,230000,'B',0,'Performing','Ilorin','Secured','Normal',0),
('L014','C1014','Lease','Transportation','2021-04-14','2026-04-14',820000,600000,17.0,650,5.6,48,600000,'C',35,'Watchlist','Abuja','Asset-backed','Soft',0),
('L015','C1015','Loan','Retail','2018-07-01','2023-07-01',400000,0,18.5,580,10.2,65,0,'E',0,'Closed','Lagos','Unsecured','Legal',210000);

SELECT*
FROM
 portfolio_risk


 -- Total records
SELECT COUNT(*) FROM portfolio_risk;

-- Portfolio exposure
SELECT SUM(outstanding_balance) AS total_exposure FROM portfolio_risk;

-- Defaults
SELECT loan_status, COUNT(*) 
FROM portfolio_risk
GROUP BY loan_status;

-- Expected Credit Loss
SELECT
    loan_id,
    sector,
    ead,
    pd,
    lgd,
    (pd/100.0) * (lgd/100.0) * ead AS expected_loss
FROM portfolio_risk;


--Expected Credit Loss by Sector
SELECT
    sector,
    SUM((pd/100.0) * (lgd/100.0) * ead) AS total_expected_loss
FROM portfolio_risk
GROUP BY sector
ORDER BY total_expected_loss DESC;


-- Concentration Risk Analysis

SELECT
    sector,
    SUM(outstanding_balance) AS sector_exposure,
    SUM(outstanding_balance) * 100.0 /
        (SELECT SUM(outstanding_balance) FROM portfolio_risk) 
        AS exposure_pct
FROM portfolio_risk
GROUP BY sector
ORDER BY sector_exposure DESC;
