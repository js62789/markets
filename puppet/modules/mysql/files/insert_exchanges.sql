CREATE TEMPORARY TABLE `markets`.`temp` LIKE `markets`.`company`;

DROP INDEX `PRIMARY` ON `markets`.`temp`;
DROP INDEX `symbol_UNIQUE` ON `markets`.`temp`;

LOAD DATA LOCAL INFILE '/tmp/companylist_nasdaq.csv' 
  INTO TABLE `markets`.`temp` 
  FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
  LINES TERMINATED BY '\n' 
  (`symbol`,`name`,`last_sale`,`market_cap`,@adr_tso,@ipo_year,@sector,@industry,`summary_quote`)
  SET 
    `ipo_year` = IF(@ipo_year = "n/a", NULL, @ipo_year),
    `sector` = IF(@sector = "n/a", NULL, @sector),
    `industry` = IF(@industry = "n/a", NULL, @industry);

LOAD DATA LOCAL INFILE '/tmp/companylist_nyse.csv' 
  INTO TABLE `markets`.`temp` 
  FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
  LINES TERMINATED BY '\n' 
  (`symbol`,`name`,`last_sale`,`market_cap`,@adr_tso,@ipo_year,@sector,@industry,`summary_quote`)
  SET 
    `ipo_year` = IF(@ipo_year = "n/a", NULL, @ipo_year),
    `sector` = IF(@sector = "n/a", NULL, @sector),
    `industry` = IF(@industry = "n/a", NULL, @industry);

LOAD DATA LOCAL INFILE '/tmp/companylist_amex.csv' 
  INTO TABLE `markets`.`temp` 
  FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
  LINES TERMINATED BY '\n' 
  (`symbol`,`name`,`last_sale`,`market_cap`,@adr_tso,@ipo_year,@sector,@industry,`summary_quote`)
  SET 
    `ipo_year` = IF(@ipo_year = "n/a", NULL, @ipo_year),
    `sector` = IF(@sector = "n/a", NULL, @sector),
    `industry` = IF(@industry = "n/a", NULL, @industry);

INSERT INTO `markets`.`company`
SELECT * FROM `markets`.`temp`
ON DUPLICATE KEY UPDATE 
  `name` = VALUES(`name`),
  `last_sale` = VALUES(`last_sale`), 
  `market_cap` = VALUES(`market_cap`),
  `ipo_year` = VALUES(`ipo_year`), 
  `sector` = VALUES(`sector`), 
  `industry` = VALUES(`industry`), 
  `summary_quote` = VALUES(`summary_quote`);

DROP TEMPORARY TABLE `markets`.`temp`;
